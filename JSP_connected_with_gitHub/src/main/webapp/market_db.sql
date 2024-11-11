-- 11/05 학습

CREATE DATABASE market_db;

-- use 명령어를 사용하면 테이블 이름만 명시해도 된다.
use market_db;
SELECT * FROM member; 

-- use 명령어를 사용하지 않으면 테이블 이름만으로 검색되지 않음
 SELECT * FROM market_db.member;
 
-- 만약 market_db 가 존재하면 우선 삭제한다.
DROP DATABASE IF EXISTS market_db;
-- 그 후 다시 CREATE
CREATE DATABASE market_db;

USE market_db;
CREATE TABLE member -- 회원 테이블
( mem_id        CHAR(8) NOT NULL PRIMARY KEY, -- 사용자 아이디(PK)
  mem_name       VARCHAR(10) NOT NULL, -- 이름
  mem_number    INT NOT NULL,  -- 인원수
  addr           CHAR(2) NOT NULL, -- 지역(경기,서울,경남 식으로 2글자만입력)
  phone1      CHAR(3), -- 연락처의 국번(02, 031, 055 등)
  phone2      CHAR(8), -- 연락처의 나머지 전화번호(하이픈제외)
  height       SMALLINT,  -- 평균 키
  debut_date   DATE  -- 데뷔 일자
);

CREATE TABLE buy -- 구매 테이블
(  num       INT AUTO_INCREMENT NOT NULL PRIMARY KEY, -- 순번(PK)
   mem_id     CHAR(8) NOT NULL, -- 아이디(FK)
   prod_name    CHAR(6) NOT NULL, --  제품이름
   group_name    CHAR(4)  , -- 분류
   price        INT  NOT NULL, -- 가격
   amount       SMALLINT  NOT NULL, -- 수량
   FOREIGN KEY (mem_id) REFERENCES member(mem_id)
);

INSERT INTO member VALUES('TWC', '트와이스', 9, '서울', '02', '11111111', 167, '2015.10.19');
INSERT INTO member VALUES('BLK', '블랙핑크', 4, '경남', '055', '22222222', 163, '2016.08.08');
INSERT INTO member VALUES('WMN', '여자친구', 6, '경기', '031', '33333333', 166, '2015.01.15');
INSERT INTO member VALUES('OMY', '오마이걸', 7, '서울', NULL, NULL, 160, '2015.04.21');
INSERT INTO member VALUES('GRL', '소녀시대', 8, '서울', '02', '44444444', 168, '2007.08.02');
INSERT INTO member VALUES('ITZ', '잇지', 5, '경남', NULL, NULL, 167, '2019.02.12');
INSERT INTO member VALUES('RED', '레드벨벳', 4, '경북', '054', '55555555', 161, '2014.08.01');
INSERT INTO member VALUES('APN', '에이핑크', 6, '경기', '031', '77777777', 164, '2011.02.10');
INSERT INTO member VALUES('SPC', '우주소녀', 13, '서울', '02', '88888888', 162, '2016.02.25');
INSERT INTO member VALUES('MMU', '마마무', 4, '전남', '061', '99999999', 165, '2014.06.19');

INSERT INTO buy VALUES(NULL, 'BLK', '지갑', NULL, 30, 2);
INSERT INTO buy VALUES(NULL, 'BLK', '맥북프로', '디지털', 1000, 1);
INSERT INTO buy VALUES(NULL, 'APN', '아이폰', '디지털', 200, 1);
INSERT INTO buy VALUES(NULL, 'MMU', '아이폰', '디지털', 200, 5);
INSERT INTO buy VALUES(NULL, 'BLK', '청바지', '패션', 50, 3);
INSERT INTO buy VALUES(NULL, 'MMU', '에어팟', '디지털', 80, 10);
INSERT INTO buy VALUES(NULL, 'GRL', '혼공SQL', '서적', 15, 5);
INSERT INTO buy VALUES(NULL, 'APN', '혼공SQL', '서적', 15, 2);
INSERT INTO buy VALUES(NULL, 'APN', '청바지', '패션', 50, 1);
INSERT INTO buy VALUES(NULL, 'MMU', '지갑', NULL, 30, 1);
INSERT INTO buy VALUES(NULL, 'APN', '혼공SQL', '서적', 15, 1);
INSERT INTO buy VALUES(NULL, 'MMU', '지갑', NULL, 30, 4);

SELECT * FROM member;
SELECT * FROM buy;

SELECT mem_name FROM member;

SELECT addr "주소", debut_date "데뷔일자", mem_name "멤버이름" FROM member;

SELECT mem_id, mem_name
	FROM member
	where height <= 162;
    
SELECT mem_name, mem_number
	FROM member
    -- 요 위에 세미콜론 찍으면 안 됨
    WHERE height >= 165 AND mem_number < 6;
    
SELECT * FROM member 
	WHERE mem_name = '블랙핑크';

SELECT * FROM member
	WHERE mem_number = 4;
    
SELECT mem_name, height, mem_number
	FROM member
	WHERE height >= 165 AND mem_number > 6;
    
SELECT mem_name, height, mem_number
	FROM member
    WHERE height >= 165 OR mem_number > 6;

SELECT mem_name, height
	FROM member
	WHERE height >= 163 AND height <= 165;
    
SELECT mem_name, height
	 FROM member
     WHERE height BETWEEN 163 AND 165;

SELECT mem_name, addr
    FROM member
	WHERE addr = '경기' OR addr = '전남' OR addr = '경남';
    
SELECT mem_name, addr
    FROM member
    WHERE addr IN('경기', '전남', '경남');
    
SELECT *
    FROM member
	WHERE mem_name LIKE '우%';
    -- 문자 중에 가장 강력한 건 like. 검색 엔진에 많이 쓰임
    
SELECT *
    FROM member
	WHERE mem_name LIKE '__핑크';
    -- 언더바 2개
    
SELECT mem_id, mem_name, debut_name
   FROM member
    ORDER BY debut_date;
    
SELECT mem_id, mem_name, debut_date
   FROM member
    ORDER BY debut_date DESC;
    
SELECT mem_id, mem_name, debut_date, height
   FROM member
   ORDER BY height DESC;
    -- where height >= 164; -- where와 order 순서 틀려서 오류 발생!
    
SELECT mem_id, mem_name, debut_date, height
    FROM member
    WHERE height >= 164
    ORDER BY height DESC;
    
SELECT mem_id, mem_name, debut_date, height
    FROM member
    WHERE height >= 164
	ORDER BY height DESC, debut_date ASC;
    
SELECT mem_name, debut_date
    FROM member
    ORDER BY debut_date
    LIMIT 3;

SELECT *
   FROM member
    LIMIT 3;
    -- order by debut_date; -- 이렇게 쓰면 순서 오류!

SELECT mem_name, height
    FROM member
    ORDER BY height DESC
    LIMIT 3, 2;

SELECT addr 
   FROM member;

SELECT addr 
   FROM member 
   ORDER BY addr;

SELECT distinct addr 
   FROM member;

SELECT mem_id, amount 
    FROM buy 
	ORDER BY mem_id;

SELECT mem_id, sum(amount) 
   FROM buy
    GROUP BY mem_id;

SELECT mem_id, SUM(amount) 
   FROM buy;

select mem_id "회원 아이디", sum(amount) "총 구매 개수"
   FROM buy
    GROUP BY mem_id;

select mem_id "회원 아이디", sum(price * amount) "총 구매 금액"
   FROM buy
    GROUP BY mem_id;
    
SELECT AVG(amount) "평균 구매 개수" 
   FROM buy;

SELECT mem_id, AVG(amount) "평균 구매 개수"
   FROM buy
    GROUP BY mem_id;

SELECT COUNT(*) FROM member;

SELECT COUNT(phone1) "연락처가 있는 회원" FROM member;

SELECT mem_id "회원 아이디", SUM(price * amount) "총 구매 금액"
   FROM buy
    GROUP BY mem_id;
    
SELECT mem_id "회원 아이디", SUM(price * amount) "총 구매 금액"
   FROM buy
    WHERE SUM(price * amount) > 1000;
    -- GROUP BY mem_id;
    
SELECT mem_id "회원 아이디", SUM(price * amount) "총 구매 금액"
   FROM buy
    GROUP BY mem_id
    HAVING SUM(price * amount) > 1000;

SELECT mem_id "회원 아이디", SUM(price * amount) "총 구매 금액"
   FROM buy
    GROUP BY mem_id
    HAVING SUM(price * amount) > 1000
    ORDER BY SUM(price*amount) DESC;

CREATE TABLE hongong1 (toy_id INT, toy_name CHAR(4), age INT);
INSERT INTO hongong1 VALUES (1, '우디', 25);
INSERT INTO hongong1 (toy_id, toy_name) VALUES (2, '버즈');
INSERT INTO hongong1 (toy_name, age, toy_id) VALUES ('제시', 20, 3);

CREATE TABLE hongong2 (
   toy_id INT AUTO_INCREMENT PRIMARY KEY,
   toy_name CHAR(4),
   age INT
   );
    
INSERT INTO hongong2 VALUES (NULL, '보핍', 25);
INSERT INTO hongong2 VALUES (NULL, '슬링키', 22);
INSERT INTO hongong2 VALUES (NULL, '렉스', 21);
SELECT * FROM hongong2;

SELECT LAST_INSERT_ID();

ALTER TABLE hongong2 auto_increment=100;
INSERT INTO hongong2 VALUES (NULL, '재남', 35);
SELECT * FROM hongong2;

SHOW GLOBAL VARIABLES;

-- 11/06 학습
SET @myVar1 = 5;
SET @myVar2 = 4.25;

SELECT @myVar1;
SELECT @myVar1 + @myVar2;

SET @txt = '가수 이름 ==> ';
SET @height = 166;
SELECT @txt, mem_name FROM member WHERE height > @height;

SET @count = 3;
-- SELECT mem_name, height FROM member ORDER BY height LIMIT @count; 
-- 문법상 오류!

SET @count = 3;
PREPARE mySQL FROM 'SELECT mem_name, height FROM member ORDER BY height LIMIT ?';
EXECUTE mySQL USING @count;
-- SELECT mem_name, height FROM member ORDER BY height LIMIT 3 과 같은 결과 출력

SELECT AVG(price) AS '평균가격' FROM buy;

SELECT CAST(AVG(price) AS SIGNED) '평균 가격' FROM buy;
-- 또는
SELECT CONVERT(AVG(price) , SIGNED) '평균 가격' FROM buy;

SELECT CAST('2022$12$12' AS DATE);
-- SELECT CAST('2022$12$12' , DATE); 얘는 요렇게 표시할 수 없군
SELECT CAST('2022/12/12' AS DATE);
SELECT CAST('2022%12%12' AS DATE);
SELECT CAST('2022@12@12' AS DATE);

SELECT num, CONCAT(CAST(price AS CHAR), 'X', CAST(amount AS CHAR), '=')
   '가격 X 수량', price * amount '구매액'
   FROM buy;
    
SELECT '100' + '200';

SELECT CONCAT('100', '200');

SELECT CONCAT(100, '200');
SELECT 100 + '200';

SELECT *
   FROM buy
    INNER JOIN member
    ON buy.mem_id = member.mem_id;

SELECT *
   FROM buy
    INNER JOIN member
    ON buy.mem_id = member.mem_id
    WHERE buy.mem_id = 'GRL';
-- WHERE : 완성된 테이블 중 조건 만족하는 것만 출력

SELECT mem_id, mem_name, prod_name, addr, CONCAT(phone1, phone2) '연락처'
   FROM buy
      INNER JOIN member
        ON buy.mem_id = member.mem_id;
-- 오류 발생
        
SELECT buy.mem_id, mem_name, prod_name, addr, CONCAT(phone1, phone2) '연락처'
   FROM buy
      INNER JOIN member
        ON buy.mem_id = member.mem_id;
-- 열 출처를 보다 명확하게 해줘야 오류가 안 남.

SELECT buy.mem_id, member.mem_name, buy.prod_name, member.addr, CONCAT(member.phone1, member.phone2) '연락처'
   FROM buy
      INNER JOIN member
        ON buy.mem_id = member.mem_id;
        
SELECT B.mem_id, M.mem_name, B.prod_name, M.addr, CONCAT(M.phone1, M.phone2) '연락처'
   FROM buy B
      INNER JOIN member M
        ON B.mem_id = M.mem_id;

SELECT B.mem_id, M.mem_name, B.prod_name, M.addr
   FROM buy B
      INNER JOIN member M
        ON B.mem_id = M.mem_id
   ORDER BY M.mem_id;

SELECT B.mem_id, M.mem_name, B.prod_name, M.addr
   FROM buy B
      LEFT OUTER JOIN member M
        ON B.mem_id = M.mem_id
   ORDER BY M.mem_id;

SELECT M.mem_id, M.mem_name, B.prod_name, M.addr
   From member M
      LEFT OUTER JOIN buy B
        ON M.mem_id = B.mem_id
   ORDER BY M.mem_id;
    
SELECT M.mem_id, M.mem_name, B.prod_name, M.addr
   From member M
      INNER JOIN buy B
        ON M.mem_id = B.mem_id
   ORDER BY M.mem_id;

SELECT *
   From buy B
      LEFT OUTER JOIN member M
        ON M.mem_id = B.mem_id;
        
SELECT *
   From member M
      LEFT OUTER JOIN buy B
        ON M.mem_id = B.mem_id;

CREATE TABLE emp_table(emp CHAR(4), manager CHAR(4), phone VARCHAR(8));

INSERT INTO emp_table VALUES ('대표', null , '0000');
INSERT INTO emp_table VALUES ('영업이사', '대표' , '1111');
INSERT INTO emp_table VALUES ('관리이사', '대표' , '2222');
INSERT INTO emp_table VALUES ('정보이사', '대표' , '3333');
INSERT INTO emp_table VALUES ('영업과장', '영업이사' , '1111-1');
INSERT INTO emp_table VALUES ('경리부장', '관리이사' , '2222-1');
INSERT INTO emp_table VALUES ('인사부장', '관리이사' , '2222-2');
INSERT INTO emp_table VALUES ('개발팀장', '정보이사' , '3333-1');
INSERT INTO emp_table VALUES ('개발주임', '정보이사' , '3333-1-1');

SELECT A.emp "직원", B.emp "직속상관", B.phone "직속상관연락처"
   FROM emp_table A
      INNER JOIN emp_table B
        ON A.manager = B.emp
   WHERE A.emp = '경리부장';

DROP PROCEDURE IF EXISTS ifProc3;
DELIMITER $$
CREATE PROCEDURE ifProc3()
BEGIN
   DECLARE debutDate DATE; -- 데뷔 일자
    DECLARE curDate DATE; -- 오늘
    DECLARE days INT; -- 활동한 일수
    
    SELECT debut_date INTO debutDate
      FROM market_db.member
        WHERE mem_id = 'APN';
        
        SET curDate = current_date(); -- 현재 날짜
        SET days = datediff(curDate, debutDate); -- 날짜의 차이, 일 단위
        
        IF (days/365) >= 5 THEN -- 5년이 지났다면
         SELECT concat('데뷔한 지 ' , days, '일이나 지났습니다. 핑순이들 축하합니다!');
      ELSE
         SELECT '데뷔한 지 ' + days + '일밖에 안 되었네요. 핑순이들 화이팅~';
      END IF;
   END $$
DELIMITER ;
CALL ifProc3;


SELECT mem_id, SUM(price*amount) "총구매액"
   FROM buy
    GROUP BY mem_id -- 여기까지 쓰면 mem_id 4개, 총구매액 4개 나옴
    ORDER BY SUM(price*amount) DESC; -- 총 구매액 큰 멤버부터 정렬 (A)
    
SELECT B.mem_id, M.mem_name, SUM(price*amount) "총구매액"
   FROM buy B
      INNER JOIN member M
        ON B.mem_id = M.mem_id
   GROUP BY B.mem_id
    ORDER BY SUM(price*amount) DESC; -- A 결과에 mem_name 삽입 (B)
    
SELECT M.mem_id, M.mem_name, SUM(price*amount) "총구매액"
   FROM buy B
      RIGHT OUTER JOIN member M
        ON B.mem_id = M.mem_id
   GROUP BY M.mem_id
    ORDER BY SUM(price*amount) DESC; -- B 결과와 함께 NULL 인 멤버도 출력(오름차순) (C)
   
SELECT M.mem_id, M.mem_name, SUM(price*amount) "총구매액",
   CASE
      WHEN (SUM(price*amount) >= 1500) THEN '최우수고객'
        WHEN (SUM(price*amount) >= 1000) THEN '우수고객'
        WHEN (SUM(price*amount) >= 1) THEN '일반고객'
      ELSE '유령고객'
   END "회원등급"
    FROM buy B
      RIGHT OUTER JOIN member M
        ON B.mem_id = M.mem_id
   GROUP BY M.mem_id
    ORDER BY SUM(price*amount) DESC; -- C 결과에 회원등급 추가
    
DROP PROCEDURE IF EXISTS whileProc;
DELIMITER $$
CREATE PROCEDURE whileProc()
BEGIN
   DECLARE i INT; -- 1에서 100까지 증가할 변수
    DECLARE hap INT; -- 더한 값을 누적할 변수
    SET i = 1;
    SET hap = 0;
    
    WHILE (i <= 100) DO
      SET hap = hap + i; -- hap의 원래 값에 i를 더해서 다시 hap 에 넣으라는 의미
        SET i = i + 1;     -- i의 원래 값에 1을 더해서 다시 i에 넣으라는 의미
   END WHILE;
    
    SELECT '1부터 100까지의 합 ==>' , hap;
    END $$
DELIMITER 
CALL whileProc();

DROP PROCEDURE IF EXISTS whileProc2;
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
            ITERATE myWhile; -- 지정한 label 문으로 가서 계속 진행
      END IF;
        SET hap = hap + i;
        IF(hap > 1000) THEN
         LEAVE myWhile; -- 지정한 label 문을 떠남. 즉 While 종료
      END IF;
        SET i = i+1;
   END WHILE;
    
    SELECT '1부터 100까지의 합(4의 배수 제외), 1000 넘으면 종료 ==> ', hap;
END $$
DELIMITER ;
CALL whileProc2();

use market_db;
PREPARE myQuery FROM 'SELECT * FROM member WHERE mem_id = "BLK"';
EXECUTE myQuery;
DEALLOCATE PREPARE myQuery; -- close() 랑 같은 기능

DROP TABLE IF EXISTS gate_table;
CREATE TABLE gate_table (id INT AUTO_INCREMENT PRIMARY KEY, entry_time DATETIME);

SET @curDATE = CURRENT_TIMESTAMP(); -- 현재 날짜와 시간

PREPARE myQuery FROM 'INSERT INTO gate_table VALUES (NULL, ?)';
EXECUTE myQuery USING @curDate;
DEALLOCATE PREPARE myQuery;

SELECT * FROM gate_table;

CREATE TABLE 고객 
(
    고객아이디 VARCHAR(20) PRIMARY KEY,
     고객이름 VARCHAR(10) NOT NULL,
     나이 INT,
     등급 VARCHAR(10) NOT NULL,
     직업 VARCHAR(20),
     적립금 INT DEFAULT 0
);

CREATE TABLE 제품 
(
   제품번호 CHAR(3) PRIMARY KEY,
    제품명 VARCHAR(20),
    재고량 INT,
    단가 INT,
    제조업체 VARCHAR(20)
    CHECK (재고량 >= 0 AND 재고량 <= 10000)
);

CREATE TABLE 주문
(
   주문번호 CHAR(3) PRIMARY KEY,
    주문고객 VARCHAR(20),
    주문제품 CHAR(3),
    수량 INT,
    배송지 VARCHAR(30),
    주문일자 DATE,
    FOREIGN KEY(주문고객) REFERENCES 고객(고객아이디),
    FOREIGN KEY(주문제품) REFERENCES 제품(제품번호)
);

CREATE TABLE 배송업체
(
   업체번호 CHAR(3) PRIMARY KEY,
    업체명 VARCHAR(20),
    주소 VARCHAR(100),
    전화번호 VARCHAR(20)
);

ALTER TABLE 고객 ADD 가입날짜 DATE;

ALTER TABLE 고객 DROP COLUMN 가입날짜;

ALTER TABLE 고객 ADD CONSTRAINT CHK_AGE CHECK(나이 >= 20); -- 11/06 여기까지 학습

-- 11/07 여기부터 학습
DROP DATABASE IF EXISTS market_db; -- 만약 market_db가 존재하면 우선 삭제한다.
CREATE DATABASE market_db;

USE market_db;
DROP TABLE IF EXISTS member, buy; 
CREATE TABLE member -- 회원 테이블
( mem_id        CHAR(8) NOT NULL PRIMARY KEY, -- 사용자 아이디(PK)
  mem_name       VARCHAR(10) NOT NULL, -- 이름
  mem_number    INT NOT NULL,  -- 인원수
  addr           CHAR(2) NOT NULL, -- 지역(경기,서울,경남 식으로 2글자만입력)
  phone1      CHAR(3), -- 연락처의 국번(02, 031, 055 등)
  phone2      CHAR(8), -- 연락처의 나머지 전화번호(하이픈제외)
  height       SMALLINT,  -- 평균 키
  debut_date   DATE  -- 데뷔 일자
);
CREATE TABLE buy -- 구매 테이블
(  num       INT AUTO_INCREMENT NOT NULL PRIMARY KEY, -- 순번(PK)
   mem_id     CHAR(8) NOT NULL, -- 아이디(FK)
   prod_name    CHAR(6) NOT NULL, --  제품이름
   group_name    CHAR(4)  , -- 분류
   price        INT  NOT NULL, -- 가격
   amount       SMALLINT  NOT NULL, -- 수량
   FOREIGN KEY (mem_id) REFERENCES member(mem_id)
);

INSERT INTO member VALUES('TWC', '트와이스', 9, '서울', '02', '11111111', 167, '2015.10.19');
INSERT INTO member VALUES('BLK', '블랙핑크', 4, '경남', '055', '22222222', 163, '2016.08.08');
INSERT INTO member VALUES('WMN', '여자친구', 6, '경기', '031', '33333333', 166, '2015.01.15');
INSERT INTO member VALUES('OMY', '오마이걸', 7, '서울', NULL, NULL, 160, '2015.04.21');
INSERT INTO member VALUES('GRL', '소녀시대', 8, '서울', '02', '44444444', 168, '2007.08.02');
INSERT INTO member VALUES('ITZ', '잇지', 5, '경남', NULL, NULL, 167, '2019.02.12');
INSERT INTO member VALUES('RED', '레드벨벳', 4, '경북', '054', '55555555', 161, '2014.08.01');
INSERT INTO member VALUES('APN', '에이핑크', 6, '경기', '031', '77777777', 164, '2011.02.10');
INSERT INTO member VALUES('SPC', '우주소녀', 13, '서울', '02', '88888888', 162, '2016.02.25');
INSERT INTO member VALUES('MMU', '마마무', 4, '전남', '061', '99999999', 165, '2014.06.19');

INSERT INTO buy VALUES(NULL, 'BLK', '지갑', NULL, 30, 2);
INSERT INTO buy VALUES(NULL, 'BLK', '맥북프로', '디지털', 1000, 1);
INSERT INTO buy VALUES(NULL, 'APN', '아이폰', '디지털', 200, 1);
INSERT INTO buy VALUES(NULL, 'MMU', '아이폰', '디지털', 200, 5);
INSERT INTO buy VALUES(NULL, 'BLK', '청바지', '패션', 50, 3);
INSERT INTO buy VALUES(NULL, 'MMU', '에어팟', '디지털', 80, 10);
INSERT INTO buy VALUES(NULL, 'GRL', '혼공SQL', '서적', 15, 5);
INSERT INTO buy VALUES(NULL, 'APN', '혼공SQL', '서적', 15, 2);
INSERT INTO buy VALUES(NULL, 'APN', '청바지', '패션', 50, 1);
INSERT INTO buy VALUES(NULL, 'MMU', '지갑', NULL, 30, 1);
INSERT INTO buy VALUES(NULL, 'APN', '혼공SQL', '서적', 15, 1);
INSERT INTO buy VALUES(NULL, 'MMU', '지갑', NULL, 30, 4);

SELECT * FROM member;
SELECT * FROM buy;

USE market_db;
CREATE VIEW v_member
AS
SELECT mem_id, mem_name, addr FROM member;

SELECT * FROM v_member; -- 이 부분은 drop buy; 해야 제대로 보일 수도 있음

SELECT mem_name, addr FROM v_member
WHERE addr IN ('서울', '경기');

SELECT B.mem_id, M.mem_name, B.prod_name, M.addr, CONCAT(M.phone1, M.phone2) '연락처'
FROM buy B
   INNER JOIN member M
   ON B.mem_id = M.mem_id;

CREATE VIEW v_memberbuy
AS
   SELECT B.mem_id, M.mem_name, B.prod_name, M.addr, CONCAT(M.phone1, M.phone2) '연락처'
   FROM buy B
      INNER JOIN member M
      ON B.mem_id = M.mem_id;
        
SELECT * FROM v_memberbuy WHERE mem_name = '블랙핑크';

-- 뷰의 실제 작동

USE market_db;
CREATE VIEW v_viewtest1
AS
   SELECT B.mem_id 'Member ID', M.mem_name AS 'Member Name', B.prod_name 'Product Name', -- 이 부분 전체 /일부 백틱 처리해도 동일한 결과 나옴
      CONCAT(M.phone1, M.phone2) AS "OFFICE Phone"
   FROM buy B
      INNER JOIN member M
        ON B.mem_id = M.mem_id;
SELECT DISTINCT `Member ID`, `Member Name` FROM v_viewtest1;

ALTER VIEW v_viewtest1
AS
   SELECT B.mem_id '회원 아이디', M.mem_name AS '회원 이름', B.prod_name "제품 이름",
      CONCAT(M.phone1, M.phone2) AS "연락처"
   FROM buy B
      INNER JOIN member M
        ON B.mem_id = M.mem_id;

SELECT DISTINCT `회원 아이디`, `회원 이름` FROM v_viewtest1;

-- 뷰의 삭제
DROP VIEW v_viewtest1;
    
UPDATE v_member SET addr = '부산' WHERE mem_id = 'BLK';


SELECT * FROM v_member;

-- 이런 식으로 전체 열에 3개의 데이터만 입력할 수는 없다.
INSERT INTO v_member(mem_id, mem_name, addr) VALUES ('BTS', '방탄소년단', '경기');

CREATE VIEW v_height167
AS
   SELECT * FROM member WHERE height >= 167;

SELECT * FROM v_height167;

DELETE FROM v_height167 WHERE height < 167;

INSERT INTO v_height167 VALUES('TRA', '티아라', 6, '서울', NULL, NULL, 159, '2005-01-01');

SELECT * FROM v_height167;

-- 오류 발생함
ALTER VIEW v_height167
AS
   SELECT * FROM member WHERE height >= 167
         WITH CHECK OPTION;

INSERT INTO v_height167 VALUES('TOB', '텔레토비', 4, '영국', NULL, NULL, 140, '1995-01-01');

USE market_db;
DROP PROCEDURE IF EXISTS user_proc;
DELIMITER $$
CREATE PROCEDURE user_proc()
BEGIN
   SELECT * FROM member;
END $$
DELIMITER ;
CALL user_proc();

-- 프로시저 삭제
DROP PROCEDURE user_proc;

USE market_db;
DROP PROCEDURE IF EXISTS user_proc1;
DELIMITER $$
CREATE PROCEDURE user_proc1(IN userName VARCHAR(10))
BEGIN
   SELECT * FROM member WHERE mem_name = userName;
END $$
DELIMITER ;
CALL user_proc1('에이핑크');

DROP PROCEDURE IF EXISTS user_proc2;
DELIMITER $$
CREATE PROCEDURE user_proc2(
   IN userNumber INT,
    IN userHeight INT
)
BEGIN
   SELECT * FROM member
      WHERE mem_number > userNumber AND height > userHeight;
END $$
DELIMITER ;
CALL user_proc2(6, 165);

DROP PROCEDURE IF EXISTS user_proc3;
DELIMITER $$
CREATE PROCEDURE user_proc3(
IN txtValue CHAR(10),
OUT outValue INT
)
BEGIN
   INSERT INTO noTable VALUES(NULL, txtValue);
    SELECT Max(id) INTO outValue FROM noTable;
END $$
DELIMITER ;

DESC noTable;

CREATE TABLE IF NOT EXISTS noTable
(
   id INT AUTO_INCREMENT PRIMARY KEY,
    txt CHAR(10)
);

CALL user_proc3('테스트1', @myValue);
CALL user_proc3('테스트2', @myValue);
CALL user_proc3('테스트3', @myValue);
SELECT CONCAT('입력된 ID 값 ==>', @myValue);

DROP PROCEDURE IF EXISTS ifelse_proc;
DELIMITER $$
CREATE PROCEDURE ifelse_proc(
   IN memName VARCHAR(10)
)
BEGIN
   DECLARE debutYear INT; -- 변수 선언
    SELECT YEAR(debut_date) INTO debutYear FROM member
      WHERE mem_name = memName;
   IF(debutYear >= 2015) THEN
         SELECT '신인 가수네요. 화이팅하세요' AS '메시지';
   ELSE
         SELECT '고참 가수네요. 그동안 수고하셨어요.' AS '메시지';
   END IF;

END $$
DELIMITER ;
CALL ifelse_proc('오마이걸');

DROP PROCEDURE IF EXISTS while_proc;
DELIMITER $$
CREATE PROCEDURE while_proc() -- 이 뒤에는 세미콜론 안 붙음. 주의
BEGIN
   DECLARE hap INT; -- 합계
    DECLARE num INT; -- 1부터 100까지 증가
    SET hap = 0; -- 합계 초기화
    SET num = 1;
    
    WHILE (num <= 100) DO -- 100까지 반복
      SET hap = hap + num;
        SET num = num + 1; -- 숫자 증가
   END WHILE;
    SELECT hap AS '1~100 합계';

END $$
DELIMITER ;
CALL while_proc();

DROP PROCEDURE IF EXISTS dynamic_proc;
DELIMITER $$
CREATE PROCEDURE dynamic_proc(
   IN tableName VARCHAR(20)
)
BEGIN
   SET @sqlQuery = CONCAT('SELECT * FROM ', tableName);
    PREPARE myQuery FROM @sqlQuery;
    EXECUTE myQuery;
    DEALLOCATE PREPARE myQuery;
END $$
DELIMITER ;
CALL dynamic_proc('member');

-- 11/07 여기까지 학습

-- 11/08 여기부터 학습
USE market_db;
CREATE TABLE table1
(
col1 INT PRIMARY KEY,
    col2 INT,
    col3 INT
);

SHOW INDEX FROM table1; -- PK 확인됨

CREATE TABLE table2
(
	col1 INT PRIMARY KEY,
    col2 INT UNIQUE,
    col3 INT UNIQUE
);

SHOW INDEX FROM table2; -- PK 가 아닌 것도 보임

USE market_db;
DROP TABLE IF EXISTS buy, member;
CREATE TABLE member
(
mem_id CHAR(8),
    mem_name VARCHAR(10),
    mem_number INT,
    addr CHAR(2)
);

INSERT INTO member VALUES('TWC', '트와이스', 9, '서울');
INSERT INTO member VALUES('BLK', '블랙핑크', 4, '경남');
INSERT INTO member VALUES('WMN', '여자친구', 6, '경기');
INSERT INTO member VALUES('OMY', '오마이걸', 7, '서울');

SELECT * FROM member;

-- 클러스터형 인덱스가 생성된 열로 데이터가 자동 정렬됨(오름차순)
ALTER TABLE member
ADD CONSTRAINT
    PRIMARY KEY (mem_id);
    
SELECT * FROM member;

-- UNIQUE 는 정렬 안 됨 (클러스터형을 안 해보고 이거 실행해보면 알 수 있다)
ALTER TABLE member
ADD CONSTRAINT
    UNIQUE (mem_id);
    
SELECT * FROM member;

SHOW INDEX FROM member;

-- 인덱스 삭제하는 방법 (DROP INDEX index_name ON table_name;)
DROP INDEX idx_member_mem_number
ON member;


CREATE INDEX idx_member_addr
ON member(addr);

SHOW INDEX FROM member;
SHOW TABLE STATUS LIKE 'member';
-- ANALYZE TABLE member; 없이 이것만 작성하면 제대로 출력 안됨
ANALYZE TABLE member;
SHOW TABLE STATUS LIKE 'member'; -- ANALYZE TABLE member; 넣고 Index_length 가 제대로 나오는 것 확인


-- 오류 발생 (Error Code: 1062. Duplicate entry '4' for key 'member.idx_member_mem_number')
-- 오류 발생하려면 4 라는 데이터가 중복된, market_db 데이터가 있어야 함 (스크롤 위쪽!!)
-- 꼭 작성해야 하면 UNIQUE 빼기
CREATE UNIQUE INDEX idx_member_mem_number
ON member(mem_number);

CREATE UNIQUE INDEX idx_member_mem_name
ON member(mem_name);

SHOW INDEX FROM member;

-- 오류 발생(Error Code: 1062. Duplicate entry '마마무' for key 'member.idx_member_mem_name')
INSERT INTO member VALUES ('MOO', '마마무', 2, '태국', '001', '12341234', 155, '2020.10.10');

ANALYZE TABLE member;
SHOW INDEX FROM member;
SELECT * FROM member;

SELECT mem_id, mem_name, addr
FROM member
    WHERE mem_name = '에이핑크';
    
CREATE INDEX idx_member_mem_number
ON member(mem_number);
ANALYZE TABLE member;

SELECT mem_name, mem_number
FROM member
WHERE mem_number >= 7;

SELECT mem_name, mem_number
FROM member
WHERE mem_number >= 1;

-- 스토어드 함수 생성 권한 허용. 1은 true 라는 뜻. 한번만 설정해주면 됨.
-- 0 row(s) affected, 1 warning(s): 1287 '@@log_bin_trust_function_creators' is deprecated and will be removed in a future release. 나와도 정상.
SET GLOBAL log_bin_trust_function_creators = 1;

USE market_db;
DROP FUNCTION IF EXISTS sumFunc;
DELIMITER $$
CREATE FUNCTION sumFunc(number1 INT, number2 INT)
RETURNS INT
BEGIN
RETURN number1 + number2;
END $$
DELIMITER ;
SELECT sumFunc(100, 200) AS '합계';

DROP FUNCTION IF EXISTS calcYearFunc;
DELIMITER $$
CREATE FUNCTION calcYearFunc(dYear INT)
RETURNS INT
BEGIN
DECLARE runYear INT; -- 활동기간(연도)
    SET runYear = YEAR(CURDATE()) - dYear;
    RETURN runYear;
END $$
DELIMITER ;

SELECT calcYearFunc(2010) AS '활동햇수';

SELECT calcYearFunc(2007) INTO @debut2007;
SELECT calcYearFunc(2013) INTO @debut2013;
SELECT @debut2007-@debut2013 AS '2007과 2013 차이';

SELECT mem_id, mem_name, calcYearFunc(YEAR(debut_date)) AS '활동햇수'
FROM member;

SHOW CREATE FUNCTION calcYearFunc;
    
-- 실행은 안 함
DROP FUNCTION calcYearFunc;

USE market_db;
DROP PROCEDURE IF EXISTS cursor_proc;
DELIMITER $$
CREATE PROCEDURE cursor_proc()
BEGIN
DECLARE memNumber INT;
    DECLARE cnt INT DEFAULT 0;
    DECLARE totNumber INT DEFAULT 0;
    DECLARE endOfRow BOOLEAN DEFAULT FALSE;
    
    DECLARE memberCursor CURSOR FOR
SELECT mem_number FROM member;
        
DECLARE CONTINUE HANDLER
FOR NOT FOUND SET endOfRow = TRUE;

OPEN memberCursor;

cursor_loop : LOOP
FETCH memberCurSor INTO memNumber;
IF endOfRow THEN
LEAVE cursor_loop; -- 이 부분을 빼먹으면 안돼!
END IF;

SET cnt = cnt + 1;
SET totNumber = totNumber + memNumber;
END LOOP cursor_loop;

SELECT (totNumber/cnt) AS '회원의 평균 인원 수';

CLOSE memberCursor;
END $$
DELIMITER ;

CALL cursor_proc();

-- 11/08 여기까지 학습

-- 11/11 여기부터 학습 (트리거)
USE market_db;

CREATE TABLE IF NOT EXISTS trigger_table(id INT, txt VARCHAR(10));
INSERT INTO trigger_table VALUES(1, '레드벨벳');
INSERT INTO trigger_table VALUES(2, '잇지');
INSERT INTO trigger_table VALUES(3, '블랙핑크');

DROP TRIGGER IF EXISTS myTrigger;
DELIMITER $$
CREATE TRIGGER myTrigger
	AFTER DELETE
	ON trigger_table
	FOR EACH ROW
BEGIN
SET @msg = '가수 그룹이 삭제됨'; -- 트리거 실행 시 작동되는 코드들
END $$
DELIMITER ;

SET @msg = '';
INSERT INTO trigger_table VALUES (4, '마마무');
SELECT @msg;
UPDATE trigger_table SET txt = '블핑' WHERE id = 3;
SELECT @msg;

SELECT * FROM trigger_table; -- 블랙핑크가 블핑으로 바뀐 것 확인

DELETE FROM trigger_table WHERE id = 4;
SELECT @msg;

USE market_db;
CREATE TABLE singer(SELECT mem_id, mem_name, mem_number, addr FROM member);

CREATE TABLE backup_singer
(
	mem_id CHAR(8) NOT NULL,
    mem_number INT NOT NULL,
    addr CHAR(2) NOT NULL,
    modType CHAR(2), -- 변경된 타입. '수정' 또는 '삭제'
    modDate Date, -- 변경된 날짜
    modUser VARCHAR(30) -- 변경한 사용자
);

DROP TRIGGER IF EXISTS singer_updateTrg;
DELIMITER $$
CREATE TRIGGER singer_updateTrg -- 트리거 이름
	AFTER UPDATE -- 변경 후에 작동하도록 지정
	ON singer -- 트리거를 부착할 테이블
    FOR EACH ROW
BEGIN
	INSERT INTO backup_singer VALUES (OLD.mem_id, OLD.mem_name, OLD.mem_number, OLD.addr,
		'수정', CURDATE(), CURRENT_USER());
END $$
DELIMITER ;

DROP TRIGGER IF EXISTS singer_deleteTrg;
DELIMITER $$
CREATE TRIGGER singer_deleteTrg -- 트리거 이름
	AFTER DELETE -- 삭제 후에 작동하도록 지정
	ON singer -- 트리거를 부착할 테이블
	FOR EACH ROW
BEGIN
	INSERT INTO backup_singer VALUES (OLD.mem_id, OLD.mem_name, OLD.mem_number, OLD.addr,
		'삭제', CURDATE(), CURRENT_USER());
END $$
DELIMITER ;

UPDATE singer SET addr = '영국' WHERE mem_id = 'BLK';
DELETE FROM singer WHERE mem_number >= 7;

SELECT * FROM backup_singer;

-- TRUNCATE 는 DELETE 트리거에 적용이 안 됨.
TRUNCATE TABLE singer;

SELECT * FROM backup_singer;

-- 11/11 여기까지 학습	
