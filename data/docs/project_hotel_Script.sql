/* PROJECT HOTEL SCRIPT FILE */

/*--------- ↓ 테이블 삭제하는거임 신경쓰지말기 ↓ ---------*/
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
DROP TABLE IF EXISTS project_hotel.option RESTRICT;

-- 갤러리 타입
DROP TABLE IF EXISTS project_hotel.g_type RESTRICT;

-- 사진
DROP TABLE IF EXISTS project_hotel.picture RESTRICT;
/*--------- ↑ 테이블 삭제하는거임 신경쓰지말기 ↑ ---------*/

/*------------- ↓ 여기서부터 생성 시작 ↓ -------------*/
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
	m_isAdmin  INT(1)       NULL     DEFAULT 1 COMMENT '관리자여부' -- 관리자여부 (관리자: 0, 일반회원: 1)
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
	rt_no        INT         NOT NULL COMMENT '객실 타입 번호', -- 객실 타입 번호
	rt_name      VARCHAR(20) NULL     COMMENT '상세이름', -- 상세이름
	rt_view_type VARCHAR(20) NULL     COMMENT '전망타입', -- 전망타입
	rt_bed_type  VARCHAR(20) NULL     COMMENT '침대타입', -- 침대타입
	rt_size      VARCHAR(20) NULL     COMMENT '객실크기' -- 객실크기
)
COMMENT '객실 타입';

-- 객실 타입
ALTER TABLE project_hotel.room_type
	ADD CONSTRAINT PK_room_type -- 객실 타입 기본키
		PRIMARY KEY (
			rt_no -- 객실 타입 번호
		);

ALTER TABLE project_hotel.room_type
	MODIFY COLUMN rt_no INT NOT NULL AUTO_INCREMENT COMMENT '객실 타입 번호';

-- 예약
CREATE TABLE project_hotel.reservation (
	r_no          INT      NOT NULL COMMENT '예약 번호', -- 예약 번호
	m_no          INT      NOT NULL COMMENT '회원 번호', -- 회원 번호
	room_no       INT(11)  NOT NULL COMMENT '호수', -- 호수
	r_in          DATE     NOT NULL COMMENT '체크인', -- 체크인
	r_out         DATE     NOT NULL COMMENT '체크아웃', -- 체크아웃
	r_total_price INT(11)  NOT NULL COMMENT '최종금액', -- 최종금액
	r_request     TEXT     NULL     COMMENT '요청사항', -- 요청사항
	r_personnel   INT(11)  NULL     COMMENT '투숙인원', -- 투숙인원
	r_pay_date    DATETIME NULL     COMMENT '결제날짜', -- 결제날짜
	op_no         INT      NOT NULL COMMENT '옵션 번호' -- 옵션 번호
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
	rt_no      INT     NOT NULL COMMENT '객실 타입 번호' -- 객실 타입 번호
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
	p_bank_name    VARCHAR(10) NULL     COMMENT '환불 은행명', -- 환불 은행명
	p_bank_no      VARCHAR(40) NULL     COMMENT '환불 계좌번호', -- 환불 계좌번호
	p_bank_sername VARCHAR(10) NULL     COMMENT '환불 예금주', -- 환불 예금주
	r_no           INT         NOT NULL COMMENT '예약 번호', -- 예약 번호
	m_no           INT         NULL     COMMENT '회원 번호' -- 회원 번호
)
COMMENT '결제정보';

-- 결제정보
ALTER TABLE project_hotel.pay_info
	ADD CONSTRAINT PK_pay_info -- 결제정보 기본키
		PRIMARY KEY (
			p_no -- 결제 번호
		);

-- 옵션
CREATE TABLE project_hotel.option (
	op_no    INT         NOT NULL COMMENT '옵션 번호', -- 옵션 번호
	op_name  VARCHAR(20) NULL     COMMENT '옵션명', -- 옵션명
	op_price INT(11)     NULL     COMMENT '옵션 가격' -- 옵션 가격
)
COMMENT '옵션';

-- 옵션
ALTER TABLE project_hotel.option
	ADD CONSTRAINT PK_option -- 옵션 기본키
		PRIMARY KEY (
			op_no -- 옵션 번호
		);

ALTER TABLE project_hotel.option
	MODIFY COLUMN op_no INT NOT NULL AUTO_INCREMENT COMMENT '옵션 번호';

-- 갤러리 타입
CREATE TABLE project_hotel.g_type (
	g_no   INT         NOT NULL COMMENT '분류번호', -- 분류번호
	g_name VARCHAR(10) NOT NULL COMMENT '분류명' -- 분류명
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
	pic_no   INT         NOT NULL COMMENT '파일번호', -- 파일번호
	pic_file VARCHAR(20) NOT NULL COMMENT '파일명', -- 파일명
	g_no     INT         NOT NULL COMMENT '분류번호', -- 분류번호
	rt_no    INT         NOT NULL COMMENT '객실 타입 번호' -- 객실 타입 번호
)
COMMENT '사진';

-- 사진
ALTER TABLE project_hotel.picture
	ADD CONSTRAINT PK_picture -- 사진 기본키
		PRIMARY KEY (
			pic_no -- 파일번호
		);

ALTER TABLE project_hotel.picture
	MODIFY COLUMN pic_no INT NOT NULL AUTO_INCREMENT COMMENT '파일번호';

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
	ADD CONSTRAINT FK_option_TO_reservation -- 옵션 -> 예약
		FOREIGN KEY (
			op_no -- 옵션 번호
		)
		REFERENCES project_hotel.option ( -- 옵션
			op_no -- 옵션 번호
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
	ADD CONSTRAINT FK_room_type_TO_room -- 객실 타입 -> 객실
		FOREIGN KEY (
			rt_no -- 객실 타입 번호
		)
		REFERENCES project_hotel.room_type ( -- 객실 타입
			rt_no -- 객실 타입 번호
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
	ADD CONSTRAINT FK_room_type_TO_picture -- 객실 타입 -> 사진
		FOREIGN KEY (
			rt_no -- 객실 타입 번호
		)
		REFERENCES project_hotel.room_type ( -- 객실 타입
			rt_no -- 객실 타입 번호
		);
/*------------- ↑ 여기까지 생성 영역이었음 ↑ -------------*/	

use project_hotel;

select * from reservation;
insert into reservation values (r_no, m_no, room_no, r_in, r_out, r_total_price, r_request, r_personnel, r_pay_date, op_no);
insert into reservation values (null, 1, 302, "2019-11-07", "2019-11-08", 1, 130000, null, 1, 0,  now(), 4, "예약완료");

-- reservation & room -> right join
select * from reservation rsv right join room rm on rsv.room_no = rm.room_no;

select * from reservation rsv right join room rm on rsv.room_no = rm.room_no
	where !((rsv.r_in >= "2019-11-09" and rsv.r_in <= "2019-11-10") or (rsv.r_out >= "2019-11-09" and rsv.r_out <= "2019-11-10"));

-- 아예 빈방
select * from reservation rsv right join room rm on rsv.room_no = rm.room_no
	where rsv.r_in is null and rsv.r_out is null;

select rm.room_no, rm.room_price, rm.rc_no, rm.vt_no, rm.bt_no, rm.rs_no
	from reservation rsv right join room rm on rsv.room_no = rm.room_no
	where rsv.r_no is not null;


select * from member;
select * from room_category;

select * from room;
insert into room values (105, 270000, 1, 1, 1, 1, 1);


select * from picture;
insert into picture values (1, "pic1.jpg", 1);

select * from r_option;

-- 예약번호로 예약정보 찾기
select * from reservation where r_no=3;

-- 방호수 별 예약상황
select * from reservation res join room rm using(room_no)

-- 예약상태 변경
update reservation set r_state="취소" where r_no=5;


select * from room_category;
select * from room_size;
select * from view_type;
select * from bed_type;


-- 룸 조인
select * from room r, bed_type b, view_type v, room_category rc, room_size rs
where r.bt_no = b.bt_no and r.vt_no = v.vt_no and r.rc_no = rc.rc_no and r.rs_no = rs.rs_no;

	
select distinct *
	from room r join bed_type b on r.bt_no = b.bt_no 
	                 join view_type v on r.vt_no = v.vt_no 
	                 join room_category rc on r.rc_no = rc.rc_no
	                 join room_size rs on r.rs_no = rs.rs_no
                 	 left join reservation rsv on r.room_no = rsv.room_no;


-- 룸 카테고리 & 뷰타입
select rc_name, bt_name, vt_name
	from room r, room_category rc , view_type vt, bed_type bt, room_size rs;


select rc_name, bt_name, vt_name
	from room r, room_category rc , view_type vt, bed_type bt, room_size rs;

select rc_name from room_category where rc_name="스탠다드";

select *
	from room r join bed_type b on r.bt_no = b.bt_no 
	                 join view_type v on r.vt_no = v.vt_no 
	                 join room_category rc on r.rc_no = rc.rc_no
	                 join room_size rs on r.rs_no = rs.rs_no
                 	 left join reservation rsv on r.room_no = rsv.room_no
	where rsv.r_in is null and rsv.r_out is null order by r.room_no;



select rc_name, bt_name, vt_name from 
where rc_name=?, bt_name=?, vt_name=?;



-- 방 조건으로 방 찾기 (room_no)
select *
	from room r join bed_type b on r.bt_no = b.bt_no 
	                 join view_type v on r.vt_no = v.vt_no 
	                 join room_category rc on r.rc_no = rc.rc_no
	                 join room_size rs on r.rs_no = rs.rs_no
where rc_name="스탠다드" and bt_name="더블" and vt_name="산";

select r.room_no, rc.rc_name, v.vt_name, b.bt_name, rs.rs_name, r.room_price
	from room r join bed_type b on r.bt_no = b.bt_no 
	                 join view_type v on r.vt_no = v.vt_no 
	                 join room_category rc on r.rc_no = rc.rc_no
	                 join room_size rs on r.rs_no = rs.rs_no
                 	 left join reservation rsv on r.room_no = rsv.room_no
	where rsv.r_in is null and rsv.r_out is null 
	and rc_name="스탠다드" and bt_name="더블" and vt_name="산" 
	order by r.room_no;

select count(r.room_no)
	from room r join bed_type b on r.bt_no = b.bt_no 
	                 join view_type v on r.vt_no = v.vt_no 
	                 join room_category rc on r.rc_no = rc.rc_no
	                 join room_size rs on r.rs_no = rs.rs_no
                 	 left join reservation rsv on r.room_no = rsv.room_no
	where rsv.r_in is null and rsv.r_out is null 
	and rc_name="스탠다드" and bt_name="더블" and vt_name="산" 
	order by r.room_no;

select r.room_no, rc.rc_name, v.vt_name, b.bt_name, rs.rs_name, r.room_price
	from room r join bed_type b on r.bt_no = b.bt_no 
	                 join view_type v on r.vt_no = v.vt_no 
	                 join room_category rc on r.rc_no = rc.rc_no
	                 join room_size rs on r.rs_no = rs.rs_no
                 	 left join reservation rsv on r.room_no = rsv.room_no
	where rsv.r_in is null and rsv.r_out is null
	order by r.room_no;

select r.room_no, rc.rc_name, v.vt_name, b.bt_name, rs.rs_name, r.room_price, rsv.r_in, rsv.r_out
	from room r join bed_type b on r.bt_no = b.bt_no 
	                 join view_type v on r.vt_no = v.vt_no 
	                 join room_category rc on r.rc_no = rc.rc_no
	                 join room_size rs on r.rs_no = rs.rs_no
                 	 left join reservation rsv on r.room_no = rsv.room_no
	where 
	order by r.room_no;



-- 예약날짜 사이에 있는 예약 걸러내기
select * from reservation rsv right join room rm on rsv.room_no = rm.room_no
	where !((rsv.r_in >= "2019-11-09" and rsv.r_in <= "2019-11-10") or (rsv.r_out >= "2019-11-09" and rsv.r_out <= "2019-11-10"));

select * from reservation rsv right join room rm on rsv.room_no = rm.room_no
	where !((rsv.r_in <= "2019-11-09" and rsv.r_in >= "2019-11-10") or (rsv.r_out <= "2019-11-09" and rsv.r_out >= "2019-11-10"));

-- 예약날짜 사이에 있는 예약 걸러내기
select * 
	from (select * from reservation rsv right join room rm using(room_no)
		where !((rsv.r_in >= "2019-11-09" and rsv.r_in <= "2019-11-10") 
			or (rsv.r_out >= "2019-11-09" and rsv.r_out <= "2019-11-10"))) as subRsv
	where !((subRsv.r_in <= "2019-11-09" and subRsv.r_out >= "2019-11-19") 
		or (subRsv.r_in <= "2019-11-10" and subRsv.r_out >= "2019-11-10"))
union
select *
	from room r join bed_type b on r.bt_no = b.bt_no 
	                 join view_type v on r.vt_no = v.vt_no 
	                 join room_category rc on r.rc_no = rc.rc_no
	                 join room_size rs on r.rs_no = rs.rs_no
                 	 left join reservation rsv on r.room_no = rsv.room_no
	where rsv.r_in is null and rsv.r_out is null order by r.room_no;



-- 실험실
select * 
	from (select *
			from room r join bed_type b on r.bt_no = b.bt_no 
	                 join view_type v on r.vt_no = v.vt_no 
	                 join room_category rc on r.rc_no = rc.rc_no
	                 join room_size rs on r.rs_no = rs.rs_no
                 	 left join reservation rsv on r.room_no = rsv.room_no
		where !((rsv.r_in >= "2019-11-09" and rsv.r_in <= "2019-11-10") 
			or (rsv.r_out >= "2019-11-09" and rsv.r_out <= "2019-11-10"))) as subRsv
	where !((subRsv.r_in <= "2019-11-09" and subRsv.r_out >= "2019-11-19") 
		or (subRsv.r_in <= "2019-11-10" and subRsv.r_out >= "2019-11-10"))
union
select *
	from room r join bed_type b on r.bt_no = b.bt_no 
	                 join view_type v on r.vt_no = v.vt_no 
	                 join room_category rc on r.rc_no = rc.rc_no
	                 join room_size rs on r.rs_no = rs.rs_no
                 	 left join reservation rsv on r.room_no = rsv.room_no
	where rsv.r_in is null and rsv.r_out is null;

select * from (
select * from (select *
			from room r join bed_type b using(bt_no)
	                 join view_type v using(vt_no)
	                 join room_category rc using(rc_no)
	                 join room_size rs using(rs_no)
                 	 left join reservation rsv using(room_no)
		where !((rsv.r_in >= "2019-10-28" and rsv.r_in <= "2019-10-29") 
			or (rsv.r_out >= "2019-10-28" and rsv.r_out <= "2019-10-29"))) as subRsv
	where !((subRsv.r_in <= "2019-10-28" and subRsv.r_out >= "2019-10-28") 
		or (subRsv.r_in <= "2019-10-29" and subRsv.r_out >= "2019-10-29"))
	
	-- in 28 out 29
union 
select *
	from room r join bed_type b using(bt_no)
                join view_type v using(vt_no)
                join room_category rc using(rc_no)
                join room_size rs using(rs_no)
             	left join reservation rsv using(room_no)
	where rsv.r_in is null and rsv.r_out is null) as emptyRoom
where rs_no=1;



select * from (select *
			from room r join bed_type b using(bt_no)
	                 join view_type v using(vt_no)
	                 join room_category rc using(rc_no)
	                 join room_size rs using(rs_no)
                 	 left join reservation rsv using(room_no)
		where !((rsv.r_in >= '2019-10-28' and rsv.r_in <= '2019-10-29') 
			or (rsv.r_out >= '2019-10-28' and rsv.r_out <= '2019-10-29'))) as subRsv
	where !((subRsv.r_in <= '2019-10-28' and subRsv.r_out >= '2019-10-28') 
		or (subRsv.r_in <= '2019-10-29' and subRsv.r_out >= '2019-10-29'))
union 
select *
	from room r join bed_type b using(bt_no)
                join view_type v using(vt_no)
                join room_category rc using(rc_no)
                join room_size rs using(rs_no)
             	left join reservation rsv using(room_no)
	where rsv.r_in is null and rsv.r_out is null;
				
insert into r_option values(null, "옵션없음", 0);
select * from r_option;




select * from reservation rsv join member m using(m_no) where m_no = 1;
select * from `member`;
select * from member where m_id = "mlmlml";

select * from pay_info;
insert into pay_info values(null, "훔친카드", "1234123412341234", "12", "2027", null, null, null, 1, 1);

select last_insert_id()
	from room r join bed_type b using(bt_no)
	            join view_type v using(vt_no)
	            join room_category rc using(rc_no)
	            join room_size rs using(rs_no)
                join reservation rsv using(room_no)
               	join member m using(m_no);
           
select *
	from room r join bed_type b using(bt_no)
	            join view_type v using(vt_no)
	            join room_category rc using(rc_no)
	            join room_size rs using(rs_no)
                join reservation rsv using(room_no)
               	join member m using(m_no)
                join pay_info pay using(r_no);
               
               
select * from pay_info;
select * from reservation;

update room r join bed_type b using(bt_no)
	            join view_type v using(vt_no)
	            join room_category rc using(rc_no)
	            join room_size rs using(rs_no)
                join reservation rsv using(room_no)
               	join member m using(m_no)
                join pay_info pay using(r_no)
	set rsv.room_no=301, rsv.r_in="2020-01-12", rsv.r_out="2020-01-13", rsv.r_stay=1, 
		rsv.r_total_price=333333, rsv.r_request=null, rsv.r_psnAdt=1, rsv.r_psnCdr=0, 
		rsv.r_pay_date=now(), rsv.op_no=4
	where rsv.r_no=2;

update room r join bed_type b using(bt_no)
	            join view_type v using(vt_no)
	            join room_category rc using(rc_no)
	            join room_size rs using(rs_no)
                join reservation rsv using(room_no)
               	join member m using(m_no)
                join pay_info pay using(r_no)
	set p_cardType="CHRISTMAS CARD", p_cardNum="2019122520191225", 
		p_validMonth="11", p_validYear="2029",
		p_bank_name=null, p_bank_no=null, p_bank_sername=null
	where r_no = 2;



create or replace view vw_available
as 

select * from (select *
			from room r join bed_type b using(bt_no)
	                 join view_type v using(vt_no)
	                 join room_category rc using(rc_no)
	                 join room_size rs using(rs_no)
                 	 left join reservation rsv using(room_no)
		where !((rsv.r_in >= '2019-10-28' and rsv.r_in <= '2019-10-29') 
			or (rsv.r_out >= '2019-10-28' and rsv.r_out <= '2019-10-29'))) as subRsv 
	where !((subRsv.r_in <= '2019-10-28' and subRsv.r_out >= '2019-10-28') 
		or (subRsv.r_in <= '2019-10-29' and subRsv.r_out >= '2019-10-29'))
union 
select *
	from room r join bed_type b using(bt_no)
                join view_type v using(vt_no)
                join room_category rc using(rc_no)
                join room_size rs using(rs_no)
             	left join reservation rsv using(room_no)
	where rsv.r_in is null and rsv.r_out is null;

select rc_name, vt_name, bt_name 
	from vw_available
	group by rc_name
	order by rc_no;

select * from reservation;

update room r 
join bed_type b using(bt_no) 
join view_type v using(vt_no) 
join room_category rc using(rc_no) 
join room_size rs using(rs_no) 
join reservation rsv using(room_no) 
join member m using(m_no) 
join pay_info pay using(r_no) 
set r_state='예약완료' 
where r_no = 1;


select distinct room_no, rc_name, vt_name, bt_name 
	from vw_available 
	where rc_name='프리미어' and vt_name='산' and bt_name='트윈';





