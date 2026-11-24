show databases;

create database db_diary;

use db_diary;

create table tbl_member(
   memNo   int   auto_increment comment '회원번호',
   memId   varchar(20)   unique not null comment '회원아이디',
   memPw   varchar(20)   not null comment '회원비밀번호',
   memMail   varchar(50)   comment '회원메일',
   memPhone   varchar(50)   comment '회원연락처',
   memRegDate   timestamp default current_timestamp comment '회원등록일',
   memModDate   timestamp default current_timestamp on update current_timestamp comment '회원수정일',
   primary key(memNo)
) auto_increment = 1001;

show tables;
desc tbl_member;
select * from tbl_member;

insert into tbl_member(memId, memPw, memMail, memPhone) 
values('gildong', '1234', 'gildong@gmail.com', '010-1234-5678');

insert into tbl_member(memId, memPw, memMail, memPhone) 
values('chanho', '0000', 'chanho@gmail.com', '010-1234-9999');

insert into tbl_member(memId, memPw, memMail, memPhone) 
values('seari', '1111', 'seari@gmail.com', '010-1234-7777');

insert into tbl_member(memId, memPw, memMail, memPhone) 
values('seari2', '1111', 'seari@gmail.com', '010-1234-7777');

set @@auto_increment_increment = 1;

drop table tbl_member;

select count(*) from tbl_member where memId = 'gildong';

delete from tbl_member;

SET GLOBAL auto_increment_increment = 1;

select 
	* 
from 
	tbl_member 
where 
	memId = 'gildong';

create table tbl_diary(
	diaryNo		 int  auto_increment,
	diaryWord	 varchar(100) not null,
	memId   	 varchar(20)   unique not null,
	diaryRegDate timestamp default current_timestamp comment '회원등록일',
	diaryModDate timestamp default current_timestamp on update current_timestamp comment '회원수정일',
	primary key(diaryNo)
) auto_increment = 10001;

alter table tbl_diary 
DROP INDEX memId;

show tables;
desc tbl_diary;
select * from tbl_diary;

-- table join
select * from tbl_diary td
join tbl_member tm
on td.memId = tm.memId
where memId = 'chanho';



-- 백신 접종 현황 시스템 DB -----------------------------
create database db_vaccin;
show datadases;
use db_vaccin;

-- 백신 타입 테이블 ----
create table tbl_fv_type(
fv_type_no				int auto_increment    	comment '백신번호',
fv_type					varchar(1) 	not null  	comment '백신 타입',
fv_type_manuf_country	varchar(20) not null	comment '백신 제조국',
fv_type_manuf_date		varchar(20) not null	comment '백신 제조일',
primary key(fv_type_no)

);
select * from tbl_fv_type;
desc tbl_fv_type;

insert into tbl_fv_type(fv_type, fv_type_manuf_country, fv_type_manuf_date);
values('A', '한국','2023-01-10');

insert into tbl_fv_type(fv_type, fv_type_manuf_country, fv_type_manuf_date);
values('B', '미국','2023-01-15');

insert into tbl_fv_type(fv_type, fv_type_manuf_country, fv_type_manuf_date);
values('C', '영국','2023-02-07');

insert into tbl_fv_type(fv_type, fv_type_manuf_country, fv_type_manuf_date);
values('D', '스웨덴','2023-01-17');

insert into tbl_fv_type(fv_type, fv_type_manuf_country, fv_type_manuf_date);
values('E', '덴마크','2022-12-22');


-- 접종처 테이블 ----------------
create table tbl_fv_location(
	fv_location_no 		int 		not null comment '접종처 번호',
	fv_location_name	varchar(20) not null comment '접종처 이름',
	fv_location_addr 	varchar(30) not null comment '접종처 주소',
	fv_location_phone	varchar(20) not null comment '접종처 번호',
	fv_location_manager	varchar(20) not null comment '접종처 담당자',
	primary key(fv_location_no)
);

select * from tbl_fv_location;
desc tbl_fv_location;

-- 배열이 똑같으면 생략이 가능하다. 
insert into tbl_fv_location values(1001, 'A접종처', 'AAA시 aaa구', '471-013', '010-8410-8426', 'A담당');
insert into tbl_fv_location values(1002, 'B접종처', 'BBB시 bbb구', '856-123', '010-4684-1324', 'B담당');
insert into tbl_fv_location values(1003, 'C접종처', 'CCC시 ccc구', '867-475', '010-2054-7465', 'C담당');
insert into tbl_fv_location values(1004, 'D접종처', 'DDD시 ddd구', '123-753', '010-4865-1514', 'D담당');
insert into tbl_fv_location values(1005, 'E접종처', 'EEE시 eee구', '352-489', '010-3548-7891', 'E담당');






































