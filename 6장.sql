# 날짜 : 24/07/05
# 이름 : 박준우
# 내용 : 6장 SQL 고급

use studydb

CREATE TABLE Customer (
    custId VARCHAR(10) PRIMARY KEY,
    name VARCHAR(50),
    hp VARCHAR(15),
    addr VARCHAR(100),
    rdate DATE
);

CREATE TABLE Product (
    prodNo INT PRIMARY KEY,
    prodName VARCHAR(50),
    stock INT,
    price INT,
    company VARCHAR(50)
);

CREATE TABLE Order (
    orderNo INT PRIMARY KEY,
    orderId VARCHAR(10),
    orderProduct INT,
    orderCount INT,
    orderDate DATETIME,
    FOREIGN KEY (orderId) REFERENCES Customer(custId),
    FOREIGN KEY (orderProduct) REFERENCES Product(prodNo)
);

INSERT INTO Customer (custId, name, hp, addr, rdate) VALUES
('c101', '김유신', '010-1234-1001', '경남 김해시', '2023-01-01'),
('c102', '김춘추', '010-1234-1002', '경남 강주시', '2023-01-02'),
('c103', '장보고', '010-1234-1003', '전남 완도군', '2023-01-03'),
('c104', '강감찬', '010-1234-1004', '서울시 관악구', '2023-01-04'),
('c105', '이순신', '010-1234-1005', '부산시 금정구', '2023-01-05');

INSERT INTO Product (prodNo, prodName, stock, price, company) VALUES
(1, '새우깡', 5000, 1500, '농심'),
(2, '초코파이', 2500, 2500, '오리온'),
(3, '포카칩', 3600, 1700, '오리온'),
(4, '양파링', 1250, 1800, '농심'),
(5, '죠리퐁', 2000, NULL, '크라운');

INSERT INTO Order (orderNo, orderId, orderProduct, orderCount, orderDate) VALUES
(1, 'c102', 3, 2, '2023-01-01 13:15:10'),
(2, 'c101', 4, 1, '2023-01-01 13:15:12'),
(3, 'c103', 2, 3, '2023-01-01 13:15:14'),
(4, 'c105', 1, 5, '2023-01-01 13:15:16'),
(5, 'c105', 3, 2, '2023-01-01 13:15:18');

