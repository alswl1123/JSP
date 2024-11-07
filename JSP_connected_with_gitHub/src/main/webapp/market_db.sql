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
    



