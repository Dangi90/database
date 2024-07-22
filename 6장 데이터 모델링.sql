#날짜 : 24/015
#이름 : 박준우
#내용 : 데이터 모델링 실습하기

#실습 6-1
use shopERD;
#실습 6-2
INSERT into customercustomer (custId, name, hp, addr, rdate) VALUES
	('c101', '김유신', '010-1234-1001', '경남 김해서' , '2023-01-01'),
    ('c102', '김춘추', '010-1234-1002', '경남 경주시' , '2023-01-02'),
    ('c103', '장보고', '010-1234-1003', '경남 완도군' , '2023-01-03'),
    ('c104', '강감찬', '010-1234-1004', '서울시 관악구' , '2023-01-04'),
    ('c105', '이순신', '010-1234-1005', '부산시 금정구' , '2023-01-01');
    
INSERT into product (prodNo, prodName, stock, price, comapny) VALUES
	('1', '새우깡', 5000, 1500 , '농심'),
    ('2', '초코파이', 2500, 2500 , '오리온'),
    ('3', '포카칩', 3600, 1700 , '오리온'),
    ('4', '양파링', 1250, 1800 , '농심'),
    ('5', '죠리퐁', 2200, NULL , '크라운');
	
INSERT into `order` (orderId, orderProduct, orderCount, orderDate) VALUES
	('c102', 3 , 2, '2023-01-01 13:15:13'),
    ('c101', 4 , 1, '2023-01-01 13:15:12'),
    ('c102', 1 , 1, '2023-01-01 13:15:14'),
   # ('c103', 6 , 5, '2023-01-01 13:15:16'),
    ('c105', 2 , 1, '2023-01-01 13:15:18');
    
#실습 6-3
SELECT * FROM `ORDER` O JOIN customer C on c.custID = o.orderID;

SELECT * FROM product P 
JOIN `order` O on p.prodNo = o.orderNO
JOIN customer C on c.custID = o.orderID
WHERE NAme = '김유신'; 

select 
	SUM(`price` * `orderCount`)
from `Order` as a
join `Product` as b on a.orderProduct = b.prodNo;


	
    
#실습 6-4
use bankERD;
INSERT INTO bank_customer (c_no, c_name, c_dist, c_phone, c_addr) VALUES
('730423-1000001', '김유신', 1, '010-1234-1001', '경남 김해시'),
('730423-1000002', '김춘추', 1, '010-1234-1002', '경남 경주시'),
('750423-1000003', '장보고', 1, '010-1234-1003', '전남 완도군'),
('102-12-51094', '(주)정보산업', 2, '051-500-1004', '부산시 부산진구'),
('930423-1000005', '이순신', 1, '010-1234-1005', '서울 종로구');

INSERT INTO bank_account (a_no, a_item_dist, a_item_name, a_c_no, a_balance, a_open_date) VALUES
('101-11-1001', 'S1', '자유저축예금', '730423-1000001', 1550000, '2011-04-11'),
('101-11-1002', 'S1', '자유저축예금', '930423-1000005', 260000, '2011-05-12'),
('101-11-1003', 'S1', '자유저축예금', '750423-1000003', 75000, '2011-06-13'),
('101-12-1001', 'S2', '기업전용예금', '102-12-51094', 15000000, '2011-07-14'),
('101-13-1001', 'S3', '정기저축예금', '730423-1000002', 1200000, '2011-08-15');

INSERT INTO bank_transaction (t_no, t_a_no, t_dist, t_amount, t_datetime) VALUES
(1, '101-11-1001', 1, 50000, '2023-01-01 13:15:10'),
(2, '101-11-1001', 2, 1000000, '2023-01-02 13:15:12'),
(3, '101-11-1002', 3, 260000, '2023-01-03 13:15:14'),
(4, '101-12-1001', 2, 100000, '2023-01-04 13:15:16'),
(5, '101-11-1003', 1, 75000, '2023-01-05 13:15:18'),
(6, '101-11-1001', 1, 150000, '2023-01-05 13:15:28');

#실습 6-6
SELECT c_no, c_name, c_phone, a_no, a_item_name, a_balance
FROM bank_customer as C
Join bank_account as A
ON  c.c_no = a.a_c_no;

SELECT t_a_no , t__dist, t_amount, t_datetime
FROM  bank_transaction T
JOIN  bank_account as A ON  t.t_a_no = a.a_no
JOIN  bank_customer as C on  c.c_no = a.a_c_no
WHERE c.c_name = '이순신';

select 
	`c_no`,
    `c_name`,
    `a_no`,
    `a_balance`,
    `a_open_date`
from `bank_customer` as a 
join `bank_account` as b on a.c_no = b.a_c_no
WHERE c_dist=1
ORDER BY a_balance DESC
limit 1;

#실습6-8
use collegeERD;
INSERT INTO Student (stdNo, stdName, stdHp, stdYear, stdAddress) VALUES
('20201011', '김유신', '010-1234-1001', 3, '경남 김해시'),
('20201122', '김춘추', '010-1234-1002', 3, '경남 경주시'),
('20201213', '장보고', '010-1234-1003', 2, '전남 완도군'),
('20210324', '강감찬', '010-1234-1004', 2, '서울 관악구'),
('20220415', '이순신', '010-1234-1005', 1, '서울 종로구');

INSERT INTO Lecture (lecNo, lecName, lecCredit, lecTime, lecClass) VALUES
(101, '컴퓨터과학 개론', 2, 40, '본301'),
(102, '프로그래밍 언어', 3, 52, '본302'),
(103, '데이터베이스', 3, 56, '본303'),
(104, '자료구조', 3, 60, '본304'),
(105, '운영체제', 3, 52, '본305');

INSERT INTO Register (regStdNo, regLecNo, regMidScore, regFinalScore, regTotalScore, regGrade) VALUES
('20220415', 101, 60, 30, NULL, NULL),
('20210324', 103, 54, 36, NULL, NULL),
('20201011', 105, 52, 28, NULL, NULL),
('20220415', 105, 38, 40, NULL, NULL),
('20210324', 104, 56, 32, NULL, NULL),
('20201213', 103, 48, 40, NULL, NULL);

#실습 6-9
SELECT 	
	`stdNo`,
    `stdName`,
    `stdHp`,
    `stdYear` 
FROM STUDENT S 
left JOIN REGISTER R ON S.stdNo = R.regStdNo 
WHERE `regStdNo` is null;

select 
	`regStdNo`, 
    `regLecNo`, 
    `regMidScore`,
    `regFinalScore`,
    `regMidScore` + `regFinalScore` as `합`,
    case
		when (`regMidScore` + `regFinalScore` >= 90) then 'A'
		when (`regMidScore` + `regFinalScore` >= 80) then 'B'
		when (`regMidScore` + `regFinalScore` >= 70) then 'C'
		when (`regMidScore` + `regFinalScore` >= 60) then 'D'
	else 'F'
    end as `등급`
from `Register`;

SELECT stdNO, stdName, stdYear, lecName, regMidScore, regFinalScore,   
		`regMidScore` + `regFinalScore` as `합`,
    case
		when (`regMidScore` + `regFinalScore` >= 90) then 'A'
		when (`regMidScore` + `regFinalScore` >= 80) then 'B'
		when (`regMidScore` + `regFinalScore` >= 70) then 'C'
		when (`regMidScore` + `regFinalScore` >= 60) then 'D'
	else 'F'
    end as `등급`
FROM student as s
Join register as r on s.stdNO = r.regStdNo
Join lecture as l on l.lecNo = r.regLecNo
WHERE stdYear = 2;

select 
	`stdNo`,
    `stdName`,
    `stdYear`,
    `lecName`,
    `regMidScore`,
    `regFinalScore`,
    `regTotalScore`,
    `regGrade`
from `Student` as a
join `Register` as b on a.stdNo = b.regStdNo
join `Lecture` as c on b.regLecNo = c.lecNo
where `stdYear` = 2;





	