#날짜 : 24/07/05
#이름 : 김철학
#내용 : 5장 데이터베이스 개체

#실습 5-1
use studyDB;
show index from `user1`;
show index from `user1`;
show index from `user1`;

#실습 5-2
create index `idx_user1_uid` on `user1`(`uid`);
analyze table `user1`;

select * from `user5`;
insert into `user5` (`name`, `gender`, `age`, `addr`) select `name`, `gender`, `age`, `addr` from `user5`;

#실습5-3
drop index idx_user1_uid ON `user1`;

#실습 5-4
CREATE VIEW `vw_user1` as (SELECT `name` , `hp` , `age` FROM `USer1`);
select * from `vw_user1`;

CREATE VIEW `vw_user4_age_under30` as (SELECT * FROM `user4` where `age` < 30);
CREATE VIEW `vw_member_with_sales` AS(
	SELECT
		a.`uid` 	as `직원아이디`,
        b.`name`	as `직원이름`,
        b.`pos`		as `직급`,
        c.`name`	as `부서명`,
        a.`year` 	as `매출년도`,
        a.`month` 	as `월`,
        a.`sale` 	as `매출액`
	FROM `SALES` as A
    JOiN `member` as B ON a.uid = b.uid
    JOIN `department` as C on b.dep = c.depNo
);

#실습 5-5
SELECT * FROM `vw_user1`;
select * from `vw_user2_age_under30`;

#실습 5-6
drop view `vw_user1`;
drop view `vw_user4_age_under30`;

#실습 5-7
DELIMITER $$
	CREATE procedure proc_test1()
    BEgin
		select * from `MEMBER`;
        select * from `Department`;
	End $$
    DElimiter ;

call proc_test1();

#t실습 5-8
    
 DELIMITER $$ 
	CREATE PROCEDURE proc_test2(IN _userName VARCHAR(10)) 
    BEGIN 
		SELECT * FROM `Member` 
		WHERE `name`=_userName; 
	END $$ 
    DELIMITER ;
    
    CALL proc_test2('김유신');
    
DELIMITER $$ 
CREATE PROCEDURE proc_test3(IN _pos VARCHAR(10), IN _dep TINYINT) 
BEGIN 
	SELECT * FROM `Member` WHERE `pos`=_pos AND `dep`=_dep; 
END $$ 
DELIMITER ;

CALL proc_test3('차장', 101);

 DELIMITER $$ CREATE PROCEDURE proc_test4(IN _pos VARCHAR(10), OUT _count INT) BEGIN SELECT COUNT(*) INTO _count FROM `Member` WHERE `pos`=_pos ; END $$ DELIMITER ;
 
 CALL proc_test4(‘대리’, @_count); 
 SELECT CONCAT('_count : ', @_count)
    
    
#실습 5-10
DELIMITER $$
create procedure proc_test8()
begin
	#변수선언
    declare total int default 0;
    declare price int;
    declare endOfrow boolean default false;
    
    #커서선언
    declare salesCursor cursor for	
		select `sale` from `sales`;
        
	#반복조건
    declare continue handler for
		not found set endOfRow = TRUE;
        
	#커서열기
    open salesCursor;
    
    #반복문
	cursor_loop: LOOP      
		FETCH salesCursor INTO price;      
        
        IF endOfRow THEN LEAVE cursor_loop;      
        END IF;              
        SET total = total + price;   
	END LOOP;

	select total as `전체 합계`;

	close salesCursor;
End $$
DELIMITER ;

call proc_test8();

#5-11
DELIMITER $$

CREATE FUNCTION func_test1(_userid VARCHAR(10)) RETURNS INT
BEGIN
    DECLARE total INT DEFAULT 0;

    SELECT SUM(`sale`) INTO total
    FROM `Sale`
    WHERE `uid` = _userid;

    RETURN total;
END $$

DELIMITER ;

select func_test1('a101');

DELIMITER $$ CREATE FUNCTION func_test2(_sale INT) RETURNS DOUBLE BEGIN    DECLARE bonus DOUBLE;    IF (_sale >= 100000) THEN   SET bonus = _sale * 0.1;       ELSE   SET bonus = _sale * 0.05;          END IF; RETURN bonus; END $$ DELIMITER ;