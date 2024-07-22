#날짜 : 24/07/09
#이름 : 박준우
#내용 : SQL 연습문제2

#실습 2-1
create database `bank`;
create user 'bank'@'%' identified by '1234';
grant all privileges on bank.* to 'bank'@'%';
flush privileges;

#실습 2-2
create table `bank_customer`(
			c_no 	varchar(14) not null,
            c_name	varchar(20) not null, 
            c_dist	int not null default 0,
            c_phone	varchar(20) not null,
            c_addr	varchar(100) default null,
            primary key(c_no),
            unique key(c_phone)
            );
create table `bank_account`(
			a_no		varchar(11) not null,
            a_item_dist	varchar(2) not null,
            a_item_name	varchar(20) not null,
            a_c_no		varchar(14) not null,
            a_balance	int not null default 0,
            a_open_date	date not null,
            primary key(a_no)
            );
create table `bank_transaction` (
			t_no		int not null auto_increment,
            t_a_no		varchar(11) not null,
            t_dist 		int not null,
            t_amount	int not null default 0,
            t_datetime 	datetime not null,
            primary key (t_no)
            );
            
INSERT INTO bank_customer (c_no, c_name, c_dist, c_phone, c_addr) VALUES
('102-22-51094', '부산의원', 2, '051-518-1010', '부산시 남구'),
('220-82-52237', '(주)한국전산', 2, '02-134-1045', '서울시 강서구'),
('361-22-42687', '(주)정보산업', 2, '031-563-1253', '경기도 광명시'),
('730423-1000001', '김유신', 1, '010-1234-1001', '경기도 수원시'),
('750210-1000002', '김춘추', 1, '010-1234-1002', '경기도 광주시'),
('830513-2000003', '선덕여왕', 1, '010-1234-1003', '서울시 마포구'),
('870830-1000004', '강감찬', 1, '010-1234-1004', '서울시 영등포구'),
('910912-2000005', '신사임당', 1, '010-1234-1005', '강원도 강릉시'),
('941127-1000006', '이순신', 1, '010-1234-1006', '부산시 영도구');

INSERT INTO bank_account (a_no, a_item_dist, a_item_name, a_c_no, a_balance, a_open_date) VALUES
('101-11-1001', 'S1', '자유저축예금', '730423-1000001', 420000, '2005-07-21'),
('101-11-1003', 'S1', '자유저축예금', '870830-1000004', 53000, '2007-02-17'),
('101-11-2001', 'S1', '자유저축예금', '220-82-52237', 23000000, '2003-04-14'),
('101-11-2002', 'S1', '자유저축예금', '361-22-51094', 8325010, '2010-06-07'),
('101-12-1001', 'S2', '정기적금예금', '830513-2000003', 1020000, '2011-05-13'),
('101-13-1001', 'S3', '주택청약예금', '941127-1000006', 720800, '2012-10-05'),
('101-21-1004', 'L1', '고객신용대출', '910912-2000005', 1200500, '2009-08-25'),
('101-22-1001', 'L2', '예금담보대출', '102-22-51094', 25000, '2013-12-11'),
('101-23-1007', 'L3', '주택담보대출', '750210-1000002', 2700000, '2020-09-23');

INSERT INTO bank_transaction (t_no, t_a_no, t_dist, t_amount, t_datetime) VALUES
(1, '101-11-1001', 1, 50000, '2022-08-21 04:26:52'),
(2, '101-11-1003', 2, 120000, '2022-08-21 04:26:52'),
(3, '101-11-2001', 2, 300000, '2022-08-21 04:26:52'),
(4, '101-12-1002', 1, 1000000, '2022-08-21 04:26:52'),
(5, '101-11-1001', 3, 0, '2022-08-21 04:26:52'),
(6, '101-13-1005', 1, 200000, '2022-08-21 04:26:52'),
(7, '101-11-2001', 1, 450000, '2022-08-21 04:26:52'),
(8, '101-11-2002', 2, 32000, '2022-08-21 04:26:52'),
(9, '101-11-2003', 3, 0, '2022-08-21 04:26:52'),
(10, '101-11-1003', 1, 75000, '2022-08-21 04:26:52');

#실습 2-4
select * from `bank_account`;

#실습 2-5
select * from `bank_customer`;

#실습 2-6
select * from `bank_transaction`;

#실습 2-7
select `c_name` , `c_no` from `bank_customer`;

#실습 2-8
select `a_item_dist` , `a_item_name` from `bank_account`;

#실습 2-9
SELECT DISTINCT `a_item_dist`, `a_item_name` FROM `bank_account`;

#실습 2-10
SELECT * FROM `bank_account` WHERE `a_item_name` = '자유저축예금' and `a_balance` >= 1000000;

#실습 2-11
SELECT * FROM `bank_customer` WHERE `c_addr` like '경기도%';

#실습 2-12
SELECT * FROM `bank_customer` WHERE `c_dist` != 1;

#실습 2-13
SELECT * FROM `bank_transaction` WHERE `t_dist` = 1;

#실습 2-14
SELECT * FROM `bank_transaction` WHERE `t_dist` = 2 ORDER BY `t_amount`;

#실습 2-15
SELECT 
	sum(`t_amount`) as '입금총함',
    avg(`t_amount`) as '입금평균'
FROM `bank_transaction`
where `t_dist` = 1;

#실습 2-16
SELECT 
	max(t_amount) as '큰 금액',
	min(t_amount) as '작은 금액'
FROM `bank_transaction`
Where `t_dist` = 2;

#실습 2-17
SELECT * FROM `bank_account` WHERE `a_item_dist` = 'S1' ORDER BY `a_balance` desc;

#실습 2-18
SELECT * FROM `bank_account` WHERE `a_item_dist` = 'S1' ORDER BY `a_balance` limit 1;
 #서브쿼리로 작성
SELECT * FROM `bank_account` 
WHERE `a_balance` = (SELECT max(`a_balance`) 
						from `bank_account` 
						where `a_item_dist` = 's1') ;


#실습 2-19
SELECT * FROM `bank_transaction` where `t_dist`='1' OR `t_dist`='2' 
order by `t_dist`, `t_amount` desc;
 #in 활용 
SELECT * FROM `bank_transaction` where `t_dist` in(1,2)
order by `t_dist`, `t_amount` desc;

#실습 2-20
SELECT
	count(case when `t_dist` = 1 then 1 end) as '입금건수',
    count(case when `t_dist` = 2 then 1 end) as '출금건수',
    count(DISTINCT `t_dist` = '3') as '조회건수'
FROM `bank_transaction`;

#실습 2-21
		
#실습 2-22
select t_dist, count(`t_no`) From `bank_transaction` where t_dist ;

#실습 2-23
select `t_a_no` , `t_dist`, sum(`t_amount`)
FROM `bank_transaction`
WHERE `t_dist` =1
group by  `t_a_no`;

#실습 2-24
SELECT 
	`t_a_no`,
    `t_dist`,
    sum(`t_amount`) as '합계'
FROM `bank_transaction`
WHERE `t_dist` = 1
group by `t_a_no`
ORDER BY `합계` DESC;

#실습 2-25
SELECT * FROM `bank_account` as a
JOIN `bank_customer` as b
on a.a_c_no = b.c_no;

#실습 2-26
SELECT
	a_no as '계좌번호',
    a_item_name as '계좌이름',
    a_c_no as '주민번호(사업자번호)',
    c_name as '고객명',
    a_balance as '현재잔액'
FROM `bank_account` as a
join `bank_customer` as b
on a.a_c_no = b.c_no;

#실습 2-27
SELECT * FROM `bank_transaction` as a
join `bank_account` as b
on a.t_a_no = b.a_no;

#실습 2-28

SELECT
	`t_no` as '거래번호',
    `t_a_no` as '계좌번호',
    `a_c_no` as '고객번호(주빈번호)',
    `t_dist` as '거래구분',
    `t_amount` as '거래금액',
    `t_datetime` as '거래일자'
FROM `bank_account` as A
Join `bank_transaction` as b
on a.a_no = b.t_a_no;

#실습 2-29
SELECT
	`t_no`,
    `a_no`,
    `c_no`,
    `t_dist`,
    `a_item_name`,
    `c_name`,
    `t_amount`,
    `t_datetime`
FROM `bank_transaction` as A
JOIN `bank_account` as b on	a.t_a_no = b.a_no 
join `bank_customer` as c on b.a_c_no = c.c_no
WHERE `t_dist` = 1
ORDER BY `t_amount` desc;

#실습 2-30
SET SESSION sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
SELECT
	`t_no`,
    `a_no`,
    `c_no`,
    `t_dist`,
    `a_item_name`,
    `c_name`, count(`t_no`) as '거래건수'
From `bank_transaction` as A
JOIN `bank_account` as b on	a.t_a_no = b.a_no 
join `bank_customer` as c on b.a_c_no = c.c_no
WHERE `t_dist` in(1,2) and `c_dist` = 1
GROUP BY `c_no`
order by `t_dist` , `거래건수` DESC;



