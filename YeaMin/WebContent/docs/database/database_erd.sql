
/* Drop Tables */

DROP TABLE YM_BOARD CASCADE CONSTRAINTS;
DROP TABLE YM_RESERVATION_PRODUCT CASCADE CONSTRAINTS;
DROP TABLE YM_PRODUCT CASCADE CONSTRAINTS;
DROP TABLE YM_PRODUCT_CATEGORY CASCADE CONSTRAINTS;
DROP TABLE YM_RESERVATION CASCADE CONSTRAINTS;
DROP TABLE YM_RESERVATION_CAPACITY CASCADE CONSTRAINTS;
DROP TABLE YM_REVIEW CASCADE CONSTRAINTS;
DROP TABLE YM_STORE CASCADE CONSTRAINTS;
DROP TABLE YM_STORE_IMG CASCADE CONSTRAINTS;
DROP TABLE YM_USER CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE YM_BOARD_NO_SEQ;
DROP SEQUENCE YM_PRODUCT_CATEGORY_NO_SEQ;
DROP SEQUENCE YM_PRODUCT_NO_SEQ;
DROP SEQUENCE YM_RESERVATION_CAPACITY_NO_SEQ;
DROP SEQUENCE YM_RESERVATION_NO_SEQ;
DROP SEQUENCE YM_REVIEW_NO_SEQ;
DROP SEQUENCE YM_USER_NO_SEQ;




/* Create Sequences */

CREATE SEQUENCE YM_BOARD_NO_SEQ INCREMENT BY 1 MINVALUE 1 MAXVALUE 100000 START WITH 1;
CREATE SEQUENCE YM_PRODUCT_CATEGORY_NO_SEQ INCREMENT BY 1 MINVALUE 1 MAXVALUE 100000 START WITH 1;
CREATE SEQUENCE YM_PRODUCT_NO_SEQ INCREMENT BY 1 MINVALUE 1 MAXVALUE 100000 START WITH 1;
CREATE SEQUENCE YM_RESERVATION_CAPACITY_NO_SEQ INCREMENT BY 1 MINVALUE 1 MAXVALUE 100000 START WITH 1;
CREATE SEQUENCE YM_RESERVATION_NO_SEQ INCREMENT BY 1 MINVALUE 1 MAXVALUE 100000 START WITH 1;
CREATE SEQUENCE YM_REVIEW_NO_SEQ INCREMENT BY 1 MINVALUE 1 MAXVALUE 100000 START WITH 1;
CREATE SEQUENCE YM_USER_NO_SEQ INCREMENT BY 1 MINVALUE 1 MAXVALUE 100000 START WITH 1;



/* Create Tables */

CREATE TABLE YM_BOARD
(
	-- 게시글 번호
	BOARD_NO number NOT NULL,
	-- 게시글 제목
	BOARD_TITLE varchar2(40) NOT NULL,
	-- 게시글 내용
	BOARD_CONTENT varchar2(1000) NOT NULL,
	-- 게시글 조회 수
	BOARD_READ_CNT number NOT NULL,
	-- 게시글 등록 시간
	BOARD_REG_TIME date NOT NULL,
	-- 게시글 그룹
	BOARD_RE_REF number NOT NULL,
	-- 게시글 댓글 순서
	BOARD_RE_STEP number NOT NULL,
	-- 게시글 댓글 깊이
	BOARD_RE_LEVEL number NOT NULL,
	-- 사용자 번호
	USER_NO number NOT NULL,
	PRIMARY KEY (BOARD_NO)
);


CREATE TABLE YM_PRODUCT
(
	-- 상품 번호
	PRODUCT_NO number NOT NULL,
	-- 상품 이름
	PRODUCT_NAME varchar2(1000) NOT NULL UNIQUE,
	-- 상품 가격
	PRODUCT_PRICE number NOT NULL,
	-- 상품 설명
	PRODUCT_DESC varchar2(1000) NOT NULL,
	-- 상품 이미지 경로 ( 원본 )
	PRODUCT_IMG_ORIGIN_PATH varchar2(20) NOT NULL,
	-- 상품 이미지 경로 ( 시스템 )
	PRODUCT_IMG_SYSTEM_PATH varchar2(20) NOT NULL UNIQUE,
	-- 상품 정렬 순서
	PRODUCT_ORDER_BY number NOT NULL UNIQUE,
	-- 상품 카테고리 번호
	PRODUCT_CATEGORY_NO number NOT NULL,
	PRIMARY KEY (PRODUCT_NO)
);


CREATE TABLE YM_PRODUCT_CATEGORY
(
	-- 상품 카테고리 번호
	PRODUCT_CATEGORY_NO number NOT NULL,
	-- 상품 카테고리 이름
	PRODUCT_CATEGORY_NAME varchar2(20) NOT NULL UNIQUE,
	-- 상품 카테고리 정렬 순서
	PRODUCT_CATEGORY_ORDER_BY number NOT NULL UNIQUE,
	PRIMARY KEY (PRODUCT_CATEGORY_NO)
);


CREATE TABLE YM_RESERVATION
(
	-- 예약 번호
	RESERVATION_NO number NOT NULL,
	-- 예약 인원수
	RESERVATION_PEOPLE number NOT NULL,
	-- 전달 사항
	RESERVATION_COMMENT varchar2(100),
	-- 예약 시간
	RESERVATION_TIME date NOT NULL,
	-- 사용자 번호
	USER_NO number NOT NULL,
	PRIMARY KEY (RESERVATION_NO)
);


CREATE TABLE YM_RESERVATION_CAPACITY
(
	-- 예약 수용 번호
	RESERVATION_CAPACITY_NO number NOT NULL,
	-- 예약 수용 요일 ( D : Day / W : Weak )
	RESERVATION_CAPACITY_DW char(1) NOT NULL,
	-- 예약 수용 시간
	RESERVATION_CAPACITY_TIME varchar2(10) NOT NULL,
	-- 예약 수용 인원 수
	RESERVATION_CAPACITY_PEOPLE number NOT NULL,
	PRIMARY KEY (RESERVATION_CAPACITY_NO),
	UNIQUE (RESERVATION_CAPACITY_DW, RESERVATION_CAPACITY_TIME)
);


CREATE TABLE YM_RESERVATION_PRODUCT
(
	-- 예약 번호
	RESERVATION_NO number NOT NULL,
	-- 상품 번호
	PRODUCT_NO number NOT NULL,
	-- 제품 개수
	PRODUCT_CNT number NOT NULL
);


CREATE TABLE YM_REVIEW
(
	-- 리뷰 번호
	REVIEW_NO number NOT NULL,
	-- 리뷰 내용
	REVIEW_CONTENT varchar2(1000) NOT NULL,
	-- 리뷰 등록 시간
	REVIEW_REG_TIME date DEFAULT SYSDATE NOT NULL,
	-- 리뷰 그룹
	REVIEW_RE_REF number NOT NULL,
	-- 리뷰 댓글 순서
	REVIEW_RE_STEP number NOT NULL,
	-- 리뷰 댓글 깊이
	REVIEW_RE_LEVEL number NOT NULL,
	-- 사용자 번호
	USER_NO number NOT NULL,
	PRIMARY KEY (REVIEW_NO)
);


CREATE TABLE YM_STORE
(
	-- 가게 이름
	STORE_NAME varchar2(50) NOT NULL UNIQUE,
	-- 가게 전화 번호
	STORE_TEL varchar2(13) NOT NULL,
	-- 가게 주소
	STORE_ADDR varchar2(100) NOT NULL,
	-- 가게 설명
	STORE_DESC varchar2(4000) NOT NULL,
	-- 가게 주중 영업 시간
	STORE_WEEK_BUSINESS_TIME varchar2(100) NOT NULL,
	-- 가게 주말 영업 시간
	STORE_WEEKEND_BUSINESS_TIME varchar2(100) NOT NULL
);


CREATE TABLE YM_STORE_IMG
(
	-- 가게 이미지 경로 ( 시스템 )
	STORE_IMG_SYSTEM_PATH varchar2(20) NOT NULL,
	-- 가게 이미지 경로 ( 원본 )
	STORE_IMG_ORIGIN_PATH varchar2(20) NOT NULL,
	PRIMARY KEY (STORE_IMG_SYSTEM_PATH)
);


CREATE TABLE YM_USER
(
	-- 사용자 번호
	USER_NO number NOT NULL,
	-- 사용자 아이디
	USER_ID varchar2(20) NOT NULL UNIQUE,
	-- 사용자 비밀번호
	USER_PW varchar2(20) NOT NULL,
	-- 사용자 이름
	USER_NAME varchar2(50) NOT NULL,
	-- 사용자 이메일
	USER_EMAIL varchar2(40) NOT NULL,
	-- 사용자 핸드폰 번호
	USER_HP varchar2(13) NOT NULL,
	-- 사용자 생년월일 ( YYYYMMDD )
	USER_BIRTH_DAY date NOT NULL,
	-- 사용자 성별 ( F : Female / M : Male )
	USER_GENDER char(1) NOT NULL,
	-- 관리자 여부( Y / N )
	IS_ADMIN char(1) DEFAULT 'N' NOT NULL,
	PRIMARY KEY (USER_NO)
);



/* Create Foreign Keys */

ALTER TABLE YM_RESERVATION_PRODUCT
	ADD FOREIGN KEY (PRODUCT_NO)
	REFERENCES YM_PRODUCT (PRODUCT_NO)
;


ALTER TABLE YM_PRODUCT
	ADD FOREIGN KEY (PRODUCT_CATEGORY_NO)
	REFERENCES YM_PRODUCT_CATEGORY (PRODUCT_CATEGORY_NO)
;


ALTER TABLE YM_RESERVATION_PRODUCT
	ADD FOREIGN KEY (RESERVATION_NO)
	REFERENCES YM_RESERVATION (RESERVATION_NO)
;


ALTER TABLE YM_BOARD
	ADD FOREIGN KEY (USER_NO)
	REFERENCES YM_USER (USER_NO)
;


ALTER TABLE YM_RESERVATION
	ADD FOREIGN KEY (USER_NO)
	REFERENCES YM_USER (USER_NO)
;


ALTER TABLE YM_REVIEW
	ADD FOREIGN KEY (USER_NO)
	REFERENCES YM_USER (USER_NO)
;



/* Comments */

COMMENT ON COLUMN YM_BOARD.BOARD_NO IS '게시글 번호';
COMMENT ON COLUMN YM_BOARD.BOARD_TITLE IS '게시글 제목';
COMMENT ON COLUMN YM_BOARD.BOARD_CONTENT IS '게시글 내용';
COMMENT ON COLUMN YM_BOARD.BOARD_READ_CNT IS '게시글 조회 수';
COMMENT ON COLUMN YM_BOARD.BOARD_REG_TIME IS '게시글 등록 시간';
COMMENT ON COLUMN YM_BOARD.BOARD_RE_REF IS '게시글 그룹';
COMMENT ON COLUMN YM_BOARD.BOARD_RE_STEP IS '게시글 댓글 순서';
COMMENT ON COLUMN YM_BOARD.BOARD_RE_LEVEL IS '게시글 댓글 깊이';
COMMENT ON COLUMN YM_BOARD.USER_NO IS '사용자 번호';
COMMENT ON COLUMN YM_PRODUCT.PRODUCT_NO IS '상품 번호';
COMMENT ON COLUMN YM_PRODUCT.PRODUCT_NAME IS '상품 이름';
COMMENT ON COLUMN YM_PRODUCT.PRODUCT_PRICE IS '상품 가격';
COMMENT ON COLUMN YM_PRODUCT.PRODUCT_DESC IS '상품 설명';
COMMENT ON COLUMN YM_PRODUCT.PRODUCT_IMG_ORIGIN_PATH IS '상품 이미지 경로 ( 원본 )';
COMMENT ON COLUMN YM_PRODUCT.PRODUCT_IMG_SYSTEM_PATH IS '상품 이미지 경로 ( 시스템 )';
COMMENT ON COLUMN YM_PRODUCT.PRODUCT_ORDER_BY IS '상품 정렬 순서';
COMMENT ON COLUMN YM_PRODUCT.PRODUCT_CATEGORY_NO IS '상품 카테고리 번호';
COMMENT ON COLUMN YM_PRODUCT_CATEGORY.PRODUCT_CATEGORY_NO IS '상품 카테고리 번호';
COMMENT ON COLUMN YM_PRODUCT_CATEGORY.PRODUCT_CATEGORY_NAME IS '상품 카테고리 이름';
COMMENT ON COLUMN YM_PRODUCT_CATEGORY.PRODUCT_CATEGORY_ORDER_BY IS '상품 카테고리 정렬 순서';
COMMENT ON COLUMN YM_RESERVATION.RESERVATION_NO IS '예약 번호';
COMMENT ON COLUMN YM_RESERVATION.RESERVATION_PEOPLE IS '예약 인원수';
COMMENT ON COLUMN YM_RESERVATION.RESERVATION_COMMENT IS '전달 사항';
COMMENT ON COLUMN YM_RESERVATION.RESERVATION_TIME IS '예약 시간';
COMMENT ON COLUMN YM_RESERVATION.USER_NO IS '사용자 번호';
COMMENT ON COLUMN YM_RESERVATION_CAPACITY.RESERVATION_CAPACITY_NO IS '예약 수용 번호';
COMMENT ON COLUMN YM_RESERVATION_CAPACITY.RESERVATION_CAPACITY_DW IS '예약 수용 요일 ( D : Day / W : Weak )';
COMMENT ON COLUMN YM_RESERVATION_CAPACITY.RESERVATION_CAPACITY_TIME IS '예약 수용 시간';
COMMENT ON COLUMN YM_RESERVATION_CAPACITY.RESERVATION_CAPACITY_PEOPLE IS '예약 수용 인원 수';
COMMENT ON COLUMN YM_RESERVATION_PRODUCT.RESERVATION_NO IS '예약 번호';
COMMENT ON COLUMN YM_RESERVATION_PRODUCT.PRODUCT_NO IS '상품 번호';
COMMENT ON COLUMN YM_RESERVATION_PRODUCT.PRODUCT_CNT IS '제품 개수';
COMMENT ON COLUMN YM_REVIEW.REVIEW_NO IS '리뷰 번호';
COMMENT ON COLUMN YM_REVIEW.REVIEW_CONTENT IS '리뷰 내용';
COMMENT ON COLUMN YM_REVIEW.REVIEW_REG_TIME IS '리뷰 등록 시간';
COMMENT ON COLUMN YM_REVIEW.REVIEW_RE_REF IS '리뷰 그룹';
COMMENT ON COLUMN YM_REVIEW.REVIEW_RE_STEP IS '리뷰 댓글 순서';
COMMENT ON COLUMN YM_REVIEW.REVIEW_RE_LEVEL IS '리뷰 댓글 깊이';
COMMENT ON COLUMN YM_REVIEW.USER_NO IS '사용자 번호';
COMMENT ON COLUMN YM_STORE.STORE_NAME IS '가게 이름';
COMMENT ON COLUMN YM_STORE.STORE_TEL IS '가게 전화 번호';
COMMENT ON COLUMN YM_STORE.STORE_ADDR IS '가게 주소';
COMMENT ON COLUMN YM_STORE.STORE_DESC IS '가게 설명';
COMMENT ON COLUMN YM_STORE.STORE_WEEK_BUSINESS_TIME IS '가게 주중 영업 시간';
COMMENT ON COLUMN YM_STORE.STORE_WEEKEND_BUSINESS_TIME IS '가게 주말 영업 시간';
COMMENT ON COLUMN YM_STORE_IMG.STORE_IMG_SYSTEM_PATH IS '가게 이미지 경로 ( 시스템 )';
COMMENT ON COLUMN YM_STORE_IMG.STORE_IMG_ORIGIN_PATH IS '가게 이미지 경로 ( 원본 )';
COMMENT ON COLUMN YM_USER.USER_NO IS '사용자 번호';
COMMENT ON COLUMN YM_USER.USER_ID IS '사용자 아이디';
COMMENT ON COLUMN YM_USER.USER_PW IS '사용자 비밀번호';
COMMENT ON COLUMN YM_USER.USER_NAME IS '사용자 이름';
COMMENT ON COLUMN YM_USER.USER_EMAIL IS '사용자 이메일';
COMMENT ON COLUMN YM_USER.USER_HP IS '사용자 핸드폰 번호';
COMMENT ON COLUMN YM_USER.USER_BIRTH_DAY IS '사용자 생년월일 ( YYYYMMDD )';
COMMENT ON COLUMN YM_USER.USER_GENDER IS '사용자 성별 ( F : Female / M : Male )';
COMMENT ON COLUMN YM_USER.IS_ADMIN IS '관리자 여부( Y / N )';



