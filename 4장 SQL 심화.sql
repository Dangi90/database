# 날짜 : 24/07/03
# 이름 : 박준우
# 내용 : 4장 SQL 고급

use	studydb;
#실습 4-1

CREATE TABLE `Member` (
	`uid`	VARCHAR(10) PRIMARY KEY,
	`name`	VARCHAR(10) NOT NULL,
	`hp`	CHAR(13) UNIQUE NOT NULL,
	`pos`	VARCHAR(10) default '사원',
	`dep`	TINYINT,
	`rdate`	DATETIME  NOT NULL
);

CREATE TABLE `Department` (
	`depNo`	TINYINT PRIMARY KEY,
	`name`	VARCHAR(10) NOT NULL,
	`tel`	CHAR(12) NOT NULL
);

CREATE TABLE `Sales` (
	`no`	INT AUTO_INCREMENT PRIMARY KEY,
	`uid`	VARCHAR(10) NOT NULL,
	`year`	YEAR NOT NULL,
	`month`	TINYINT NOT NULL,
	`sale`	INT
);


#실습 4-2
INSERT INTO `Member` VALUES ('a101', '박혁거세', '010-1234-1001', '부장', 101, '2024-07-03 14:33:21');
INSERT INTO `Member` VALUES ('a102', '김유신',   '010-1234-1002', '차장', 101, NOW());
INSERT INTO `Member` VALUES ('a103', '김춘추',   '010-1234-1003', '사원', 101, NOW());
INSERT INTO `Member` VALUES ('a104', '장보고',   '010-1234-1004', '대리', 102, NOW());
INSERT INTO `Member` VALUES ('a105', '강감찬',   '010-1234-1005', '과장', 102, NOW());
INSERT INTO `Member` VALUES ('a106', '이성계',   '010-1234-1006', '차장', 103, NOW());
INSERT INTO `Member` VALUES ('a107', '정철',     '010-1234-1007', '차장', 103, NOW());
INSERT INTO `Member` VALUES ('a108', '이순신',   '010-1234-1008', '부장', 104, NOW());
INSERT INTO `Member` VALUES ('a109', '허균',     '010-1234-1009', '부장', 104, NOW());
INSERT INTO `Member` VALUES ('a110', '정약용',   '010-1234-1010', '사원', 105, NOW());
INSERT INTO `Member` VALUES ('a111', '박지원',   '010-1234-1011', '사원', 105, NOW());

INSERT INTO `Department` VALUES (101, '영업1부', '051-512-1001');
INSERT INTO `Department` VALUES (102, '영업2부', '051-512-1002');
INSERT INTO `Department` VALUES (103, '영업3부', '051-512-1003');
INSERT INTO `Department` VALUES (104, '영업4부', '051-512-1004');
INSERT INTO `Department` VALUES (105, '영업5부', '051-512-1005');
INSERT INTO `Department` VALUES (106, '영업지원부', '051-512-1006');
INSERT INTO `Department` VALUES (107, '인사부', '051-512-1007');

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a101', 2018, 1,  98100);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2018, 1, 136000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2018, 1,  80100);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2018, 1,  78000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2018, 1,  93000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a101', 2018, 2,  23500);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2018, 2, 126000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2018, 2,  18500);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2018, 2,  19000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a106', 2018, 2,  53000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a101', 2019, 1,  24000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2019, 1, 109000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2019, 1, 101000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2019, 1,  53500);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a107', 2019, 1,  24000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2019, 2, 160000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2019, 2, 101000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2019, 2,  43000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2019, 2,  24000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a106', 2019, 2, 109000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2020, 1, 201000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2020, 1,  63000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2020, 1,  74000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a106', 2020, 1, 122000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a107', 2020, 1, 111000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2020, 2, 120000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2020, 2,  93000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2020, 2,  84000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2020, 2, 180000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a108', 2020, 2,  76000);

#실습 4-3

select * from `Member` 	where `name` = '김유신';
select * from `Member` 	where `name` <> '김춘추';
select * from `Member` 	where `pos` in ('사원','대리');
select * from `Member` 	where `name` Like '%신';
select * from `Member` 	where `name` Like '김__';
select * from `Sales` 	where `sale` >50000;
select * from `Sales` 	where `sale` > 50000 and `sale` < 100000 and `month` =1;
select * from `Sales`	where `year` in (2020);
select * from `Sales`	where `month`	in(1,2);

#실습 4-4

select * from 	`Sales` 	order by	`sale`;
select * from 	`Sales` 	order by	`sale`	ASC;
select * from 	`Sales` 	order by	`sale`	DESC;
select * from 	`Member` 	order by	`name`;
select * from 	`Member`	order by	`rdate` ASC;
select * from 	`Sales`	where	`sale`	>50000	order by	`year`,`month`,`sale` DESC;

#실습 4-5

select * from Sales Limit 3;
select * from Sales Limit 5,3;
select * from Sales order by `sale` desc limit 3,5;
SELECT * FROM Sales
 WHERE `sale` > 50000
 ORDER BY `year` DESC, `month`, `sale` DESC
 LIMIT 5;

#실습 4-6

select Sum(`sale`) as `합계` from `sales`;
select count(*) as `갯수` from `sales`;
select concat('hello' , 'world'); #concatornate
select concat(`uid`, `name`, `hp`) from `member` where `uid`='a108';
insert into `Member` values ('a112', '유관순', '010-1234-1012', '대리', 107, now());
 
#실습 4-7

select sum(`sale`) as `1월합계` from `sales` 
where `year` =2018 and `month` = 1;

#실습 4-8

select 
	sum(`sale`)	as `매출 합계`,
    avg(`sale`)	as `매출 평균`
from `sales` 
where `year` = 2019 and `month` = 2 and `sale` >= 50000 ;

select avg(`sale`)  as `매출 평균` from `sales` 
where `year` = 2019 and `month` = 2 and `sale` >= 50000 ;

#실습 4-9

select 
	min(`sale`) as `최저매출`,
    max(`sale`) as `최고매출`
from `sales` 
where `year` = 2020;

select max(`sale`) as '최고 매출' from `sales` where `year` = 2020;

#실습 4-10

SET SESSION sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
select * from `sales` group by `uid`;
SELECT * FROM `sales` GROUP BY `year`;
SELECT * FROM `sales` GROUP BY `uid`, `year`;
select `uid`, sum(sale) as `합계` from `sales` group by `uid`;
select `uid`, sum(sale) as `합계`
from	`sales`
where	`sale` >= 50000
group by	`uid`, `year`
order by	`합계` desc;

#실습 4-11

select `uid`, sum(sale) as `합계` 
from `sales`
group by `uid`
having `합계` >= 200000;

SELECT 	`uid` , `year`, SUM(sale) AS `합계`
FROM 	`Sales`
where 	`sale` 	>= 10000
group by	`uid` , `year`
having	`합계`	>= 20000
order by	`합계` desc;

#실습 4-12

create table `Sales2` like `sales`;
insert into `sales2` select * from `sales`; #데이터 복사

set sql_safe_updates=0;
UPDATE `Sales2` SET `year` = `year` + 3;

SELECT * FROM `Sales` UNION select * FROM `Sales2`;
select	* 	FROM `Sales` WHERE `sale` >= 100000
UNION
SELECT	* 	FROM `sales` WHERE `sale` >= 10000;

select `uid` , `year` , `sale` FROM `sales`
UNION
select `uid`, `year` , `sale` FROM sales2;

select `uid`, `year`, SUM(sale) as `합계` 
FROM `SALES`
group by `uid` , `year`
union
select `uid` , `year` , SUM(sale) as `합계`
FROM `SALES2`
group by `uid` , `year`
order by `year` asc , `합계` desc;

#실습 4-13

select * from `sales` inner join `member` on `sales`.`uid` = `member`.`uid` ;

select * from `sales` as a 
join `member` as b
on a.uid = b.uid;

select * from `member` as A
join `department` as B
on a.dep = b.depNo ;

select
	a.`no`,
    a.`uid`,
    `sale`,
    `name`,
    `pos`
from `sales` 	as A
join `member`	as B
on a.`uid` = b.`uid`
where `sale` >= 100000;

select 
	a.`no`,
    a.`uid`,
    a.`sale`,
    b.`name`,
    b.`pos`
from `sales` as a 
join `member` as b
using (`uid`);

select
	a.`no`,
    a.`uid`,
    b.`name`,
    b.`pos`,
    `year`,
    sum(`Sale`) as `합계`
From `sales` 	as A
join `Member` 	as B
ON	a.`uid` = b.`uid`
group by	a.`uid`, a.`year` 
having 	`합계` >= 100000
order by 	a.`year` asc , `합계` desc;

select	* FROm `sales` as A
Join `member` as B 
on a.`uid` = b.`uid`
Join `department` as C
on b.`dep` = c.`depNo`;

select 
	a.`no`,
    a.`uid`,
    a.`sale`,
    b.`name`,
    b.`pos`,
    c.`name`
from `sales` as A
join `member` as B
ON 	a.`uid` = b.`uid`
JOin `department` as C
on 	b.`dep` = c.`depNo`;

SELECT 
	a.`No`, 
    a.`uid`, 
    a.`sale`, 
    b.`name`, 
    b.`pos`, 
    c.`name` 
FROM `Sales` AS A 
JOIN `Member` AS B  
	ON a.uid = b.uid 
JOIN `Department` AS C  
	ON b.dep = c.depNo 
WHERE `sale` > 100000 
ORDER BY `sale` DESC;

#실습 4-14

select * from `sales` as A
right Join `member` as B
on a.`uid` = b.`uid`;

select 
	a.`no`,
    a.`uid`,
    `sale`,
    `name`,
    `pos`
from `sales` as A
right join `Member` as B 
using(uid);

#실습 4-15

select
	a.`uid`,
   # a.`name` as `직원명`, 
    b.`pos`,
    b.`dep` as `부서명`
from	`sales`	as A
join	`member` as B;
	
#실습 4-16

select
	b.`name`,
	a.`sale`,
	SUM(`sale`) as `2019년도 매출 합`
from `sales` as A
join `member` as b
on a.uid = b.uid
where
	 `year` = 2019 and
     `name` = '김유신';
#실습 4-17

select 
	b.`name`,
    c.`name`,
    `pos`,
    `year`,
    sum(`sale`) as `합계`
from `Sales` as a
join `member` as b	on a.`uid` = b.`uid`
join `department` as C	on b.`dep` = c.`depNo`
where `year` = 2019 and `sale` >= 50000
group by a.`uid`
having `합계` >= 100000
order by `합계` desc;