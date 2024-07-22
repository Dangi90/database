#날짜 : 24/07/19
#이름 : 박준우
#내용 : 8장 트랜잭션 실습하기

use bank;

#실습 8-1
set autocommit = FALSE;
update bank_account set a_balance = 100000 where a_no = '101-11-1001';

START TRANSACTION;
SELECT * FROM bank_account ;

UPDATE 		`bank_account` 
Set			`a_balance` = `a_balance` - 10000
WHERE		`a_no` = '101-11-1001';

UPDATE 		bank_account 
Set			a_balance = a_balance + 10000
WHERE		a_no = '101-11-1212';

#Commit;

SELECT * FROM bank_account;
