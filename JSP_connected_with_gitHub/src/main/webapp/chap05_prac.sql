-- 외래 키는 테이블을 만들 때 제일 마지막에 FOREIGN KEY 예약어로 지정
USE market_db;
DROP TABLE IF EXISTS buy; -- 기존에 있으면 삭제
CREATE TABLE buy
(
	num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    mem_id CHAR(8) NOT NULL,
    prod_name CHAR(6) NOT NULL,
    group_name CHAR(4) NULL,
    price INT UNSIGNED NOT NULL,
    amount SMALLINT UNSIGNED NOT NULL, -- 음수 시렁
    FOREIGN KEY(mem_id) REFERENCES member(mem_id)
);

-- 테이블을 삭제할 때는 PK 테이블, FK 테이블 중 FK 테이블 먼저 DROP 해야 함

-- -----------------------------------------------------

-- 기본 키에 이름 지정하기
DROP TABLE IF EXISTS member;
CREATE TABLE member
(
	mem_id CHAR(8) NOT NULL,
    mem_name VARCHAR(10) NOT NULL,
    height TINYINT UNSIGNED NULL,
    CONSTRAINT PRIMARY KEY PK_member_mem_id (mem_id)
);

-- -----------------------------------------------------
-- ON UPDATE CASCADE = PK, FK 같이 수정
-- ON DELETE CASCADE = PK, FK 같이 삭제
DROP TABLE IF EXISTS buy;
CREATE TABLE buy
(
	num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    mem_id CHAR(8) NOT NULL,
    prod_name CHAR(6) NOT NULL
);

ALTER TABLE buy
	ADD CONSTRAINT
	FOREIGN KEY(mem_id) REFERENCES member(mem_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE; -- FK 에 할당

    


