#날짜 : 24/07/01
#이름 : 박준우
#내용 : 2장 SQL 기본

#실습 2-1. 테이블 생성, 제거
use studydb;
#drop table tbluser;
#drop table tblproduct;


create table `TblUser`(
	`user_id` varchar(10),
    `user_name` varchar(10),
    `user_hp` char(13),
    `user_age` int,
    `user_addr` varchar(15)
    );
INSERT INTO `TblUser` VALUES ('p101', '김유신', '010-1234-1001', 25, '경남 김해시');
INSERT INTO `TblUser` VALUES ('p102', '김춘추', '010-1234-1002', 23, '경남 경주시');
INSERT INTO `TblUser` VALUES ('p103', '장보고', '', 31, '전남 완도군');
INSERT INTO `TblUser` VALUES ('p104', '강감찬', '', 50, '서울시 중구');
INSERT INTO `TblUser` VALUES ('p105', '이순신', '010-1234-1005', 50, '');

create table `TblProduct`(
	`user_no` int,
    `prod_name` varchar(10),
    `prod_price` int,
    `prod_stock` int,
    `prod_company` varchar(15),
    `prod_date` char(10)
    );
	alter table `tblproduct` modify `prod_price` varchar(15);

insert into `TblProduct` values ('1001', '냉장고', '800,000', '25', 'LG전자', '2022-01-06');
insert into `TblProduct` values ('1002', '노트북', '1,200,000', '120', '삼성전자', '2022-01-07');
insert into `TblProduct` values ('1003', '모니터', '350,000', '35', 'LG전자', '2023-01-03');
insert into `TblProduct` values ('1004', '세탁기', '1,000,000', '80', '삼성전자', '2021-01-01');
insert into `TblProduct` values ('1005', '컴퓨터', '1,500,000', '35', '삼성전자', '2023-10-01');
insert into `TblProduct` values ('1006', '휴대폰', '950,000', '102', '', '');


 SELECT `user_name` FROM `TblUser`;
 SELECT `user_name`, `user_hp` FROM `TblUser`;
 SELECT * FROM `TblUser` WHERE `user_id`='p102';
 SELECT * FROM `TblUser` WHERE `user_id`='p104' OR `user_id`='p105';
 SELECT * FROM `TblUser` WHERE `user_addr`='부산시 금정구';
 SELECT * FROM `TblUser` WHERE `user_age` > 30;
 SELECT * FROM `TblUser` WHERE `user_hp` IS NULL;
 UPDATE `TblUser` SET `user_age`=42 WHERE `user_id`='p104';
 UPDATE `TblUser` SET `user_addr`='부산시 진구' WHERE `user_id`='p105';
 DELETE FROM `TblUser` WHERE `user_id`='p103';

SELECT * FROM `TblProduct`;





