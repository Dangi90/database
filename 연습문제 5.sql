#연습문제 5

#실습5-1
CREATE database BookStore;
CREATE user 'bookstore'@'%' IDENTIFIED by '1234';
GRANT all PRIVILEGES on Theater.* to 'bookstore'@'%';
FLUSH PRIVILEGES;
SET SESSION sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

#실습 5-2
use BookStore;
CREATE TABLE Customer (
		custId		int		not null AUTO_INCREMENT,
        name		varchar(10)		not null,
        address		varchar(20),
        phone		varchar(13),
        PRIMARY KEY (custId)
        );
        
CREATE TABLE Book (
		bookId		int		not null AUTO_INCREMENT,
        bookName	varchar(20)		not null,
        publisher		varchar(20)		not null,
        price		int				default null,
        PRIMARY KEY (bookId)
        );
        
CREATE TABLE `Order` (
		orderId		int		not null AUTO_INCREMENT,
        custId		int		not null,
        bookId		int		not null,
        saleprice	int		not null,
        orderDate	date	not null,
        PRIMARY KEY (orderId)
        );
        
#실습 5-3
INSERT INTO Customer (name, address, phone) VALUES
( '박지성', '영국 맨체스터', '000-5000-0001'),
( '김연아', '대한민국 서울', '000-6000-0001'),
( '장미란', '대한민국 강원도', '000-7000-0001'),
( '추신수', '미국 클리블랜드', '000-8000-0001'),
( '박세리', '대한민국 대전', NULL);

INSERT INTO Book (bookname, publisher, price) VALUES
( '축구의 역사', '굿스포츠', 7000),
( '축구아는 여자', '나무수', 13000),
( '축구의 이해', '대한미디어', 22000),
( '골프 바이블', '대한미디어', 35000),
( '피겨 교본', '굿스포츠', 8000),
( '역도 단계별기술', '굿스포츠', 6000),
( '야구의 추억', '이상미디어', 20000),
( '야구를 부탁해', '이상미디어', 13000),
( '올림픽 이야기', '삼성당', 7500),
( 'Olympic Champions', 'Pearson', 13000);

INSERT INTO `Order` (custid, bookid, saleprice, orderdate) VALUES
( 1, 1, 6000, '2014-07-01'),
( 1, 2, 21000, '2014-07-03'),
( 2, 3, 8000, '2014-07-07'),
( 3, 4, 6000, '2014-07-07'),
( 3, 5, 20000, '2014-07-09'),
( 4, 6, 12000, '2014-07-11'),
( 5, 7, 13000, '2014-07-12'),
( 5, 8, 12000, '2014-07-13'),
( 5, 9, 7000, '2014-07-14'),
( 5, 10, 13000, '2014-07-15');

#실습 5-4
SELECT custId , name, address FROM customer;

#실습 5-5
SELECT bookName , price FROM Book;

#실습 5-6
SELECT price , booKNAME FROM BOok;

#실습 5-7
SELECT bookId, bookName, publisher, price FROM Book;

#실습 5-8
SELECT publisher FROM book;

#실습 5-9
SELECT DISTINCT publisher FROM book;

#실습 5-10
SELECT bookId, bookName, publisher, price FROM Book WHere price >= 20000;

#실습 5-11
SELECT bookId, bookName, publisher, price FROM Book WHere price < 20000;

#실습 5-12
SELECT bookId, bookName, publisher, price FROM Book WHere price >= 10000 AND price <=20000;

#실습 5-13
SELECt bookId, bookName, price FROM book WHERE price between 15000 and 30000;

#실습 5-14
SELECT * FROM book WHERE bookId = 2 or bookId = 3 or bookId = 5;

#실습 5-15
SELECT * FROM book WHERE bookId & 2 <> 0;

#실습 5-16
SELECT * FROM customer WHERE name like '박%';

#실습 5-17
SELECT * FROM customer WHERE address like '대한민국%';

#실습 5-18
SELECT * FROM customer WHERE phone is not null;

#실습 5-19
SELECT * FROM book WHERE publisher = '굿스포츠' or publisher = '대한미디어';

#실습 5-20
SELECT publisher FROM book WHERE bookName = '축구의 역사';

#실습 5-21
SELECT publisher FROM book WHERE bookName like '%축구%';

#실습 5-22
SELECT * FROM book WHERE bookname like '_구%';

#실습 5-23
SELECT * FROM book WHeRE (price >= 20000) AND (bookName like '%축구%');

#실습 5-24
SELECT * FROM book ORDER BY bookname asc;

#실습 5-25
SELECT * FROM book ORDER BY price asc , bookname asc;

#실습 5-26
SELECT * FROM book ORDER BY price desc, publisher asc;

#실습 5-27
SELECT * FROM book ORDER by Price DESC limit 3;

#실습 5-28
SELECT * FROM book ORDER by Price limit 3;

#실습 5-29
SELECT SUM(saleprice) as '총 판매액' FROM `order`;

#실습 5-30 
SELECT 
	SUM(saleprice) as '총 판매액',
    AVG(saleprice) as '평균값',
    MIN(Saleprice) as '최저가',
    MAX(saleprice) as '최고가'
    FROM `order`;
  
#실습 5-31  
SELECT count(*) as 판매건수 FROM `order`;
     
#실습 5-32       
SELECT * REPLACE(bookname, '야구', '농구') as BooKName, publisher, price FROM book;

#실습 5-33       
SELECT c.custId , count(O.custId) as '수량' 
FROM customer AS C 
JOIN `order` AS O 
ON C.custId = O.custId
where o.saleprice >= 8000
GROUP by c.custId
HAVING '수량'>=2;

#실습 5-34    
SELECT * FROM customer C JOIN `order` O ON C.custId = O.custId;
   
#실습 5-35
SELECT * FROM customer C JOIN `order` O ON C.custId = O.custId ORDER BY c.custId;
       
#실습 5-36       
SELECT c.name , o.saleprice FROM customer C JOIN `ORDER` O ON C.custid = O.custId;

#실습 5-37  
SELECT c.name , SUM(o.saleprice) as 'SUM(saleprice)' 
FROM customer AS C 
JOin `order` AS O
On c.custId = o.custId
Group by `name`;

#실습 5-38
SELECT c.name, b.bookName 
FROM customer as C 
JOIN `order` as o ON c.custid = o.custid
JOIN book as B ON o.bookid = b.bookid ;

#실습 5-39
SELECT c.name, b.bookName 
FROM customer as C 
JOIN `order` as o ON c.custid = o.custid
JOIN book as B ON o.bookid = b.bookid 
WHERE b.price >= 20000;

#실습 5-40       
#실습 5-41   
SELECT SUM(o.saleprice) AS '총매출' FROM `order` o 
JOIN customer C
ON o.custId = c.custId 
WHERE o.name = '김연아';

#실습 5-42 
SELECT bookName FROM book ORDER by price desc limit 1;     

#실습 5-43       
SELECT name FROM Customer as A
JOIN `order` as B ON a.custID = b.custID
WHERE orderId is Null;

#실습 5-44       
#실습 5-45       
#실습 5-46       

        
        