CREATE DATABASE IF NOT EXISTS flowerdb;
USE flowerdb;

/* 테이블 생성 */

-- 관리자 테이블
CREATE TABLE IF NOT EXISTS admintbl (
   a_pwd   VARCHAR(45)   NOT NULL,
   a_name   VARCHAR(5)   NOT NULL,
   a_id   VARCHAR(45)   NOT NULL PRIMARY KEY
);

insert into admintbl values ("1234", "관리자", "admin");
commit;

-- 등급 테이블
CREATE TABLE IF NOT EXISTS grade (
   g_name         VARCHAR(5)   NOT NULL,
   g_lowhistory   INT         NOT NULL,
   g_highhistory   INT         NOT NULL,
   g_code         VARCHAR(1)   NOT NULL PRIMARY KEY
);

-- DUMMY DATA
INSERT INTO grade(G_CODE, G_NAME, G_LOWHISTORY, G_HIGHHISTORY)
VALUES('A', '씨앗', 0, 2);
INSERT INTO grade(G_CODE, G_NAME, G_LOWHISTORY, G_HIGHHISTORY)
VALUES('B', '새싹', 3, 5);
INSERT INTO grade(G_CODE, G_NAME, G_LOWHISTORY, G_HIGHHISTORY)
VALUES('C', '꽃', 6, 9);
INSERT INTO grade(G_CODE, G_NAME, G_LOWHISTORY, G_HIGHHISTORY)
VALUES('D', '열매', 10, 100);
COMMIT;

select *  from grade;

-- 회원 테이블
CREATE TABLE IF NOT EXISTS membertbl (
   m_pwd      VARCHAR(200)   NOT NULL,
   m_name      VARCHAR(45)      NOT NULL,
   m_birth      DATE         NOT NULL,
   m_phone      VARCHAR(20)      NOT NULL,
   m_addr1      VARCHAR(45)      NOT NULL,
   m_addr2      VARCHAR(45)      NOT NULL,
   m_addr3      VARCHAR(45)      NOT NULL,
   m_email      VARCHAR(45)      NOT NULL,
   m_history   INT            NOT NULL DEFAULT 0,
   m_gcode      VARCHAR(1)      NULL,
   CONSTRAINT fk_m_gcode   FOREIGN KEY(m_gcode)
   REFERENCES grade(g_code),
   m_id      VARCHAR(45)      NOT NULL PRIMARY KEY
);

-- 라이더 테이블
CREATE TABLE IF NOT EXISTS rider (
   r_num      INT            NOT NULL AUTO_INCREMENT PRIMARY KEY,
   r_id      VARCHAR(45)      UNIQUE NOT NULL,
   r_pwd      VARCHAR(200)   NOT NULL,
   r_name      VARCHAR(20)      NOT NULL,
    r_birth      DATE         NOT NULL,
    r_phone      VARCHAR(20)      NOT NULL,
   r_addr1      VARCHAR(45)      NOT NULL,
   r_addr2      VARCHAR(45)      NOT NULL,
   r_addr3      VARCHAR(45)      NOT NULL,
   r_email      VARCHAR(45)      NOT NULL,
   r_insurance   VARCHAR(45)      NOT NULL,
   r_history   INT            NOT NULL default 0,
   r_gcode      VARCHAR(1)      NULL,
   CONSTRAINT fk_r_gcode   FOREIGN KEY(r_gcode)
   REFERENCES grade(g_code)
);

-- 주문 테이블
CREATE TABLE IF NOT EXISTS ordertbl (
   o_num   VARCHAR(45)   NOT NULL PRIMARY KEY, -- 주문번호, java문 통한 생성으로 인해 문자열 지정
   o_mid   VARCHAR(45)   NOT NULL, -- 주문자 아이디
   o_rnum   INT         NULL, -- 라이더 코드
   o_date   DATETIME   NOT NULL DEFAULT CURRENT_TIMESTAMP, -- 주문 일시
   o_rdate  VARCHAR(20) NOT NULL, -- 수령 일시
   o_rec   VARCHAR(10)   NULL, -- 수령인 이름
   o_phone   VARCHAR(20)   NULL, -- 수령인 전화번호
   o_addr1   VARCHAR(45)   NULL, -- 수령인 주소
   o_addr2   VARCHAR(45)   NULL,
   o_addr3   VARCHAR(45)   NULL,
   o_price   INT         NOT NULL, -- 주문 가격
   o_type   VARCHAR(10)   NOT NULL, -- 주문 유형
   o_pay   VARCHAR(10)   NOT NULL, -- 결제 방식
   o_status   VARCHAR(10)   NOT NULL, -- 주문 상태
   CONSTRAINT fk_o_mid      FOREIGN KEY(o_mid)
   REFERENCES membertbl(m_id),
   CONSTRAINT fk_o_rnum   FOREIGN KEY(o_rnum)
   REFERENCES rider(r_num)
);

-- 상품 테이블
CREATE TABLE IF NOT EXISTS product (
   p_code      VARCHAR(45)      NOT NULL PRIMARY KEY,
   p_name      VARCHAR(45)      NOT NULL,
   p_price      INT            NOT NULL,
   p_detail   VARCHAR(500)   NOT NULL
);

-- 상품파일 테이블(이미지)
CREATE TABLE IF NOT EXISTS productfile (
   pf_pcode   VARCHAR(45)   NOT NULL,
   pf_num      INT         UNIQUE   NOT NULL AUTO_INCREMENT,
   pf_oriname   VARCHAR(45)   NOT NULL,
   pf_sysname   VARCHAR(45)   NULL,
   CONSTRAINT fk_pf_pcode   FOREIGN KEY(pf_pcode)
   REFERENCES product(p_code)
);

-- 공지사항 테이블
CREATE TABLE IF NOT EXISTS notice (
   n_num      INT            NOT NULL AUTO_INCREMENT PRIMARY KEY,
   n_aid      VARCHAR(45)      NOT NULL default 'admin',
   n_title      VARCHAR(45)      NOT NULL,
   n_contents   VARCHAR(500)   NOT NULL,
   n_date      DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP,
   n_views      INT            NOT NULL DEFAULT 0,
    CONSTRAINT fk_n_aid   FOREIGN KEY(n_aid)
    REFERENCES admintbl(a_id)
);

-- 주문 상세 테이블
CREATE TABLE IF NOT EXISTS orderdetail (
   od_num      INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
   od_onum      VARCHAR(45)   NOT NULL, 
   od_mid      VARCHAR(45)   NOT NULL,
   od_pcode   VARCHAR(45)   NULL,
   od_count   INT         NULL,
   od_pname   VARCHAR(45)   NULL,
   od_price   INT         NULL,
    CONSTRAINT fk_od_onum   FOREIGN KEY(od_onum)
    REFERENCES ordertbl(o_num),
    CONSTRAINT fk_od_mid   FOREIGN KEY(od_mid)
    REFERENCES membertbl(m_id),
    CONSTRAINT fk_od_pcode   FOREIGN KEY(od_pcode)
    REFERENCES product(p_code)
);

-- 장바구니 테이블
CREATE TABLE IF NOT EXISTS cart (
   c_num      INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
   c_mid      VARCHAR(45)   NOT NULL,
   c_pcode      VARCHAR(45)   NOT NULL,
   c_count      INT         NOT NULL,
   c_pname      VARCHAR(45)   NOT NULL,
   c_pprice   INT         NOT NULL,
   CONSTRAINT fk_c_pcode   FOREIGN KEY(c_pcode)
   REFERENCES product(p_code),
   CONSTRAINT fk_c_mid      FOREIGN KEY(c_mid)
   REFERENCES membertbl(m_id)
);

-- 리뷰 테이블
CREATE TABLE IF NOT EXISTS review (
   re_num      INT            NOT NULL AUTO_INCREMENT PRIMARY KEY,
   re_pcode   VARCHAR(45)      NOT NULL,
   re_score   FLOAT         NOT NULL,
   re_contents   VARCHAR(200)   NOT NULL,
   re_date      DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP,
   re_mid      VARCHAR(45)      NOT NULL,
   CONSTRAINT fk_re_pcode   FOREIGN KEY(re_pcode)
   REFERENCES product(p_code),
   CONSTRAINT fk_re_mid   FOREIGN KEY(re_mid)
   REFERENCES membertbl(m_id)
);

-- 방문자 수 카운트 테이블
CREATE TABLE IF NOT EXISTS visit (
   v_date   DATE
);

-- 라이더 주문 테이블
CREATE TABLE IF NOT EXISTS rider_order (
   ro_onum      VARCHAR(45)   NOT NULL PRIMARY KEY,
   ro_rid      VARCHAR(45)   NOT NULL,
   ro_date      DATETIME   NOT NULL DEFAULT CURRENT_TIMESTAMP,
   CONSTRAINT fk_ro_rid   FOREIGN KEY(ro_rid)
   REFERENCES rider(r_id),
   CONSTRAINT fk_ro_onum   FOREIGN KEY(ro_onum)
   REFERENCES ordertbl(o_num)
);

/* 뷰 생성 */
CREATE OR REPLACE VIEW rlist AS
SELECT o.o_num, o.o_addr1, o.o_addr2, o.o_addr3
FROM ORDERTBL o;

CREATE OR REPLACE VIEW plist AS
SELECT p_code, p_name, p_price, p_detail, pf_oriname, pf_sysname
FROM product p 
LEFT OUTER JOIN productfile pf
ON p.p_code = pf.pf_pcode;

CREATE OR REPLACE VIEW olist AS
SELECT o_num, o_date, o_rdate, o_pay, o_price, o_status, o_mid, o_rec, o_phone, o_type, o_addr1, o_addr2, o_addr3,
      o_rnum, r_id, r_name, r_phone, r_insurance, r_addr1, r_addr2, r_addr3
FROM ordertbl o
LEFT OUTER JOIN rider r
ON o.o_rnum = r.r_num;

CREATE OR REPLACE VIEW odlist AS
SELECT od_onum, od_pcode, od_pname, od_count, od_price, p_price, pf_oriname, pf_sysname
FROM orderdetail od
LEFT OUTER JOIN plist p
ON od.od_pcode = p.p_code;

CREATE OR REPLACE VIEW clist AS
SELECT c_num, c_mid, c_pcode, c_count, c_pname, p.p_price, c_pprice, pf_oriname, pf_sysname
FROM cart c
LEFT OUTER JOIN plist p
ON c.c_pcode = p.p_code;

CREATE OR REPLACE VIEW relist AS
SELECT re_num, re_pcode, re_score, re_contents, re_date, re_mid
FROM review
ORDER BY re_date DESC;
    
CREATE VIEW vview AS
SELECT count(*)
FROM visit;

CREATE OR REPLACE VIEW mlist AS
SELECT m.m_id, m.m_name, m.m_history, g.g_name
FROM membertbl m INNER JOIN grade g
ON m.m_history    BETWEEN g.g_lowhistory   AND g.g_highhistory;

CREATE OR REPLACE VIEW rmlist AS
SELECT rm.r_id, rm.r_name, rm.r_history, g.g_name
FROM rider rm   INNER JOIN grade g
ON rm.r_history   BETWEEN g.g_lowhistory   AND g.g_highhistory;

CREATE OR REPLACE VIEW nlist AS
SELECT n.n_num, n.n_title, n.n_contents, n.n_aid, n.n_date, n.n_views
FROM notice n
ORDER BY n.n_date DESC;
    
CREATE OR REPLACE VIEW minfo AS
SELECT m.m_id, m.m_name, m.m_birth, m.m_phone, m.m_addr1, m.m_addr2, m.m_addr3, m.m_email, g.g_name
FROM membertbl m INNER JOIN grade g
ON m.m_history   BETWEEN g.g_lowhistory AND g.g_highhistory;

CREATE OR REPLACE VIEW rinfo AS
SELECT r.r_id, r.r_name, r.r_birth, r.r_phone, r.r_insurance, r.r_addr1, r.r_addr2, r.r_addr3, r.r_email, g.g_name
FROM rider r INNER JOIN grade g
ON r.r_history   BETWEEN g.g_lowhistory AND g.g_highhistory;
    
CREATE OR REPLACE VIEW rolist AS
SELECT a.o_num,  a.o_mid, a.o_rnum, a.o_date, a.o_rec, a.o_phone,  a.o_addr1, a.o_addr2, a.o_addr3,
      a.o_price, a.o_type, a.o_status, b.ro_rid, b.ro_date, c.od_pcode, c.od_count, c.od_pname
FROM ordertbl AS a
   LEFT OUTER JOIN rider_order AS b
   ON a.o_num = b.ro_onum
   LEFT OUTER JOIN orderdetail AS c
   ON a.o_num = c.od_onum;
    
CREATE OR REPLACE VIEW rlist AS
SELECT o.o_num, o.o_addr1, o.o_addr2, o.o_addr3
FROM ordertbl o
ORDER BY o.o_num DESC;

CREATE OR REPLACE VIEW RDOLIST AS
SELECT a.o_num, a.o_mid, a.o_rnum, a.o_date, a.o_rec, a.o_phone, a.o_addr1, a.o_addr2, a.o_addr3,
   a.o_price, a.o_type, a.o_status, b.ro_rid, b.ro_date
FROM ordertbl AS a
LEFT OUTER JOIN rider_order AS b
ON a.o_num = b.ro_onum;

commit;