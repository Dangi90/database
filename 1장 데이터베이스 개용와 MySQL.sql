#날짜 : 24/07/01
#이름 : 박준우
#내용 : 1장 데이터베이스 개요와 MySQL 설치

#실습 1-1. MySQL 접속, 데이터베이스 생성 및 삭제
create database `StudyDb`;
show databases;

#실습 1-2. MySQL 접속, 데이터베이스 생성 및 권한 부여

use studydb;
 CREATE TABLE `User1` ( `uid`  VARCHAR(10),
 `name` VARCHAR(10), `hp`   CHAR(13), `age`  INT);

