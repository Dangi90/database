use Shopping;

insert into carts(userid,prodno,cartprodcount,cartproddate)
values
('user1' ,100101, 1, '2022-01-10 10:50:12'),
('user1' ,100110, 2, '2022-01-10 10:50:12'),
('user3' ,120103, 1, '2022-01-10 10:50:12'),
('user4' ,130112, 1, '2022-01-10 10:50:12'),
('user5' ,130101, 1, '2022-01-10 10:50:12'),
('user2' ,110101, 3, '2022-01-10 10:50:12'),
('user2' ,160103, 1, '2022-01-10 10:50:12'),
('user2' ,170115, 1, '2022-01-10 10:50:12'),
('user3' ,110101, 1, '2022-01-10 10:50:12'),
('user6' ,130101, 1, '2022-01-10 10:50:12');

insert into orderitems(orderno,prodno,itemprice,itemdiscount,itemcount)
values
('22010210001', 100110, 38000, 15, 1),
('22010210001', 100101, 25000, 20, 1),
('22010210002', 120103, 21000, 10, 3),
('22010310001', 130112, 15000, 0, 1),
('22010310001', 130101, 56000, 0, 2),
('22010210010', 110101, 76000, 5, 1),
('22010310100', 160103, 120000, 0, 1),
('22010410101', 170115, 900000 ,12, 1),
('22010510021', 110101, 76000, 5, 1),
('22010510027', 130101, 56000, 0, 2),
('22010510021', 100101, 25000, 20, 1),
('22010510031', 170115, 900000, 12, 1),
('22010710110', 120103, 21000, 10, 5);

insert into users (userId,userName,userBirth,userGender,userHp,userEmail,userPoint,userLevel,userAddr,userRegDate) values
('user1'  ,'김유신'  ,'1976-01-21' ,'M' ,'010-1101-1976','kimys@naver.com',    0 ,1, '서울', '2022-01-10 10:50:12'),
('user2'  ,'계백'   ,'1975-06-11' ,'M' ,'010-1102-1975', null,                1000, 1, '서울', '2022-01-10 10:50:12'),
('user3'  ,'김춘추'  ,'1989-05-30' ,'M' ,'010-1103-1989', null,             1200, 2, '서울', '2022-01-10 10:50:12'),
('user4'  ,'이사부'  ,'1979-04-13' ,'M' ,'010-2101-1979', 'leesabu@gmail.com', 2600, 1, '서울', '2022-01-10 10:50:12'),
('user5'  ,'장보고'  ,'1966-09-12' ,'M' ,'010-2104-1966', 'jangbg@naver.com',    9400, 4, '대전', '2022-01-10 10:50:12'),
('user6'  ,'선덕여왕' ,'1979-07-28' ,'M' ,'010-3101-1979', 'gueen@naver.com',    1600, 2, '대전', '2022-01-10 10:50:12'),
('user7'  ,'강감찬'  ,'1984-06-15' ,'F' ,'010-4101-1984', 'kang@daum.net',    800, 0, '대구', '2022-01-10 10:50:12'),
('user8'  ,'신사임당' ,'1965-10-21' ,'M' ,'010-5101-1965', 'sinsa@gmail.com',    1500, 1, '대구', '2022-01-10 10:50:12'),
('user9'  ,'이이'    ,'1972-11-28' ,'F' ,'010-6101-1972', 'leelee@nate.com',    3400, 3, '부산', '2022-01-10 10:50:12'),
('user10' ,'허난설헌' ,'1992-09-07' ,'F' ,'010-7103-1992', null,             4100, 3, '광주', '2022-01-10 10:50:12');



insert into Points ( userId, `point`, pointDesc, pointDate) values
('user1', 1000  ,'회원가입 1000 적립'   ,'2022-01-10 10:50:12'),
('user1', 6000  ,'상품구매 5%     적립'   ,'2022-01-10 10:50:12'),
('user3', 2835  ,'상품구매 5%     적립'   ,'2022-01-10 10:50:12'),
('user7', 3610  ,'상품구매 5%     적립'   ,'2022-01-10 10:50:12'),
('user5', 3000  ,'이벤트 응모 3000 적립'   ,'2022-01-10 10:50:12'),
('user2', 1000  ,'회원가입 1000 적립','2022-01-10 10:50:12'),
('user2', 2000  ,'이벤트 응모 2000 적립 '   ,'2022-01-10 10:50:12'),
('user2', 2615  ,'상품구매 5%    적립'   ,'2022-01-10 10:50:12'),
('user3', 1500  ,'이벤트 응모 1500 적립'   ,'2022-01-10 10:50:12'),
('user6', 15840 ,'상품구매 2%    적립'   ,'2022-01-10 10:50:12');

insert into categories (cateNo, cateName) values
(10,'여성의류패션'),
(11,'남성의류패션'),
(12,'식품·생필품'),
(13,'취미·반려견'),
(14,'홈·문구'),
(15,'자동차·공구'),
(16,'스포츠·건강'),
(17,'컴퓨터·가전·디지털'),
(18,'여행'),
(19,'도서');

insert into sellers (sellerNo, sellerBizName,sellerPhone,sellerManager,sellerAddr) values
('10001', '(주)다팔아'       ,'02-201-1976'       ,'정우성' ,'서울'),
('10002', '판매의민족'       ,'02-102-1975'       ,'이정재' ,'서울'),
('10003', '멋남'          ,'031-103-1989'    ,'원빈'  ,'경기'),
('10004', '스타일살아'       ,'032-201-1979'    ,'이나영' ,'경기'),
('10005', '(주)삼성전자'    ,'02-214-1966'       ,'장동건' ,'서울'),
('10006', '복실이옷짱'       ,'051-301-1979'    ,'고소영' ,'부산'),
('10007', '컴퓨존(주)'       ,'055-401-1984'    ,'유재석' ,'대구'),
('10008', '(주)LG전자'    ,'02-511-1965'       ,'강호동' ,'서울'),
('10009', '굿바디스포츠'    ,'070-6101-1972'    ,'조인성' ,'부산'),
('10010', '누리푸드'       ,'051-710-1992'    ,'강동원' ,'부산');

insert into orders(orderno,userid,ordertotalprice,orderaddr,orderstatus,orderdate)
values
('22010210001', 'user2' , 52300  ,'서울시 마포구 121' ,1, '2022-01-10 10:50:12'),
('22010210002', 'user3' , 56700  ,'서울시 강남구 21-1' ,1, '2022-01-10 10:50:12'),
('22010210010', 'user4' , 72200  ,'서울시 강서구 큰대로 38' ,2, '2022-01-10 10:50:12'),
('22010310001', 'user5' , 127000 ,'경기도 광주시 초월로 21' ,1, '2022-01-10 10:50:12'),
('22010310100', 'user1' , 120000 ,'경기도 수원시 120번지' ,0, '2022-01-10 10:50:12'),
('22010410101', 'user6' , 792000 ,'부산시 남구 21-1' ,2, '2022-01-10 10:50:12'),
('22010510021', 'user7' , 92200  ,'부산시 부산진구 56 10층', 4, '2022-01-10 10:50:12'),
('22010510027', 'user8' , 112000 ,'대구시 팔달로 19', 3, '2022-01-10 10:50:12'),
('22010510031', 'user10', 792000 ,'대전시 한밭로 24-1 ',2, '2022-01-10 10:50:12'),
('22010710110', 'user9' , 94500  ,'광주시 충열로 11 ',1, '2022-01-10 10:50:12');

-- 제품 데이터 삽입
INSERT INTO `Shopping`.`Products` 
(`prodNo`, `cateNo`, `sellerNo`, `prodName`, `prodStock`, `prodPrice`, `prodSold`, `prodDiscount`) 
VALUES 
(101001, 11, 10003, '발란타인 L-2XL',	 			869, 25000, 132, 20),
(101010, 10, 10004, '트레이닝 통바지', 				1602, 38000, 398, 15),
(110101, 10, 10003, '신상 여성운동화', 				160, 76000, 40, 5),
(120101, 12, 10010, '암소 1등급 구이세트 1.2kg', 	NULL, 150000, 87, 10),
(120103, 12, 10010, '바르고기 부채살 250g', 		NULL, 21000, 61, 10),
(130101, 13, 10006, '[ANF] 식스프리 강아지 사료', 	58, 56000, 12, 10),
(130106, 13, 10006, '중대형 사계절 강아지옷', 		120, 15000, 80, 5),
(150103, 12, 10006, '라떼 2인 소파/방수 패브릭', 		NULL, 320000, 42, 0),
(170115, 17, 10007, '지포스 3080 그래픽카드',		28, 900000, 12, 0),
(160103, 16, 10009, '치닝디핑 33BR 철봉', 			32, 120000, 28, 0);


#문제 1. 
SELECT userName, prodName, cartprodCount From carts C
Join users U ON u.userid = c.userid
Join products P ON c.prodNo = p.prodNo
Where cartprodCount >=2;

#문제 2.
SELECT prodNo, cateNo, prodName, prodPrice, sellerBizName, sellerPhone 
FROM Products P
JOIN Sellers S On p.sellerNo = s.sellerNo;

#문제3
SELECT userId , userName, userHP, userPoint, userLevel FROm USERS;

#문제4 
SELECT DISTINCT orderNo, u.userId, u.userName, orderTotalPrice, orderDate FRom orders O
JOIN USERS U on u.userId = O.userId
WHERE orderTotalPrice >= 100000 
ORDER BY orderTotalPrice , UserName;

#문제5
SELECT DISTINCT o.orderNo, o.userId, userName, prodName, orderDate From orders O 
JOIN USERS U on u.userId = O.userId
Join orderitems OI  ON oi.orderNo = o.orderNo
Join products P  ON oi.prodNo = p.prodNo;

#문제6
SELECT prodNo, prodName, prodPrice, prodDiscount, prodPrice*((100-prodDiscount)/100) as 할인된가격 From products;

#문제7
SELECT prodNo, prodName, prodPrice, prodStock, SellerManager FROM PRODUCTS P
JOin Sellers S ON p.sellerNo = s.sellerNo
WHERE SEllerManager = '고소영';

#문제8
SELECT sellerNo, sellerBizName, sellerManager, sellerPhone FROM sellers;

use shopping;
#문제9 
SELECT orderNo as '주문번호' , SUM(itemPrice*((100-itemDiscount)/100)*itemCount) as '최종총합' 
From orderitems 
WHERE itemPrice*((100-itemDiscount)/100)*itemCount >= 100000
GROUP BY orderNo ;

#문제10
SELECT distinct u.userName , GROUP_CONCAT(prodName SEPARATOR ',' ) as'상품명' 
FROM Users U
Join Orders O on u.userId = o.userId
Join orderitems OI  ON oi.orderNo = o.orderNo
Join products P  ON oi.prodNo = p.prodNo
WHERE u.userName = '장보고';