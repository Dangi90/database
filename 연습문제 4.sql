#연습문제4 

CREATE DATABASE Theater;
CREATE USER 'Theater'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES on Theater.* TO 'Theater'@'%';
FLUSH PRIVILEGES;

#실습 4-2
use theater;
CREATE TABLE Movies (
		movie_id 	int			NOT NULL 	AUTO_INCREMENT,
        title 		VARCHAR(30)	NOT NULL,
        genre		VARCHAR(10)	NOT NULL,
        release_date	date	NOT NULL,
        Primary KEY (movie_id)
        );
        
CREATE TABLE Customers	(
		customer_id	INT			NOT NULL	AUTO_INCREMENT,
        name		VARCHAR(20)	NOT NULL,
        email		VARCHAR(50)	NOT NULL,
        phone	    VARCHAR(13) NOT NULL,
        PRIMARY KEY (customer_id)
        );
        
CREATE TABLE Bookings	(
		booking_id	INT			NOT NULL,
        customer_id	INT			NOT NULL,
        movie_id	INT			not NULL,
        num_tickets	int			NOT NULL,
        booking_date	DATETIME,
        PRIMARY KEY (booking_id)
        );

#실습 4-3
INSERT INTO Movies (title, genre, release_date) VALUES
		('쇼생크의 탈출' , '드라마', '1994-10-14'),
        ( '타이타닉' , '로맨스', '1997-03-24'),
        ( '탑건' , '액션', '1987-07-16'),
        ( '쥬라기공원' , '액션', '1994-02-11'),
        ( '글래디에이터' , '액션', '2000-05-03'),
        ( '시네마천국' , '드라마', '1995-04-12'),
        ( '미션임파서블' , '액션', '1995-11-11'),
        ( '노트북' , '로맨스', '2003-08-23'),
        ( '인터스텔라' , 'SF', '2011-05-26'),
        ( '아바타' , 'SF', '2010-02-10');
        
INSERT INTO Customers (`name`, email, phone) VALUES
		('김유신' , 'kys@example.com', '010-1234-1001'),
		('김춘추' , 'kcc@example.com', '010-1234-1002'),
        ('장보고' , 'jbg@example.com', '010-1234-1003'),
        ('강감찬' , 'kgc@example.com', '010-1234-1004'),
        ('이순신' , 'lss@example.com', '010-1234-1005');
        
INSERT INTO Bookings (booking_id, customer_id, movie_id, num_tickets, booking_date) values
		(101, 1 , 1, 2, '2023-01-10 00:00:00'),
        (102, 2 , 2, 3, '2023-01-11 00:00:00'),
        (103, 3 , 2, 2, '2023-01-13 00:00:00'),
        (104, 4 , 3, 1, '2023-01-17 00:00:00'),
        (105, 5 , 5, 2, '2023-01-21 00:00:00'),
        (106, 3 , 8, 2, '2023-01-21 00:00:00'),
        (107, 1 , 10, 4, '2023-01-22 00:00:00'),
        (108, 2 , 9, 1, '2023-01-23 00:00:00'),
        (109, 5 , 7, 2, '2023-01-23 00:00:00'),
        (110, 3 , 4, 2, '2023-01-23 00:00:00'),
        (111, 1 , 6, 1, '2023-01-24 00:00:00'),
        (112, 3 , 5, 3, '2023-01-25 00:00:00');
        
#실습 4-4
SELECT title FROM movies;

#실습 4-5
SELECT * FROM movies Where genre = '로맨스';

#실습 4-6
SELECT title, release_date
FROM Movies WHERE year(release_date) >= 2010;

#실습 4-7
SELECT booking_id, booking_date FROM bookings
WHERE num_tickets >= 3;

#실습 4-8
SELECT * FROM bookings WHERE booking_date <= '2023-01-20';

#실습 4-9
SELECT * FROM movies Where release_date BETWEEN '1990-01-01' AND '1999-12-31';

#실습 4-10
SELECT * FROM Bookings
ORDER BY booking_date DESC
LIMIT 3;

#실습 4-11
SELECT title , release_date FROM Movies
order by release_date ASC
limit 1;

#실습 4-12
SELECT CONCAT(title, ' - ', release_date) as movie_info
FROM movies
where `title` like '%공원%'
ORDER BY release_date asc
limit 1;

#실습 4-13
SELECT booking_date, title
FROM Bookings AS a
Join Movies AS b
#ON a.movie_id = b.movie_id
USING(movie_id)
WHERE customer_id=2;

#실습 4-14
SELECT
	name,
    phone,
    booking_date,
    title
FROM bookings B
Join customers C ON b.customer_id = c.customer_id
Join Movies M on b.movie_id = m.movie_id;

#실습 4-15
SELECT
	m.genre,
    avg(b.num_tickets) as AVG_tickets
FROM bookings B
JOIN movies M on b.movie_id = m.movie_id
GROUP BY m.genre;

#실습 4-16
SELECT 
	C.name,
    AVG(B.num_tickets) AS avg_tickets
FROM Bookings B
Join customers C ON b.customer_id = c.customer_id
GROUP by c.name;

#실습 4-17
SELECT 
	C.name,
    SUM(B.num_tickets) as '전체 예매 티켓 수'
FROM bookings B
Join customers C ON b.customer_id = c.customer_id
GROUP BY name
ORDER BY '전체 예매 티켓 수' DESC;

#실습 4-18
SELECT
	booking_id,
    movie_id,
    name,
    booking_date
FROM Bookings B
Join customers C ON b.customer_id = c.customer_id
ORDER BY B.booking_date ASC
Limit 1;

#실습 4-19
SELECT 
	genre, title, release_date
FROM Movies
WHERE (genre, release_date) in(
	SELECT genre, Max(release_date)
    FROM Movies
    GROUP BY Genre
);

#실습 4-20
SELECT * FROM MOvies
WHERE movie_id in(
	SELECT movie_id FROM Bookings
    WHERE customer_id = (SELECT customer_id FROM CUstomers Where name='김유신')
);
#실습 4-21
SELECT name, email FROM customers
WHERE customer_id = (
	SELECT customer_id
    FROM Bookings
    GROUP BY customer_id
    ORDER BY SUM(num_tickets) DESC
    Limit 1
);
#실습 4-22
SELECT * FROM bookings
WHERE num_tickets > (SELECT avg(num_tickets) From Bookings);

#실습 4-23
SELECT 
	M.title , SUm(B.num_tickets) AS total_tickets
FROM bookings B
Join Movies M on b.movie_id = m.movie_id
GROUP BY title;

#실습 4-24
SELECT 
	c.name,
    SUM(b.num_tickets) AS total_tickets,
    avg(b.num_tickets) AS avg_tickets
FROM bookings b
Join customers C ON b.customer_id = c.customer_id
GROUP BY name;

#실습 4-25
SELECT 
	c.customer_id
    `name`,
    email,
    SUM(b.num_tickets) as '예매 티켓수'
FROM Bookings b
Join customers C ON b.customer_id = c.customer_id
GROUP BY c.customer_id
ORDER by '예매 티켓수' DESC;
    
#실습 4-26
SELECT
	name,
    title,
    num_tickets,
    booking_date
FROM bookings b
Join customers C ON b.customer_id = c.customer_id
Join Movies M on b.movie_id = m.movie_id
Order by num_tickets desc;

#실습 4-27
SELECT 
	M.title,
    M.genre,
    sum(b.num_tickets) AS '예매 티켓 수',
    avg(b.num_tickets) AS '평균 티켓 수'
FROM bookings B
Join Movies M on b.movie_id = m.movie_id
WHERE M.genre = '액션'
GROUP BY title
ORDER BY '평균 티켓 수' DESC;

#실습 4-28
SELECT 
	B.customer_id,
    C.name,
    SUM(NUM_tickets) AS 'ticket_total'
FROM bookings b
Join customers C ON b.customer_id = c.customer_id
GROUP BY customer_id
ORDER BY ticket_total desc;

#실습 4-29
SELECT 
	B.booking_id,
    B.customer_id,
    B.movie_id,
    MaxTickets.max_tickets
FROM Bookings B
Join(
	SELECT movie_id , MAX(NUM_tickets) as max_tickets
    FROM Bookings
    GROUP BY movie_id 
) As MAxtickets
ON B.movie_id = MAxtickets.movie_id AND b.num_tickets = MAxtickets.max_tickets;

#실습 4-30
SET SESSION sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
SELECT 
	b.booking_id,
    B.customer_id,
    C.`name`,
    M.title,
    M.genre,
    SUm(B.num_tickets) AS '예매 티켓 수'
FROM bookings B
Join customers C ON b.customer_id = c.customer_id
Join Movies M on b.movie_id = m.movie_id
GROUP BY M.title
Having '예매 티켓 수' = (
	SELECT MAx(total_tickets)
    FROM(
			SELECT sum(b2.num_tickets) AS total_tickets
            FROM bookings b2
            Join Movies M2 On b2.movie_id = m2.movie_id
            where m2.genre = m.genre
            group by m2.title
		)AS SelectMAX
	)
ORDER BY '예매 티켓 수' DESC;
        

        