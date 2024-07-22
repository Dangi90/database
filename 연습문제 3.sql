#날짜 : 24/07/10
#이름 : 박준우
#내용 : 연습문제3

#실습 3-1
CREATE DATABASE `College`;
create user 'college'@'%' identified by '1234';
grant all PRIVILEGES on college.* to 'college'@'%';
FLUSH PRIVILEGES;

#실습 3-2
CREATE TABLE `student`(
			stdNO 		VARCHAR(8) 	NOT null,
            stdName		VARCHAR(20)	not null,
            stdHp		VARCHAR(13) not null,
            stdYear		TINYINT		not null,
            stdAddress 	varchar(100) default null,
            PRIMARY key(stdNO),
            Unique Key(stdHP)
            );
            
CREATE TABLE `Lecture`(
			lecNo		INT	not null,
            lecName		VARCHAR(20) not null,
            lecCredit	TINYINT	not null,
            lecTime		TINYINT not null,
            lecClass	VARCHAR(10) DEFAULT null,
            PRIMARY KEY(lecNo)
			);
            
CREATE TABLE `Register`(
			regStdNo	VARCHAR(8) not null,
            regLecNO 	int not null,
            regMidScore TINYINT DEFAULT NULL,
            regFinalScore TINYINT DEFAULT NULL,
            regTotalScore TINYINT DEFAULT NULL,
            regGrade 	varchar(1) DEFAULT NULL
			);
            
#실습 3-3
use college;
INSERT INTO Student (stdNo, stdName, stdHp, stdYear, stdAddress) VALUES
(20201016, '김유신', '010-1234-1001', 3, NULL),
(20201126, '김춘추', '010-1234-1002', 3, '경상남도 경주시'),
(20210216, '장보고', '010-1234-1003', 2, '전라남도 완도시'),
(20210326, '강감찬', '010-1234-1004', 2, '서울시 영등포구'),
(20220416, '이순신', '010-1234-1005', 1, '부산시 부산진구'),
(20220521, '송상현', '010-1234-1006', 1, '부산시 동래구');

INSERT INTO Lecture (lecNo, lecName, lecCredit, lecTime, lecClass) VALUES
(159, '인지행동심리학', 3, 40, '본304'),
(167, '운영체제론', 3, 25, '본B05'),
(234, '중영문법', 3, 20, '본201'),
(239, '세계문학', 3, 40, '본204'),
(248, '빅데이터 개론', 3, 20, '본B01'),
(253, '컴퓨터통신과 코딩', 2, 10, '본B02'),
(349, '사회복지 마케팅', 2, 50, '본301');

INSERT INTO Register (regStdNo, regLecNo, regMidScore, regFinalScore, regTotalScore, regGrade) VALUES
(20201126, 234, NULL, NULL, NULL, NULL),
(20201016, 248, NULL, NULL, NULL, NULL),
(20201016, 253, NULL, NULL, NULL, NULL),
(20201126, 239, NULL, NULL, NULL, NULL),
(20210216, 349, NULL, NULL, NULL, NULL),
(20210326, 349, NULL, NULL, NULL, NULL),
(20201016, 167, NULL, NULL, NULL, NULL),
(20220416, 349, NULL, NULL, NULL, NULL);

#실습 3-4
SELECT * FROM lecture;

#실습 3-5
SELECT * FROM student;

#실습 3-6
SELECT * FROM register;

#실습 3-7
SELECT * FROM STUDENt WHERE stdYear = 3;

#실습 3-8
SELECT * FROM LECTURE WHERE lecCredit = 2;

#실습 3-9
SET SESSION sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
#SET GLOBAL  log_bin_trust_function_creators=ON;

UPDATE Register SET regMidScore = 36, regFinalScore = 42 WHERE regStdNo = 20201126 AND regLecNo = 234;
UPDATE Register SET regMidScore = 24, regFinalScore = 62 WHERE regStdNo = 20201016 AND regLecNo = 248;
UPDATE Register SET regMidScore = 28, regFinalScore = 40 WHERE regStdNo = 20201016 AND regLecNo = 253;
UPDATE Register SET regMidScore = 37, regFinalScore = 57 WHERE regStdNo = 20201126 AND regLecNo = 239;
UPDATE Register SET regMidScore = 28, regFinalScore = 68 WHERE regStdNo = 20210216 AND regLecNo = 349;
UPDATE Register SET regMidScore = 16, regFinalScore = 65 WHERE regStdNo = 20210326 AND regLecNo = 349;
UPDATE Register SET regMidScore = 18, regFinalScore = 38 WHERE regStdNo = 20201016 AND regLecNo = 167;
UPDATE Register SET regMidScore = 25, regFinalScore = 58 WHERE regStdNo = 20220416 AND regLecNo = 349;

SELECT * FROM register;

#실습 3-10
UPDATE register set
				regTotalScore = regmidScore + regFinalScore,
                regGrade = 	if(regTotalScore >= 90, 'A',
							if(regTotalScore >= 80, 'B',
                            if(regTotalScore >= 70, 'C',
                            if(regTotalScore >= 60, 'D' , 'F'))));

SELECT * FROM register;

#실습 3-11
SELECT * FROM register ORDER BY regTotalScore DESC;

#실습 3-12
SELECT * FROM register where regLecNo = 349 ORDER BY regTotalScore DESC;

#실습 3-13
SELECT * FROM Lecture Where lecTime >=30;

#실습 3-14
SELECT `lecName` , `lecClass` FROM lecture ;

#실습 3-15
SELECT `stdNo`, `StdName` From student;

#실습 3-16
SELECT * FROM Student WHERE stdAddress is null;

#실습 3-17
SELECT * FROM Student WHERE stdAddress like '부산%';

#실습 3-18
SELECT * FROM Student AS A 
Join Register as B
ON a.stdNo = b.regStdNo;

#실습 3-19
SELECT
	stdNo,
    stdName,
    regLecNo,
    regMidScore,
    regFinalScore,
    regTotalScore,
    regGrade
FROM student as A, register as B Where a.stdNo = b.regStdNo;

#실습 3-20
SELECT stdName, stdNo, regLecNo
FROM Student as A
Join register as b
On a.stdNo = b.regStdNo 
Where regLecNo = 349;

#실습 3-21
SELECT
	stdNo,
    stdName,
    Count(stdNo) as '수강신청 건수',
    SUM(regTotalScore) as '종합점수',
    SUM(regTotalScore) / count(stdNo) as '평균'
FROM student as A
JOIN register as B
ON a.stdNo = b.regStdNo
GROUP BY StdNo;

#실습 3-22
SELECT * FROM register as A
JOIN lecture as B on a.regLecNo = b.lecNo;

#실습 3-23
SELECT
	regStdNo,
    regLecNo,
    lecName,
    regMidScore,
    regFinalScore,
    regTotalScore,
    regGrade
FROM Student as A 
JOIN register as B ON A.stdNo = b.regStdNo
JOIN lecture as C on b.regLecNo = c.lecNo;

#실습 3-24
#SELECT * from register;
SELECT 
	COUNT(*) AS '사회복지 마케팅 수강 신청건수',
    AVG(regTotalScore) AS '사회복지 마케팅 평균'
FROM register As A JOIN lecture as B ON a.regLecNo = b.lecNo
#WHERE a.regLecNo = '349';
Where b.lecName = '사회복지 마케팅';

#실습 3-25
SELECT
	regStdNo,
    lecName
From register As A
JOIN lecture as B
ON a.regLecNo = b.lecNo
WHERE a.regGrade = 'A';

#실습 3-26
SELECT * FROM Student AS a
JOIN register AS b On a.stdNo = b.regStdNo
JOIN lecture As c On b.regLecNo = c.LecNo;

#실습 3-27
SELECT
	stdNo,
    stdName,
    lecNo,
    lecName,
    regMidScore,
    regFinalScore,
    regTotalScore,
    regGrade
From Student As a
join register As b On a.StdNo = b.regStdNo
Join lecture As c on b.regLecNo = c.lecNo
ORDER BY b.regTotalScore DESC;
    
#실습 3-28
SELECT
	stdNo,
    stdName,
    lecName,
    regTotalScore,
    regGrade
FROM Student AS a
join register As b On a.StdNo = b.regStdNo
Join lecture As c on b.regLecNo = c.lecNo
WHERE b.regGrade = 'F';

#실습 3-29
SELECT
	stdNo,
	stdName,
    SUm(lecCredit) as '이수학점'
FROM Student as A
join register As b On a.StdNo = b.regStdNo
Join lecture As c on b.regLecNo = c.lecNo
Where  b.regGrade not like 'F'
Group by a.stdNo
order by stdNo;

#실습 3-30
SELECT 
	stdNo,
    stdName,
    GROUP_CONCAT(lecName) AS '신청과목',
    GROUP_CONCAT(if(regTotalScore >= 60, lecName, null)) as '이수과목'
FROM student as a
join register As b On a.StdNo = b.regStdNo
Join lecture As c on b.regLecNo = c.lecNo
WHERE b.regGrade not like 'F'; 
