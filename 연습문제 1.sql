#날짜 : 24/07/08
#이름 : 박준우
#내용 : SQL 연습문제1 실습하기

#실습1-1
create database `shop`;
#create user 'shop'@'%' identified by '1234';
#grant all privileges on shop.* to 'shop'@'%';
flush privileges;

#실습1-2
use shop;
-- Create Customer Table
CREATE TABLE Customer (
    custId VARCHAR(10) NOT NULL,
    name VARCHAR(10) NOT NULL,
    hp VARCHAR(13),
    addr VARCHAR(100),
    rdate DATE NOT NULL,
    PRIMARY KEY (custId)
);

-- Create Product Table
CREATE TABLE Product (
    prodNo INT NOT NULL,
    prodName VARCHAR(10) NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    price INT,
    company VARCHAR(20) NOT NULL,
    PRIMARY KEY (prodNo)
);

-- Create Order Table
CREATE TABLE `Order` (
    orderNo INT NOT NULL AUTO_INCREMENT,
    orderId VARCHAR(10) NOT NULL,
    orderProduct INT NOT NULL,
    orderCount INT NOT NULL DEFAULT 1,
    orderDate DATEtime NOT NULL,
    PRIMARY KEY (orderNo)
);

#실습1-3
-- Insert data into Customer Table
INSERT INTO Customer (custId, name, hp, addr, rdate) VALUES
('c101', '김유신', '010-1234-1001', '김해시 봉황동', '2022-01-01'),
('c102', '김춘추', '010-1234-1002', '경주시 보문동', '2022-01-02'),
('c103', '장보고', '010-1234-1003', '완도군 청산면', '2022-01-03'),
('c104', '강감찬', '010-1234-1004', '서울시 마포구', '2022-01-04'),
('c105', '이성계', NULL, NULL, '2022-01-05'),
('c106', '정철', '010-1234-1006', '경기도 용인시', '2022-01-06'),
('c107', '허준', NULL, NULL, '2022-01-07'),
('c108', '이순신', '010-1234-1008', '서울시 영등포구', '2022-01-08'),
('c109', '송상현', '010-1234-1009', '부산시 동래구', '2022-01-09'),
('c110', '정약용', '010-1234-1010', '경기도 광주시', '2022-01-10');

-- Insert data into Product Table
INSERT INTO Product (prodNo, prodName, stock, price, company) VALUES
(1, '새우깡', 5000, 1500, '농심'),
(2, '초코파이', 2500, 2500, '오리온'),
(3, '포카칩', 3600, 1700, '오리온'),
(4, '양파링', 1250, 1800, '농심'),
(5, '죠리퐁', 2200, NULL, '크라운'),
(6, '마카렛트', 3500, 3500, '롯데'),
(7, '뿌셔뿌셔', 1650, 1200, '오뚜기');

-- Insert data into Order Table
INSERT INTO `Order` (orderId, orderProduct, orderCount, orderDate) VALUES
('c102', 3, 2, '2022-07-01 13:15:10'),
('c101', 4, 1, '2022-07-01 14:16:11'),
('c108', 1, 1, '2022-07-01 17:23:18'),
('c109', 6, 5, '2022-07-02 10:46:36'),
('c102', 2, 1, '2022-07-03 09:15:37'),
('c101', 7, 3, '2022-07-03 12:35:12'),
('c110', 1, 2, '2022-07-03 16:55:36'),
('c104', 2, 4, '2022-07-04 14:23:23'),
('c102', 1, 3, '2022-07-04 21:54:34'),
('c107', 6, 1, '2022-07-05 14:21:03');

#실습1-4
SELECT * FROM `customer`;

#실습1-5
select `custid`, `name`, `hp` from `customer`;

#실습1-6
select * from `product`;

#실습1-7
select `company` from `product`;

#실습1-8
select distinct `company`  from `product`;

#실습1-9
select `prodName`,`price` from `product`;

#실습1-10
select `prodName`, `price`+500 as `조정단가` from `product`;

#실습1-11
select `prodName` , `stock`, `price` from `product` where `company`= '오리온';

#실습1-12
select `orderProduct` , `orderCount`, `orderDate` From `order` where `orderid` = 'c102';

#실습1-13
select `orderProduct`, `orderCount`, `orderDate` From `order` 
where `orderid` = 'c102' and `orderCount` >= 2;

#실습1-14
select * from `product` where `price` >=1000 && `price` <=2000;

#실습1-15
select `custid`, `name`, `hp`, `addr` from `customer` where `name` like '김%';

#실습1-16
select `custid`, `name`, `hp`, `addr` from `customer` where `name` like '__';

#실습1-17
select * from `customer` where `hp` is null;

#실습1-18
select * from `customer` where `addr` is not null;

#실습1-19
select * from `customer` order by `rdate` desc;

#실습1-20
select * from `order` where `ordercount` >= 3 order by `orderCount` desc;

#실습1-21
select avg(price) from `product`;

#실습1-22
select sum(stock) as `재고량 합계` from `product` where `company`='농심';

#실습1-23
select count(custId) as `고객수` from `customer`;

#실습1-24
select count(distinct company) as `제조업체 수 ` from `product`;

#실습1-25
SET SESSION sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
select  `orderProduct` as `주문 상품번호`, sum(`orderCOunt`) as `총 주문수량`  
from `order` group by `orderproduct`;

#실습1-26
select `company` as `제조업체`, count(*) as `제품수`, Max(`price`) as '최고가'
from `product` group by `company`;

#실습1-27
select `company` as `제조업체` , count(*) as `제품수`, max(`price`) as `최고가`
from `product` group by `company` having count(*)>=2 ;

#실습1-28
select `orderProduct` , `orderId`, sum(`orderCount`) as `총 주문수량` 
from `order` group by `orderid`, `orderproduct`;

#실습1-29
select a.orderId, b.prodName from `order` as a
join `product` as b
on a.orderProduct = b.prodNo
where `orderid` = 'c102';

#실습1-30
select `orderid`, `name`, `prodName`, `orderDate` from `order` as a
Join `customer` as b
on a.orderid = b.custid
join `product` as c
on a.orderproduct = c.prodno
where substr(orderdate, 1, 10) = '2022-07-03';
