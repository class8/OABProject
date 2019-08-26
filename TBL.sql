--팀 예제
--1.회원 테이블 생성
CREATE TABLE MEMBER_TBL(
    MT_NUMBER NUMBER,
    MT_ID VARCHAR2(20) NOT NULL UNIQUE,
    MT_PW VARCHAR2(20) NOT NULL,
    MT_NAME VARCHAR2(10) NOT NULL,
    MT_BIRTH VARCHAR2(8) NOT NULL,
    MT_GENDER VARCHAR2(5) NOT NULL,
    MT_EMAIL VARCHAR2(50) NOT NULL UNIQUE,
    MT_PHONE VARCHAR2(11) NOT NULL UNIQUE,
    MT_REGDATE DATE DEFAULT SYSDATE NOT NULL,
    MT_DISABLED VARCHAR2(5),
    PRIMARY KEY(MT_NUMBER)
);

COMMENT ON TABLE MEMBER_TBL IS '회원정보';
COMMENT ON COLUMN MEMBER_TBL.MT_NUMBER IS '회원번호';
COMMENT ON COLUMN MEMBER_TBL.MT_ID IS '아이디';
COMMENT ON COLUMN MEMBER_TBL.MT_PW IS '비밀번호';
COMMENT ON COLUMN MEMBER_TBL.MT_NAME IS '이름';
COMMENT ON COLUMN MEMBER_TBL.MT_BIRTH IS '생년월일';
COMMENT ON COLUMN MEMBER_TBL.MT_GENDER IS '성별';
COMMENT ON COLUMN MEMBER_TBL.MT_EMAIL IS '이메일';
COMMENT ON COLUMN MEMBER_TBL.MT_PHONE IS '연락처';
COMMENT ON COLUMN MEMBER_TBL.MT_REGDATE IS '등록일';
COMMENT ON COLUMN MEMBER_TBL.MT_DISABLED IS '비활성화유무';

--1-1.회원번호 시퀀스 생성
CREATE SEQUENCE MEMBER_SEQ
increment by 1
start with 1;


--2.상품 테이블 생성
CREATE TABLE PRODUCT_TBL(
    PT_NUMBER NUMBER,
    PT_NAME VARCHAR2(20) NOT NULL,
    PT_PRICE NUMBER(10) NOT NULL,
    PT_EXPLAIN VARCHAR2(1000) NOT NULL,
    PT_REGDATE DATE DEFAULT SYSDATE NOT NULL,
    PT_STATUS VARCHAR2(5) NOT NULL,
    PT_THUMB VARCHAR2(50) NOT NULL,
    PT_IMAGE1 VARCHAR2(50),
    PT_IMAGE2 VARCHAR2(50),
    PT_IMAGE3 VARCHAR2(50),
    PRIMARY KEY(PT_NUMBER)
);

COMMENT ON TABLE PRODUCT_TBL IS '상품정보';
COMMENT ON COLUMN PT_NUMBER.PT_NUMBER IS '상품번호';
COMMENT ON COLUMN PT_NUMBER.PT_NAME IS '상품명';
COMMENT ON COLUMN PT_NUMBER.PT_PRICE IS '상품가격';
COMMENT ON COLUMN PT_NUMBER.PT_EXPLAIN IS '상품설명';
COMMENT ON COLUMN PT_NUMBER.PT_REGDATE IS '상품등록일';
COMMENT ON COLUMN PT_NUMBER.PT_STATUS IS '대여가능유무';
COMMENT ON COLUMN PT_NUMBER.PT_THUMB IS '상품썸네일';
COMMENT ON COLUMN PT_NUMBER.PT_IMAGE1 IS '상품이미지1';
COMMENT ON COLUMN PT_NUMBER.PT_IMAGE2 IS '상품이미지2';
COMMENT ON COLUMN PT_NUMBER.PT_IMAGE3 IS '상품이미지3';

--2-1.상품번호 시퀀스 생성
CREATE SEQUENCE PRODUCT_SEQ
increment by 1
start with 1;

--3.예약 테이블 생성
CREATE TABLE RESERVATION_TBL(
    REST_NUMBER NUMBER,
    MT_NUMBER NUMBER,
    PT_NUMBER NUMBER,
    REST_BNUMBER NUMBER NOT NULL,
    REST_BNAME VARCHAR2(10) NOT NULL,
    REST_NAME VARCHAR2(20) NOT NULL,
    REST_PHONE VARCHAR2(11) NOT NULL,
    REST_STATUS VARCHAR2(5) NOT NULL,
    REST_TOTAL NUMBER(10) NOT NULL,
    REST_EXPRENT DATE NOT NULL,
    REST_PAYOPTION VARCHAR2(10) NOT NULL,
    REST_REGDATE DATE DEFAULT SYSDATE NOT NULL,
    REST_COUNT NUMBER(5) NOT NULL,
    PRIMARY KEY(REST_NUMBER),
    foreign key(MT_NUMBER) references MEMBER_TBL(MT_NUMBER),
    foreign key(PT_NUMBER) references PRODUCT_TBL(PT_NUMBER)
);

COMMENT ON TABLE RESERVATION_TBL IS '예약정보';
COMMENT ON COLUMN RESERVATION_TBL.REST_NUMBER IS '예약번호';
COMMENT ON COLUMN RESERVATION_TBL.MT_NUMBER IS '회원번호';
COMMENT ON COLUMN RESERVATION_TBL.PT_NUMBER IS '상품번호';
COMMENT ON COLUMN RESERVATION_TBL.REST_BNUMBER IS '예약묶음번호';
COMMENT ON COLUMN RESERVATION_TBL.REST_BNAME IS '예약지점명';
COMMENT ON COLUMN RESERVATION_TBL.REST_NAME IS '예약자명';
COMMENT ON COLUMN RESERVATION_TBL.REST_PHONE IS '예약자연락처';
COMMENT ON COLUMN RESERVATION_TBL.REST_STATUS IS '예약상태';
COMMENT ON COLUMN RESERVATION_TBL.REST_TOTAL IS '이용금액';
COMMENT ON COLUMN RESERVATION_TBL.REST_EXPRENT IS '대여예상일시';
COMMENT ON COLUMN RESERVATION_TBL.REST_PAYOPTION IS '결제방법';
COMMENT ON COLUMN RESERVATION_TBL.REST_REGDATE IS '예약등록일';
COMMENT ON COLUMN RESERVATION_TBL.REST_COUNT IS '수량';

--3-1. 예약번호 시퀀스 생성
CREATE SEQUENCE RESERVATION_SEQ
increment by 1
start with 1;



