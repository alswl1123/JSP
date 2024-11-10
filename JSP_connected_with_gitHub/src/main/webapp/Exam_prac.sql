CREATE DATABASE Exam_prac;

USE Exam_prac;

-- 예제 7-1
CREATE TABLE 고객
(
	고객아이디 VARCHAR(20),
	고객이름 VARCHAR(10) NOT NULL,
	나이 INT,
	등급 VARCHAR(10) NOT NULL,
	직업 VARCHAR(20),
	적립금 INT DEFAULT 0,
	PRIMARY KEY(고객아이디)
);

-- 예제 7-2
CREATE TABLE 제품
(
	제품번호 CHAR(3),
	제품명 VARCHAR(20),
	재고량 INT,
	단가 INT,
	제조업체 VARCHAR(20),
	PRIMARY KEY(제품번호),
	CHECK(재고량 >= 0 AND 재고량 <= 10000) -- 체크함수
);

-- 예제 7-3
CREATE TABLE 주문
(
	주문번호 CHAR(3),
    주문고객 VARCHAR(20),
    주문제품 CHAR(3),
    수량 INT,
    배송지 VARCHAR(30),
    주문일자 DATE,
    PRIMARY KEY(주문번호),
    FOREIGN KEY(주문고객) REFERENCES 고객(고객아이디),
    FOREIGN KEY(주문제품) REFERENCES 제품(제품번호)
);

-- 예제 7-4
CREATE TABLE 배송업체
(
	업체번호 CHAR(3),
    업체명 VARCHAR(20),
    주소 VARCHAR(100),
    전화번호 VARCHAR(20),
    PRIMARY KEY(업체번호)
);

-- 새로운 속성 추가
-- ALTER TABLE 테이블_이름
-- ADD 속성_이름 데이터_타입 [NOT NULL] [DEFAULT 기본값];

-- 예제 7-5 (고객 테이블에 가입날짜 속성 추가)
ALTER TABLE 고객
	ADD 가입날짜 DATE;

-- 예제 7-6 (고객 테이블의 가입날짜 속성 삭제)
ALTER TABLE 고객
	DROP COLUMN 가입날짜;

-- 예제 7-7 (데이터 무결성 제약조건 추가)
ALTER TABLE 고객 
	ADD CONSTRAINT CHK_AGE CHECK(나이 >= 20);
    
-- 예제 7-8 (데이터 무결성 제약조건 삭제)
ALTER TABLE 고객
	DROP CONSTRAINT CHK_AGE;

-- 여기까지가 첫번째 시험 연습

-- 자료 입력함

INSERT INTO 고객 VALUES ('apple', '정소화', 20,'gold','학생',1000);
INSERT INTO 고객 VALUES ('banana', '김선우', 25,'vip','간호사',2500);
INSERT INTO 고객 VALUES ('carrot', '고명석', 28,'gold','교사',4500);
INSERT INTO 고객 VALUES ('orange', '김용욱', 22,'silver','학생',0);
INSERT INTO 고객 VALUES ('melon', '성원용', 35,'gold','회사원',5000);
INSERT INTO 고객 VALUES ('peach', '오형준', NULL,'silver','의사',300);
INSERT INTO 고객 VALUES ('pear', '채광주', 31,'silver','회사원',500);

INSERT INTO 제품 VALUES ('p01', '그냥만두', 5000, 4500,'대한식품');
INSERT INTO 제품 VALUES ('p02', '매운쫄면', 2500, 5500,'민국푸드');
INSERT INTO 제품 VALUES ('p03', '쿵떡파이', 3600, 2600,'한빛제과');
INSERT INTO 제품 VALUES ('p04', '맛난초콜릿', 1250, 2500,'한빛제과');
INSERT INTO 제품 VALUES ('p05', '얼큰라면', 2200, 1200,'대한식품');
INSERT INTO 제품 VALUES ('p06', '통통우동', 1000, 1550,'민국푸드');
INSERT INTO 제품 VALUES ('p07', '달콤비스킷', 1650, 1500,'한빛제과');

INSERT INTO 주문 VALUES ('o01','apple','p03', 10,'서울시 마포구','2019-01-01');
INSERT INTO 주문 VALUES ('o02','melon','p01', 5,'인천시 계양구','2019-01-10');
INSERT INTO 주문 VALUES ('o03','banana','p06', 45,'경기도 부천시','2019-01-11');
INSERT INTO 주문 VALUES ('o04','carrot','p02', 8,'부산시 금정구','2019-02-01');
INSERT INTO 주문 VALUES ('o05','melon','p06', 36,'경기도 용인시','2019-02-20');
INSERT INTO 주문 VALUES ('o06','banana','p01', 19,'충청북도 보은군','2019-03-02');
INSERT INTO 주문 VALUES ('o07','apple','p03', 22,'서울시 영등포구','2019-03-15');
INSERT INTO 주문 VALUES ('o08','pear','p02', 50,'강원도 춘천시','2019-04-10');
INSERT INTO 주문 VALUES ('o09','banana','p04', 15,'전라남도 목포시','2019-04-11');
INSERT INTO 주문 VALUES ('o10','carrot','p03', 20,'경기도 안양시','2019-05-22');

SELECT * FROM 고객;
SELECT * FROM 제품;
SELECT * FROM 주문;

-- SELECT문
-- SELECT [ALL | DISTINCT] 속성_리스트
-- FROM 테이블_리스트;

-- 예제 7-10 (고객 테이블에서 고객아이디, 고객이름, 등급 속성 검색)
SELECT 고객아이디, 고객이름, 등급 FROM 고객;

-- 예제 7-11 (고객 테이블에 존재하는 모든 속성 검색)
SELECT 고객아이디, 고객이름, 나이, 등급, 직업, 적립금 FROM 고객;
SELECT * FROM 고객; -- 이렇게 작성해도 됨 (예제 7-12)

-- 예제 7-13 (제품 테이블에서 제조업체 검색)
SELECT 제조업체 FROM 제품;

-- 예제 7-15 (제품 테이블에서 제조업체 속성을 중복없이 검색)
SELECT DISTINCT 제조업체 FROM 제품;

-- 예제 7-16 (제품 테이블에서 제품명과 단가를 검색하되, 단가를 가격이라는 새 이름으로 출력)
SELECT 제품명, 단가 AS 가격 FROM 제품;

-- 예제 7-17 (단가+500 = 조정단가)
SELECT 제품명, 단가 + 500 AS "조정단가" FROM 제품;

-- SELECT [ALL | DISTINCT] 속성_리스트
-- FROM 테이블_리스트
-- [WHERE 조건];

-- 예제 7-18 (제품 테이블에서 한빛제과가 제조한 제품의 제품명, 재고량, 단가 검색)
SELECT 제품명, 재고량, 단가 
FROM 제품
WHERE 제조업체 = '한빛제과';

-- 예제 7-19 (주문 테이블에서 apple 고객이 15개 이상 주문한 주문제품, 수량, 주문일자 검색)
SELECT 주문제품, 수량, 주문일자
FROM 주문
WHERE 주문고객 = 'apple' AND 수량 >= 15;

-- 예제 7-20 (주문 테이블에서 apple 고객이 주문했거나 15개 이상 주문된 제품의 주문제품, 수량, 주문일자, 주문고객 검색)
SELECT 주문제품, 수량, 주문일자, 주문고객
FROM 주문
WHERE 주문고객 = 'apple' OR 수량 >= 15;

-- 예제 7-21 (제품 테이블에서 단가가 2000원 이상이면서 3000원 이하인 제품의 제품명, 단가, 제조업체 검색)
SELECT 제품명, 단가, 제조업체
FROM 제품
WHERE 단가 >= 2000 AND 단가 <= 3000;

-- INSERT문
-- INSERT INTO 테이블_이름[(속성_리스트)]
-- VALUES (속성값_리스트);

-- 예제 7-47 (새로운 고객 정보 삽입, 삽입된 결과 확인)
INSERT INTO 고객(고객아이디, 고객이름, 나이, 등급, 직업, 적립금)
VALUES ('strawberry', '최유경', 30, 'vip', '공무원', 100);

SELECT * FROM 고객;

-- 예제 7-48 (새로운 고객 정보 삽입, 직업은 null, null인지 확인해보자)
INSERT INTO 고객(고객아이디, 고객이름, 나이, 등급, 적립금)
VALUES ('tomato', '정은심', 36, 'gold', 4000);

SELECT * FROM 고객;

-- UPDATE문
-- UPDATE 테이블_이름
-- SET 속성_이름1 = 값1, 속성_이름2 = 값2, ...
-- [WHERE 조건];

-- 예제 7-49 (제품 테이블에서 제품번호가 p03 인 제품의 제품명을 쿵떡파이 -> 통큰파이로 수정)
UPDATE 제품
SET 제품명 = '통큰파이'
WHERE 제품번호 = 'p03';

SELECT * FROM 제품;

-- 예제 7-50 (모든 제품 단가 10% 인상, 인상 내용 확인)
UPDATE 제품
SET 단가 = 단가 * 1.1;
-- 오류 발생함
-- Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.
-- 해결 : Edit > preferences > SQL Editor > Safe Updates 옵션 해제

SELECT * FROM 제품;

-- 예제 7-51 (정소화 고객이 주문한 제품의 주문수량 5개로 수정, 수정 내용 확인)
UPDATE 주문
SET 수량 = 5
WHERE 주문고객 IN (SELECT 고객아이디 FROM 고객 WHERE 고객이름 = '정소화');

SELECT * FROM 주문;

-- DELETE문
-- DELETE FROM 테이블_이름 [WHERE 조건];

-- 예제 7-52 (주문일자가 2019/05/22인 주문내역 삭제, 삭제 여부 확인)
DELETE FROM 주문
WHERE 주문일자 = '2019-05-22';

SELECT * FROM 주문; -- p10 내용 삭제됨

-- 예제 7-53 (정소화 고객 주문내역 삭제, 삭제 여부 확인)
DELETE FROM 주문
WHERE 주문고객 IN (SELECT 고객아이디 FROM 고객 WHERE 고객이름 = '정소화');

SELECT * FROM 주문; -- p01 내용 삭제됨

-- 예제 7-54 (주문 테이블 내역모두 삭제, 삭제 여부 확인)
DELETE FROM 주문; -- SELECT문과 달리 * 표시가 필요x

SELECT * FROM 주문;






