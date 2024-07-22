#3장

use studyDB;

 CREATE TABLE `User2` ( `uid` VARCHAR(10) PRIMARY KEY, `name` VARCHAR(10), `birth` CHAR(10), `addr` VARCHAR(50) );
 
  CREATE TABLE `User3` ( `uid` VARCHAR(10) PRIMARY KEY, `name` VARCHAR(10), `birth` CHAR(10), `hp` CHAR(13) UNIQUE, `addr` VARCHAR(50) );
  
  CREATE TABLE `Parent` ( `pid` VARCHAR(10) PRIMARY KEY, `name` VARCHAR(10), `birth` CHAR(10), `addr` VARCHAR(100) );
  
  CREATE TABLE `Child` ( `cid` VARCHAR(10) PRIMARY KEY, `name`  VARCHAR(10), `hp` CHAR(13) UNIQUE, `parent` VARCHAR(10), FOREIGN KEY (`parent`) REFERENCES `Parent` (`pid`) );
  
   CREATE TABLE `User4`( `uid` VARCHAR(10) PRIMARY KEY, `name` VARCHAR(10) NOT NULL, `gender` CHAR(1), `age` INT DEFAULT 1, `hp` CHAR(13) UNIQUE, `addr` VARCHAR(20) );
   
   CREATE TABLE `User5`( `seq` INT PRIMARY KEY AUTO_INCREMENT, `name` VARCHAR(10) NOT NULL, `gender` CHAR(1) CHECK (`gender` IN ('M', 'F')), `age` INT DEFAULT 1 CHECK (`age` > 0 AND `age` < 100), `addr` VARCHAR(20) );