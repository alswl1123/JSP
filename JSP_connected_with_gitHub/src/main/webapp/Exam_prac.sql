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




