CREATE DATABASE naver_db; -- 11/07 수업 시작

USE naver_db;

DROP TABLE IF EXISTS member, buy;

CREATE TABLE member(
id VARCHAR(10) Primary Key,
name VARCHAR(10),
no INT,
addr CHAR(2),
tel1 CHAR(3),
tel2 CHAR(10),
height INT(3) UNSIGNED,
debut DATE
);

SELECT * FROM member;

CREATE TABLE buy(
num INT AUTO_INCREMENT PRIMARY KEY,
id VARCHAR(10),
product VARCHAR(20),
category CHAR(10),
price INT,
amount INT,
FOREIGN KEY(id) REFERENCES member (id)
);

SELECT * FROM buy;

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

-- 테이블 만들기 연습 끝. 여기서부터 교재 실습 -----------------------------------------

-- PK 는 이런 식으로도 지정 (방식 1)
USE naver_db;
DROP TABLE IF EXISTS member;
CREATE TABLE member
(
mem_id CHAR(8) NOT NULL PRIMARY KEY,
    mem_name VARCHAR(10) NOT NULL,
    height TINYINT UNSIGNED NULL
);

DESCRIBE member;

-- PK 는 이런 식으로도 지정 (방식 2)
DROP TABLE IF EXISTS member;
CREATE TABLE member
(
mem_id CHAR(8) NOT NULL,
    mem_name VARCHAR(10) NOT NULL,
    height TINYINT UNSIGNED NULL,
    PRIMARY KEY(mem_id)
);

-- PK 는 이런 식으로도 지정 (방식 3)
DROP TABLE IF EXISTS member;
CREATE TABLE member
(
mem_id CHAR(8) NOT NULL,
    mem_name VARCHAR(10) NOT NULL,
    height TINYINT UNSIGNED NULL
);
ALTER TABLE member
ADD CONSTRAINT
    PRIMARY KEY(mem_id); -- mem_id 를 PK 로 지정
    
SELECT * FROM member; -- 여기까지는 정상 작동
    
-- 기본 키에 이름 지정하기 (이름을 지정해야 삭제할 수 있다)
DROP TABLE IF EXISTS member;
CREATE TABLE member
(
mem_id CHAR(8) NOT NULL,
    mem_name VARCHAR(10) NOT NULL,
    height TINYINT UNSIGNED NULL,
    CONSTRAINT PRIMARY KEY PK_member_mem_id (mem_id)
);

-- ------------------------------------------------

DROP TABLE IF EXISTS buy, member;
CREATE TABLE member
(
mem_id CHAR(8) NOT NULL PRIMARY KEY,
    mem_name VARCHAR(10) NOT NULL,
    height TINYINT UNSIGNED NULL
);

CREATE TABLE buy
(
num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    mem_id CHAR(8) NOT NULL,
    prod_name CHAR(6) NOT NULL,
    FOREIGN KEY(mem_id) REFERENCES member(mem_id)
);

-- 기준 테이블의 열 이름과 참조 테이블의 열 이름 (member, buy 이미 생성되어 있으면 중복됨)
CREATE TABLE member
(
mem_id CHAR(8) NOT NULL PRIMARY KEY,
    mem_name VARCHAR(10) NOT NULL,
    height TINYINT UNSIGNED NULL
);

CREATE TABLE buy
(
num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    user_id CHAR(8) NOT NULL,
    prod_name CHAR(6) NOT NULL,
    FOREIGN KEY(user_id) REFERENCES member(mem_id)
);

-- -------------------------------------------------------------------------

DROP TABLE IF EXISTS buy;
CREATE TABLE buy
(
num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    mem_id CHAR(8) NOT NULL,
    prod_name CHAR(6) NOT NULL
);

-- 제약사항 추가(buy 와 member 의 id 를 FK,PK 로 연결)
ALTER TABLE buy
ADD CONSTRAINT
    FOREIGN KEY(mem_id)
    REFERENCES member(mem_id); -- 여기까지 정상 작동
    
INSERT INTO member VALUES('BLK', '블랙핑크', 163);
INSERT INTO buy VALUES(NULL, 'BLK', '지갑');
INSERT INTO buy VALUES(NULL, 'BLK', '맥북'); -- INSERT INTO buy 하면 Error Code: 1048. Column 'mem_id' cannot be null 오류 발생

-- 내부 조인
SELECT M.mem_id, M.mem_name, B.prod_name
FROM buy B
INNER JOIN member M
        ON B.mem_id = M.mem_id;
        
-- 오류 발생!
UPDATE member SET mem_id = 'PINK' WHERE mem_id = 'BLK';
DELETE FROM member WHERE mem_id = 'BLK';

DROP TABLE IF EXISTS buy;
CREATE TABLE buy
(
num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    mem_id CHAR(8) NOT NULL,
    prod_name CHAR(6) NOT NULL
);

-- ON UPDATE CASCADE, ON DELETE CASCADE = 모두 바꿔!
ALTER TABLE buy
ADD CONSTRAINT
    FOREIGN KEY(mem_id) REFERENCES member(mem_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE; -- FOREIGN 부터 여기까지가 한줄
    
SELECT * FROM buy; -- 어떻게 나오는지 확인
    
INSERT INTO buy VALUES(NULL, 'BLK', '지갑');
INSERT INTO buy VALUES(NULL, 'BLK', '맥북');

SELECT * FROM buy; -- 어떻게 나오는지 확인

UPDATE member SET mem_id = 'PINK' WHERE mem_id = 'BLK';

SELECT M.mem_id, M.mem_name, B.prod_name
FROM buy B
INNER JOIN member M
ON B.mem_id = M.mem_id; -- 멤버 id 가 PINK 로 바뀌어야 정상

-- 멤버 id 가 PINK 인 모든 행 삭제
DELETE FROM member WHERE mem_id = 'PINK';

SELECT * FROM buy;

DROP TABLE IF EXISTS buy, member;
CREATE TABLE member
(
mem_id CHAR(8) NOT NULL PRIMARY KEY,
    mem_name VARCHAR(10) NOT NULL,
    height TINYINT UNSIGNED NULL,
    email CHAR(30) NULL UNIQUE
);

-- 이런 식으로 하면 오류 발생 (이메일 중복)
INSERT INTO member VALUES('BLK', '블랙핑크', 163, 'pink@gmail.com');
INSERT INTO member VALUES('TWC', '트와이스', 167, NULL);
INSERT INTO member VALUES('APN', '에이핑크', 164, 'pink@gmail.com');

-- 여기부터 다시 실행할 것

DROP TABLE IF EXISTS member;
CREATE TABLE member
(
mem_id CHAR(8) NOT NULL PRIMARY KEY,
    mem_name VARCHAR(10) NOT NULL,
    height TINYINT UNSIGNED NULL CHECK(height >= 100),
    phone1 CHAR(3) NULL
);

-- 체크 제약 조건에서 설정한 값의 범위를 벗어남
INSERT INTO member VALUES('BLK', '블랙핑크', 163, NULL);
INSERT INTO member VALUES('TWC', '트와이스', 99, NULL);

ALTER TABLE member
ADD CONSTRAINT
    CHECK(phone1 IN('02', '031', '032', '054', '055', '061'));
    
-- 체크 제약 조건 설정 후 조건에 위배되는 값 입력하면 오류 발생
INSERT INTO member VALUES('TWC', '트와이스', 167, '02');
INSERT INTO member VALUES('OMY', '오마이걸', 167, '010');

-- 기본값 정의
DROP TABLE IF EXISTS member;
CREATE TABLE member
(
mem_id CHAR(8) NOT NULL PRIMARY KEY,
    mem_name VARCHAR(10) NOT NULL,
    height TINYINT UNSIGNED NULL DEFAULT 160,
    phone1 CHAR(3) NULL
);

ALTER TABLE member
ALTER COLUMN phone1 SET DEFAULT '02';
    
INSERT INTO member VALUES('RED', '레드벨벳', 161, '054');
INSERT INTO member VALUES('SPC', '우주소녀', default, default);

SELECT * FROM member;

-- 11/07 여기까지 학습
