-- 회원정보
DROP TABLE IF EXISTS project_hotel.member RESTRICT;

-- 객실 타입
DROP TABLE IF EXISTS project_hotel.room_type RESTRICT;

-- 예약
DROP TABLE IF EXISTS project_hotel.reservation RESTRICT;

-- 객실
DROP TABLE IF EXISTS project_hotel.room RESTRICT;

-- 결제정보
DROP TABLE IF EXISTS project_hotel.pay_info RESTRICT;

-- 옵션
DROP TABLE IF EXISTS project_hotel.r_option RESTRICT;

-- 갤러리 타입
DROP TABLE IF EXISTS project_hotel.g_type RESTRICT;

-- 사진
DROP TABLE IF EXISTS project_hotel.picture RESTRICT;

-- 객실 분류 타입
DROP TABLE IF EXISTS project_hotel.room_category RESTRICT;

-- 전망타입
DROP TABLE IF EXISTS project_hotel.view_type RESTRICT;

-- 침대타입
DROP TABLE IF EXISTS project_hotel.bed_type RESTRICT;

-- 객실크기
DROP TABLE IF EXISTS project_hotel.room_size RESTRICT;

-- project_hotel
DROP SCHEMA IF EXISTS project_hotel;

-- project_hotel
CREATE SCHEMA project_hotel;

-- 회원정보
CREATE TABLE project_hotel.member (
	m_no       INT          NOT NULL COMMENT '회원 번호', -- 회원 번호
	m_name     VARCHAR(20)  NOT NULL COMMENT '성명', -- 성명
	m_birth    DATE         NOT NULL COMMENT '생년월일', -- 생년월일
	m_mail     VARCHAR(50)  NOT NULL COMMENT '이메일', -- 이메일
	m_phone    VARCHAR(20)  NOT NULL COMMENT '휴대전화', -- 휴대전화
	m_tel      VARCHAR(20)  NULL     COMMENT '자택전화', -- 자택전화
	m_zipcode  VARCHAR(6)   NULL     COMMENT '우편번호', -- 우편번호
	m_addr1    VARCHAR(100) NULL     COMMENT '주소', -- 주소
	m_addr2    VARCHAR(100) NULL     COMMENT '상세주소', -- 상세주소
	m_id       VARCHAR(20)  NOT NULL COMMENT '아이디', -- 아이디
	m_pwd      VARCHAR(20)  NOT NULL COMMENT '비밀번호', -- 비밀번호
	m_regdate  DATE         NOT NULL COMMENT '가입일', -- 가입일
	m_quitdate DATE         NULL     COMMENT '탈퇴일', -- 탈퇴일
	m_isAdmin  INT(1)       NULL     DEFAULT 0 COMMENT '관리자여부' -- 관리자여부
)
COMMENT '회원정보';

-- 회원정보
ALTER TABLE project_hotel.member
	ADD CONSTRAINT PK_member -- 회원정보 기본키
		PRIMARY KEY (
			m_no -- 회원 번호
		);

ALTER TABLE project_hotel.member
	MODIFY COLUMN m_no INT NOT NULL AUTO_INCREMENT COMMENT '회원 번호';

-- 객실 타입
CREATE TABLE project_hotel.room_type (
)
COMMENT '객실 타입';

-- 예약
CREATE TABLE project_hotel.reservation (
	r_no          INT      NOT NULL COMMENT '예약 번호', -- 예약 번호
	m_no          INT      NOT NULL COMMENT '회원 번호', -- 회원 번호
	room_no       INT(11)  NOT NULL COMMENT '호수', -- 호수
	r_in          DATE     NOT NULL COMMENT '체크인', -- 체크인
	r_out         DATE     NOT NULL COMMENT '체크아웃', -- 체크아웃
	r_stay        INT      NOT NULL COMMENT '숙박일수', -- 숙박일수
	r_total_price INT(11)  NOT NULL COMMENT '최종금액', -- 최종금액
	r_request     TEXT     NULL     COMMENT '요청사항', -- 요청사항
	r_psnAdt      INT(1)   NOT NULL DEFAULT 1 COMMENT '투숙인원(성인)', -- 투숙인원(성인)
	r_psnCdr      INT(1)   NULL     DEFAULT 0 COMMENT '투숙인원(어린이)', -- 투숙인원(어린이)
	r_pay_date    DATETIME NULL     COMMENT '결제날짜', -- 결제날짜
	op_no         INT      NULL     COMMENT '옵션 번호' -- 옵션 번호
)
COMMENT '예약';

-- 예약
ALTER TABLE project_hotel.reservation
	ADD CONSTRAINT PK_reservation -- 예약 기본키
		PRIMARY KEY (
			r_no -- 예약 번호
		);

ALTER TABLE project_hotel.reservation
	MODIFY COLUMN r_no INT NOT NULL AUTO_INCREMENT COMMENT '예약 번호';

-- 객실
CREATE TABLE project_hotel.room (
	room_no    INT(11) NOT NULL COMMENT '호수', -- 호수
	room_price INT(11) NULL     COMMENT '가격', -- 가격
	rc_no      INT     NOT NULL COMMENT '객실 분류 번호', -- 객실 분류 번호
	vt_no      INT     NOT NULL COMMENT '전망 타입 번호', -- 전망 타입 번호
	bt_no      INT     NOT NULL COMMENT '침대 타입 번호', -- 침대 타입 번호
	rs_no      INT     NOT NULL COMMENT '객실 크기 번호' -- 객실 크기 번호
)
COMMENT '객실';

-- 객실
ALTER TABLE project_hotel.room
	ADD CONSTRAINT PK_room -- 객실 기본키
		PRIMARY KEY (
			room_no -- 호수
		);

-- 결제정보
CREATE TABLE project_hotel.pay_info (
	p_no           INT         NOT NULL COMMENT '결제 번호', -- 결제 번호
	p_cardType     VARCHAR(40) NOT NULL COMMENT '카드종류', -- 카드종류
	p_cardNum      VARCHAR(40) NOT NULL COMMENT '카드번호', -- 카드번호
	p_validMonth   VARCHAR(2)  NOT NULL COMMENT '유효기간(달)', -- 유효기간(달)
	p_validYear    VARCHAR(4)  NOT NULL COMMENT '유효기간(년)', -- 유효기간(년)
	p_bank_name    VARCHAR(10) NULL     COMMENT '환불 은행명', -- 환불 은행명
	p_bank_no      VARCHAR(40) NULL     COMMENT '환불 계좌번호', -- 환불 계좌번호
	p_bank_sername VARCHAR(10) NULL     COMMENT '환불 예금주', -- 환불 예금주
	r_no           INT         NOT NULL COMMENT '예약 번호', -- 예약 번호
	m_no           INT         NOT NULL COMMENT '회원 번호' -- 회원 번호
)
COMMENT '결제정보';

-- 결제정보
ALTER TABLE project_hotel.pay_info
	ADD CONSTRAINT PK_pay_info -- 결제정보 기본키
		PRIMARY KEY (
			p_no -- 결제 번호
		);

ALTER TABLE project_hotel.pay_info
	MODIFY COLUMN p_no INT NOT NULL AUTO_INCREMENT COMMENT '결제 번호';

-- 옵션
CREATE TABLE project_hotel.r_option (
	op_no    INT         NOT NULL COMMENT '옵션 번호', -- 옵션 번호
	op_name  VARCHAR(40) NULL     COMMENT '옵션명', -- 옵션명
	op_price INT(11)     NULL     COMMENT '옵션 가격' -- 옵션 가격
)
COMMENT '옵션';

-- 옵션
ALTER TABLE project_hotel.r_option
	ADD CONSTRAINT PK_r_option -- 옵션 기본키
		PRIMARY KEY (
			op_no -- 옵션 번호
		);

ALTER TABLE project_hotel.r_option
	MODIFY COLUMN op_no INT NOT NULL AUTO_INCREMENT COMMENT '옵션 번호';

-- 갤러리 타입
CREATE TABLE project_hotel.g_type (
	g_no   INT          NOT NULL COMMENT '분류번호', -- 분류번호
	g_name VARCHAR(10)  NOT NULL COMMENT '분류명', -- 분류명
	g_path VARCHAR(255) NOT NULL COMMENT '경로' -- 경로
)
COMMENT '갤러리 타입';

-- 갤러리 타입
ALTER TABLE project_hotel.g_type
	ADD CONSTRAINT PK_g_type -- 갤러리 타입 기본키
		PRIMARY KEY (
			g_no -- 분류번호
		);

ALTER TABLE project_hotel.g_type
	MODIFY COLUMN g_no INT NOT NULL AUTO_INCREMENT COMMENT '분류번호';

-- 사진
CREATE TABLE project_hotel.picture (
	pic_file VARCHAR(50) NOT NULL COMMENT '파일명', -- 파일명
	g_no     INT         NOT NULL COMMENT '분류번호', -- 분류번호
	rc_no    INT         NULL     COMMENT '객실 분류 번호' -- 객실 분류 번호
)
COMMENT '사진';

-- 사진
ALTER TABLE project_hotel.picture
	ADD CONSTRAINT PK_picture -- 사진 기본키
		PRIMARY KEY (
			pic_file -- 파일명
		);

-- 객실 분류 타입
CREATE TABLE project_hotel.room_category (
	rc_no       INT         NOT NULL COMMENT '객실 분류 번호', -- 객실 분류 번호
	rc_name     VARCHAR(20) NOT NULL COMMENT '객실 분류명(한글)', -- 객실 분류명(한글)
	rc_eng_name VARCHAR(50) NOT NULL COMMENT '객실 분류명(영어)' -- 객실 분류명(영어)
)
COMMENT '객실 분류 타입';

-- 객실 분류 타입
ALTER TABLE project_hotel.room_category
	ADD CONSTRAINT PK_room_category -- 객실 분류 타입 기본키
		PRIMARY KEY (
			rc_no -- 객실 분류 번호
		);

ALTER TABLE project_hotel.room_category
	MODIFY COLUMN rc_no INT NOT NULL AUTO_INCREMENT COMMENT '객실 분류 번호';

-- 전망타입
CREATE TABLE project_hotel.view_type (
	vt_no   INT         NOT NULL COMMENT '전망 타입 번호', -- 전망 타입 번호
	vt_name VARCHAR(10) NOT NULL COMMENT '전망 타입명' -- 전망 타입명
)
COMMENT '전망타입';

-- 전망타입
ALTER TABLE project_hotel.view_type
	ADD CONSTRAINT PK_view_type -- 전망타입 기본키
		PRIMARY KEY (
			vt_no -- 전망 타입 번호
		);

ALTER TABLE project_hotel.view_type
	MODIFY COLUMN vt_no INT NOT NULL AUTO_INCREMENT COMMENT '전망 타입 번호';

-- 침대타입
CREATE TABLE project_hotel.bed_type (
	bt_no   INT         NOT NULL COMMENT '침대 타입 번호', -- 침대 타입 번호
	bt_name VARCHAR(10) NOT NULL COMMENT '침대 타입명' -- 침대 타입명
)
COMMENT '침대타입';

-- 침대타입
ALTER TABLE project_hotel.bed_type
	ADD CONSTRAINT PK_bed_type -- 침대타입 기본키
		PRIMARY KEY (
			bt_no -- 침대 타입 번호
		);

ALTER TABLE project_hotel.bed_type
	MODIFY COLUMN bt_no INT NOT NULL AUTO_INCREMENT COMMENT '침대 타입 번호';

-- 객실크기
CREATE TABLE project_hotel.room_size (
	rs_no   INT     NOT NULL COMMENT '객실 크기 번호', -- 객실 크기 번호
	rs_name INT(11) NOT NULL COMMENT '객실 크기명' -- 객실 크기명
)
COMMENT '객실크기';

-- 객실크기
ALTER TABLE project_hotel.room_size
	ADD CONSTRAINT PK_room_size -- 객실크기 기본키
		PRIMARY KEY (
			rs_no -- 객실 크기 번호
		);

ALTER TABLE project_hotel.room_size
	MODIFY COLUMN rs_no INT NOT NULL AUTO_INCREMENT COMMENT '객실 크기 번호';

-- 예약
ALTER TABLE project_hotel.reservation
	ADD CONSTRAINT FK_room_TO_reservation -- 객실 -> 예약
		FOREIGN KEY (
			room_no -- 호수
		)
		REFERENCES project_hotel.room ( -- 객실
			room_no -- 호수
		);

-- 예약
ALTER TABLE project_hotel.reservation
	ADD CONSTRAINT FK_member_TO_reservation -- 회원정보 -> 예약
		FOREIGN KEY (
			m_no -- 회원 번호
		)
		REFERENCES project_hotel.member ( -- 회원정보
			m_no -- 회원 번호
		);

-- 객실
ALTER TABLE project_hotel.room
	ADD CONSTRAINT FK_room_category_TO_room -- 객실 분류 타입 -> 객실
		FOREIGN KEY (
			rc_no -- 객실 분류 번호
		)
		REFERENCES project_hotel.room_category ( -- 객실 분류 타입
			rc_no -- 객실 분류 번호
		);

-- 객실
ALTER TABLE project_hotel.room
	ADD CONSTRAINT FK_view_type_TO_room -- 전망타입 -> 객실
		FOREIGN KEY (
			vt_no -- 전망 타입 번호
		)
		REFERENCES project_hotel.view_type ( -- 전망타입
			vt_no -- 전망 타입 번호
		);

-- 객실
ALTER TABLE project_hotel.room
	ADD CONSTRAINT FK_bed_type_TO_room -- 침대타입 -> 객실
		FOREIGN KEY (
			bt_no -- 침대 타입 번호
		)
		REFERENCES project_hotel.bed_type ( -- 침대타입
			bt_no -- 침대 타입 번호
		);

-- 객실
ALTER TABLE project_hotel.room
	ADD CONSTRAINT FK_room_size_TO_room -- 객실크기 -> 객실
		FOREIGN KEY (
			rs_no -- 객실 크기 번호
		)
		REFERENCES project_hotel.room_size ( -- 객실크기
			rs_no -- 객실 크기 번호
		);

-- 결제정보
ALTER TABLE project_hotel.pay_info
	ADD CONSTRAINT FK_reservation_TO_pay_info -- 예약 -> 결제정보
		FOREIGN KEY (
			r_no -- 예약 번호
		)
		REFERENCES project_hotel.reservation ( -- 예약
			r_no -- 예약 번호
		);

-- 결제정보
ALTER TABLE project_hotel.pay_info
	ADD CONSTRAINT FK_member_TO_pay_info -- 회원정보 -> 결제정보
		FOREIGN KEY (
			m_no -- 회원 번호
		)
		REFERENCES project_hotel.member ( -- 회원정보
			m_no -- 회원 번호
		);

-- 사진
ALTER TABLE project_hotel.picture
	ADD CONSTRAINT FK_g_type_TO_picture -- 갤러리 타입 -> 사진
		FOREIGN KEY (
			g_no -- 분류번호
		)
		REFERENCES project_hotel.g_type ( -- 갤러리 타입
			g_no -- 분류번호
		);

-- 사진
ALTER TABLE project_hotel.picture
	ADD CONSTRAINT FK_room_category_TO_picture -- 객실 분류 타입 -> 사진
		FOREIGN KEY (
			rc_no -- 객실 분류 번호
		)
		REFERENCES project_hotel.room_category ( -- 객실 분류 타입
			rc_no -- 객실 분류 번호
		);