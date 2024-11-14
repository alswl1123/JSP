USE market_db;

-- 변수 선언, 정수/실수 대입
SET @myVar1 = 8;
SET @myVar2 = 64.5;

-- 변수 내용 출력
SELECT @myVar1;

-- 변수끼리 연산 후 출력
SELECT @myVar1 + @myVar2;

-- 변수 선언하고 문자열 또는 정수 대입
SET @txt = '가수 이름 ==>';
SET @height = 166;

-- 테이블 조회하면서 변수 활용
SELECT @txt AS 가수_이름, mem_name FROM member WHERE height > @height;

-- ------------------------------------------------------------------

-- PREPARE 는 실행하지 않고 SQL문만 준비해놓고 EXECUTE 에서 실행하는 방식
SET @count = 3;
PREPARE mySQL FROM 'SELECT mem_name, height FROM member ORDER BY height LIMIT ?';
EXECUTE mySQL USING @count;

-- ------------------------------------------------------------------

-- 다양한 구분자를 날짜형으로 변경
SELECT CAST('2024$11$14' AS DATE) AS `오늘 날짜`; -- CAST 에도 알리아스를 붙일 수 있구만!
SELECT CAST('2024/11/14' AS DATE);
SELECT CAST('2024%11%14' AS DATE);
SELECT CAST('2024@11@14' AS DATE);

-- ------------------------------------------------------------------

-- CONCAT 은 문자열을 합쳐준다.
-- 내부 조인은 두 테이블에 모두 있는 내용만 조인, 출력됨
SELECT B.mem_id, M.mem_name, B.prod_name, M.addr, CONCAT(M.phone1, M.phone2) '연락처'
FROM buy B
	INNER JOIN member M -- 테이블 이름에 별칭 붙임
	ON B.mem_id = M.mem_id;

-- ------------------------------------------------------------------

-- 중복된 결과 1개만 출력하기
SELECT DISTINCT M.mem_id, M.mem_name, M.addr
FROM buy B
	INNER JOIN member M
    ON B.mem_id = M.mem_id
ORDER BY M.mem_id;

-- ------------------------------------------------------------------

USE market_db;
CREATE TABLE emp_table(emp CHAR(4), manager CHAR(4), phone VARCHAR(8));

INSERT INTO emp_table VALUES('대표',NULL,'0000');
INSERT INTO emp_table VALUES('영업이사','대표','1111');
INSERT INTO emp_table VALUES('관리이사','대표','2222');
INSERT INTO emp_table VALUES('정보이사','대표','3333');
INSERT INTO emp_table VALUES('영업과장','영업이사','1111-1');
INSERT INTO emp_table VALUES('경리부장','관리이사','2222-1');
INSERT INTO emp_table VALUES('인사부장','관리이사','2222-2');
INSERT INTO emp_table VALUES('개발팀장','정보이사','3333-1');
INSERT INTO emp_table VALUES('개발주임','정보이사','3333-2');

-- 경리부장(직원)의 직속상관 연락처
SELECT A.emp "직원", B.emp "직속상관", B.phone "직속상관연락처"
FROM emp_table A
	INNER JOIN emp_table B
    ON A.manager = B.emp
WHERE A.emp = '경리부장';

-- ------------------------------------------------------------------

DROP PROCEDURE IF EXISTS ifProc3;
DELIMITER $$
CREATE PROCEDURE ifProc3() -- 중괄호는 필요없다.
BEGIN
	DECLARE debutDate DATE; -- 데뷔일자
    DECLARE curDate DATE; -- 오늘
    DECLARE days INT; -- 활동한 일수
    
    SELECT debut_date INTO debutDate
		FROM market_db.member
        WHERE mem_id = 'BLK';
        
        -- 내장함수 : CURRENT_DATE(), DATEDIFF()
        -- DATEDIFF() 는 연산 기능
        SET curDate = CURRENT_DATE(); -- 현재 날짜
        SET days = DATEDIFF(curDate, debutDate); -- 날짜의 차이, 일 단위
        
        IF(days/365) >= 5 THEN -- 5년이 지났다면
			SELECT CONCAT('데뷔한 지 ', days, '일이나 지났습니다. 블핑이들 축하합니다!') AS 메시지;
		ELSE
			SELECT '데뷔한 지 ' + days + '일 밖에 안 되었네요. 블핑이들 파이팅~';
		END IF;
        
	END $$
    DELIMITER ;
CALL ifProc3();

-- ------------------------------------------------------------------

SELECT CURRENT_DATE(), DATEDIFF('2024-11-14', '2021-12-31');

-- ------------------------------------------------------------------

DROP PROCEDURE IF EXISTS caseProc;
DELIMITER $$
CREATE PROCEDURE caseProc()
BEGIN
	DECLARE point INT;
    DECLARE credit CHAR(1);
    SET point = 95;
    
    CASE
		WHEN point >= 90 THEN
			SET credit = 'A';
        WHEN point >= 80 THEN
			SET credit = 'B';
		WHEN point >= 70 THEN
			SET credit = 'C';
        WHEN point >= 60 THEN
			SET credit = 'D';
		ELSE
			SET credit = 'F';
	END CASE;
    SELECT CONCAT('취득점수==>', point) AS '점수', CONCAT('학점==>', credit) AS '학점';
END $$
DELIMITER ;
CALL caseProc();

-- ------------------------------------------------------------------

-- 구매 이력 있는 사람
SELECT B.mem_id, M.mem_name, SUM(price*amount) "총구매액"
FROM buy B
	INNER JOIN member M
    ON B.mem_id = M.mem_id
GROUP BY B.mem_id
ORDER BY SUM(price*amount) DESC;

-- 구매 이력 없는 사람
SELECT M.mem_id, M.mem_name, SUM(price*amount) "총구매액"
FROM buy B
	RIGHT OUTER JOIN member M
    ON B.mem_id = M.mem_id
GROUP BY M.mem_id
ORDER BY SUM(price*amount) DESC;

-- ------------------------------------------------------------------

-- while 을 for 처럼 돌리고 있음
DROP PROCEDURE IF EXISTS whileProc;
DELIMITER $$
CREATE PROCEDURE whileProc()
BEGIN
	DECLARE i INT; -- 1에서 100까지 증가할 변수
	DECLARE hap INT; -- 더한 값을 누적할 변수
    SET i = 1;
    SET hap = 0;
    
    WHILE(i <= 100) DO
		SET hap = hap + i; -- hap의 원래 값에 i를 더해서 다시 hap에 넣으라는 의미
        SET i = i + 1; -- i의 원래 값에 1을 더해서 다시 i에 넣으라는 의미
	END WHILE;
    
    SELECT '1부터 100까지의 합 ==>', hap;
END $$
DELIMITER ;
CALL whileProc();

-- ------------------------------------------------------------------

-- ITERATE 는 반복문을 계속 진행하고, LEAVE 는 반복문을 빠져나갑니다.
DROP PROCEDURE IF EXISTS whileproc2;
DELIMITER $$
CREATE PROCEDURE whileProc2()
BEGIN
	DECLARE i INT; -- 1에서 100까지 증가할 변수
    DECLARE hap INT; -- 더한 값을 누적할 변수
    SET i = 1;
    SET hap = 0;
    
    myWhile:
    WHILE(i <= 100) DO
		IF(i%4 = 0) THEN
			SET i = i + 1;
            ITERATE myWhile; -- 지정한 label문으로 가서 계속 진행
		END IF;
        SET hap = hap + i;
        IF (hap > 1000) THEN
			LEAVE myWhile; -- 지정한 label문을 떠남. 즉 WHile 종료
		END IF;
        SET i = i + 1;
	END WHILE;		

	SELECT '1부터 100까지의 합(4의 배수 제외), 1000 넘으면 종료 ==>' , hap;
END $$
DELIMITER ;
CALL whileProc2();

-- ------------------------------------------------------------------

-- 동적 SQL
-- DEALLOCATE 는 close() 랑 같은 기능
use market_db;
PREPARE myQuery FROM 'SELECT * FROM member WHERE mem_id = "BLK"';
EXECUTE myQuery;
DEALLOCATE PREPARE myQuery;

DROP TABLE IF EXISTS gate_table;
CREATE TABLE gate_table (id INT AUTO_INCREMENT PRIMARY KEY, entry_time DATETIME);
SET @curDate = CURRENT_TIMESTAMP(); -- 현재 날짜와 시간
PREPARE myQuery FROM 'INSERT INTO gate_table VALUES(Null, ?)';
EXECUTE myQuery USING @curDate;
DEALLOCATE PREPARE myQuery;

SELECT * FROM gate_table;

