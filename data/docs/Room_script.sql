use project_hotel;

select * from bed_type;

select * from room_category;

select * from room_size;

select * from view_type;

desc r_option;

select * from g_type;

select * from picture;

select * from room;

desc room;

insert into room values(1021, 350000, 1, 1, 1, 1); #1024호 350000원 스탠다드 산 더블 40m2

select * from room r join bed_type b on r.bt_no = b.bt_no;
select * from room r join view_type v on r.vt_no = v.vt_no;


            
select * from room r, bed_type b, view_type v, room_category rc, room_size rs
where r.bt_no = b.bt_no and r.vt_no = v.vt_no and r.rc_no = rc.rc_no and r.rs_no = rs.rs_no ;

select * from r_option;


update r_option set op_name="Daily Breakfast for Child" where op_no = 3;

delete from room where room_no=1024;

update room set room_price = 280001, rc_no = 3, vt_no = 3, bt_no = 3, rs_no = 3 where room_no = 302; 



select * from room r join bed_type b on r.bt_no = b.bt_no 
                join view_type v on r.vt_no = v.vt_no 
                join room_category rc on r.rc_no = rc.rc_no
                join room_size rs on r.rs_no = rs.rs_no
   where room_no = 302;

select * from room r join bed_type b on r.bt_no = b.bt_no 
                join view_type v on r.vt_no = v.vt_no 
                join room_category rc using(rc_no)
                join room_size rs on r.rs_no = rs.rs_no
            order by room_no;

/* --------- picture -----------*/

select * from g_type;

select * from picture;



select * from room r join picture p on r.rc_no = p.rc_no 
                join room_category rc on r.rc_no = rc.rc_no;
            
            
select * from g_type g join picture p on g.g_no = p.g_no;
            
            
            
select * from g_type g join picture p using(g_no);

insert into picture values("sample.jpg", 5, 3);



select * from picture p join room_category rc on p.rc_no = rc.rc_no
                  join g_type g on p.g_no = g.g_no
            order by pic_file;
               
            
delete from picture where pic_file="poster11.jpg";

select * from picture p join room_category rc on p.rc_no = rc.rc_no
                  join g_type g on p.g_no = g.g_no
               where pic_file="standard1.jpg";
            
update picture set g_no = 2, rc_no = 2 where pic_file="standard1.jpg";


/* roomCategory */

select * from room_category;

desc room_category;

select * from room_category where rc_no = 1;

alter table room_category add column rc_eng_name varchar(50) not null;



# 객실 사진만
select * from picture p join room_category rc on p.rc_no = rc.rc_no;

# 객실 사진중에 객실 타입만
select * from picture where rc_no=1;


select * from picture p join g_type g using(g_no) join room_category rc using(rc_no) where rc_no=7 and pic_file like '%content%' ;

select * from picture where rc_no=1 and pic_file like '%standard%';

select * from picture p join g_type g using(g_no) join room_category rc using(rc_no) where rc_no=1 and pic_file like '%standard%';

select * from picture where rc_no=1 and pic_file like 's_%standard%';


SELECT EMPNAME, TITLE, DNO
FROM EMPLOYEE
WHERE EMPNAME LIKE ‘이%’;














