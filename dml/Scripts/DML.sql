use study;

create table tbl_member(
   id bigint unsigned auto_increment primary key,
   member_id varchar(255) not null unique,
   member_password varchar(255) not null,
   member_email varchar(255) not null unique,
   member_birth date
);

create table tbl_market(
	id bigint unsigned auto_increment primary key,
	market_id varchar(255) not null,
	market_name varchar(255) not null unique,
	market_location varchar(255) default '강남',
	market_phone varchar(255) 
);

select * from tbl_market;

INSERT INTO tbl_market
(market_id, market_name, market_location, market_phone)
VALUES(1, '천원포차', '강남', 010-6289-7138);

UPDATE tbl_market
SET id=1, market_phone='010-6289-7138'
WHERE market_phone= 010-6289-7138

drop table tbl_market;



create table tbl_product(
   id bigint unsigned auto_increment primary key,
   product_name varchar(255) not null,
   product_price int default 0,
   product_stock int default 0
);

create table tbl_order(
   id bigint unsigned auto_increment primary key,
   order_date datetime default current_timestamp(),
   member_id bigint unsigned,
   product_id bigint unsigned,
   constraint fk_order_member foreign key(member_id)
   references tbl_member(id),
   constraint fk_order_product foreign key(product_id)
   references tbl_product(id)
);

insert into tbl_order(member_id)
values(2);

select * from tbl_order;

/*상품을 1개 추가하고, 1번 회원의 주문 정보 중 추가된 상품의 번호로 수정하기*/
insert into tbl_product
(product_name, product_price, product_stock)
values('게이밍키보드', 83000, 32);

select * from tbl_product;

update tbl_order
set product_id = 1
where product_id is null;
/*where product_id is null;*//*안돼요!*/

UPDATE tbl_product
SET product_name='게이밍 의자'
WHERE id=1;





select id, member_id, member_password, member_email, member_birth from tbl_member;
select * from tbl_member;

insert into tbl_member (member_id, member_password, member_email, member_birth)
values('hds1234', '1234', 'tedhan1204@gmail.com', str_to_date('2000-12-04', '%Y-%m-%d'));

/*문자열을 date타입의 컬럼에 추가할 때에는 자동 형변환된다.*/
insert into tbl_member (member_id, member_password, member_email, member_birth)
values('hgd9876', '9999', 'hgd1234@gmail.com','2010-05-05');

update tbl_member
set member_email = 'dev.tedhan@gmail.com'
where id = 1;

delete from tbl_member
where id = 2;

DELETE FROM tbl_member
WHERE member_id='2';
select * from tbl_member;

/******************************************************************************************/
drop table tbl_member;
drop table tbl_product;
drop table tbl_order;

create table tbl_member(
   id bigint unsigned auto_increment primary key,
   member_id varchar(255) not null unique,
   member_password varchar(255) not null,
   member_email varchar(255) not null unique,
   member_birth date
);

create table tbl_post(
   id bigint unsigned auto_increment primary key,
   post_title varchar(255) not null,
   post_content varchar(255) not null,
   member_id bigint unsigned,
   constraint fk_post_member foreign key(member_id)
   references tbl_member(id)
);

/*댓글에 게시글 번호 FK로 추가하기*/
create table tbl_reply(
   id bigint unsigned auto_increment primary key,
   reply_content varchar(255) not null,
   member_id bigint unsigned,
   post_id bigint unsigned,
   constraint fk_reply_member foreign key(member_id)
   references tbl_member(id),
   constraint fk_reply_post foreign key(post_id)
   references tbl_post(id)
);
select * from tbl_reply;

alter table tbl_reply add post_id bigint unsigned;

alter table tbl_reply add constraint fk_reply_post foreign key(post_id)
references tbl_post(id);

/*회원가입 하기*/
select * from tbl_member;
drop table tbl_member;

insert into tbl_member(member_id, member_password, member_email, member_birth)
values('jhj7343', '13139', 'jhj7343@naver.com', '1991-03-00');

/*게시글을 한 개 추가하기*/
select * from tbl_post;

insert into tbl_post(post_title, post_content, member_id)
values('부대찌개', '당면사리는 필수에요', 3);

/*추가된 게시글에 댓글 2개 작성하기*/
select * from tbl_reply; 
insert into tbl_reply(reply_content, member_id)
values('re) 다른 레시피도 주세요', 2);

update tbl_reply
set post_id = 1
where post_id is null;
select * from tbl_member;
/*회원 정보 중 아이디 수정하기*/
select * from tbl_member;
update tbl_member
set member_id = 'jhb0917'
where id = 3;

UPDATE tbl_member
SET member_password = 7878
WHERE id = 1;


select * from tbl_post;

/*1개 게시글의 제목 수정하기*/
update tbl_post
set post_title = '제목 바꾸라!'
where id = 3;

select * from tbl_post;

/*1개 게시글의 모든 댓글의 내용을 같은 내용으로 수정하기*/
update tbl_reply
set reply_content = '수정된 내용'
where post_id = 1;

select * from tbl_reply;
/*****************************************************************/
create table tbl_file(
   id bigint unsigned auto_increment primary key,
   file_name varchar(255),
   file_uuid varchar(255),
   file_path varchar(255),
   file_represent varchar(255),
   member_id bigint unsigned,
   constraint fk_file_member foreign key(member_id)
   references tbl_member(id)
);

select * from tbl_member;

/*사용자의 프로필 사진을 3개 추가한다.*/
INSERT INTO tbl_file
(file_name, file_uuid, file_path, file_represent, member_id)
VALUES('전성기1.png', 'fjiodsk_fdu67kol_3128', '2023/07/07', 'NO', 1);

INSERT INTO tbl_file
(file_name, file_uuid, file_path, file_represent, member_id)
VALUES('전성기2.png', 'fjiodsk_fdskol_3128', '2023/07/06', 'YES', 1);

INSERT INTO tbl_file
(file_name, file_uuid, file_path, file_represent, member_id)
VALUES('전성기3.png', 'fjiodsk_fdnbvnskol_3128', '2023/07/06', 'NO', 1);

INSERT INTO tbl_file
(file_name, file_uuid, file_path, file_represent, member_id)
VALUES('주현진.png', 'sdzsk_fdnthenskol_4428', '2023/07/07', 'NO', 1);

select * from tbl_member;
select * from tbl_file;

/*사용자의 프로필 사진 중 대표 이미지를 모두 가져오기*/
select * from tbl_file
where file_represent ='NO'



select * from tbl_file
where file_represent = 'YES';

/*3번 프로필 사진의 회원번호를 알아내서*/
select * from tbl_file
where id = 3;

/*프로필 사진의 주인 정보를 조회하기*/
select * from tbl_member
where id = 3;

/*다른 이미지를 대표로 설정하기(1번 회원)*/
select * from tbl_file;

update tbl_file
set file_represent = 'YES'
where id = 3;

update tbl_file
set file_represent = 'NO'
where id = 2;

/*대표 이미지가 아닌 이미지를 파일의 이름으로 삭제하기(1번 회원)*/

select * from tbl_file;

delete from tbl_file
where file_represent = 'YES' AND file_name = '전성기2.png';
/********************************************************************/
-- 6시간 40분 
/* alias: 별칭*/

/* select절, from절에서 사용가능*/
/* select 컬럼명 as 별칭 from 테이블명*/
/* select 컬럼명 별칭 from 테이블명*/
select concat('아이디는 ', m.member_id) as intro from tbl_member m;

/* like: 포함된 문자열 값을 찾고, 문자의 개수도 제한을 줄 수 있다.*/
/* %: 모든 것*/
/* _: 글자 수*/
-- where [컬럼명] + like '' => 따옴표 안에 사용 하면 된다!
-- like 는 검색 서비스에서 반드시 사용 된다!

/*
 * -- 예시
 * '%A': A로 끝나는 모든 값(SDNMFKLSMA, 123NHFUA)
 * 'A%': A로 시작하는 모든 값(APPLE1234, APP)
 * 'A__': A로 시작하면서 3글자인 값(ABC, ACE)
 * 'A_': A로 시작하면 2글자인 값
 * '%A%': A가 포함된 값(ABC, BAC, BCA)
 * */


/********************************************************************/
-- 6시간 50분





create table tbl_student(
   id bigint unsigned auto_increment primary key,
   student_name varchar(255) not null,
   student_major varchar(255) not null,
   student_level int default 1
);

INSERT INTO tbl_student
(student_name, student_major, student_level)
VALUES('한동석', '컴퓨터 공학', 1);

INSERT INTO tbl_student
(student_name, student_major, student_level)
VALUES('홍길동', '전자 공학', 2);

INSERT INTO tbl_student
(student_name, student_major, student_level)
VALUES('이순신', '의류 패션', 2);

insert into tbl_student
(student_name, student_major, student_level)
(select student_name, student_major, student_level from tbl_student);

select * from tbl_student
where student_major like '%공학%';

select * from tbl_student
where student_major like '____공학'
-- 공학 앞에 공백 포함 4글자 포함 된 애들 

/*학생 이름 중에서 홍씨 찾기*/
select * from tbl_student
where student_name like '홍%';

-- 7시간 14분

-- /*집계 함수*/ 여러개의 데이터를 모은다.
/*결과가 1개 나온다.*/
/*
 * avg()
 * max()
 * min()
 * sum()
 * count()
 * 
 * */
create table tbl_subject(
   id bigint unsigned auto_increment primary key,
   subject_name varchar(255) not null,
   subject_score int default 0
);

INSERT INTO tbl_subject
(subject_name, subject_score)
VALUES('정보와 윤리', 10);

INSERT INTO tbl_subject
(subject_name, subject_score)
VALUES('산업혁명의 대가', 5);

INSERT INTO tbl_subject
(subject_name, subject_score)
VALUES('현대미술의 암기', 7);

INSERT INTO tbl_subject
(subject_name, subject_score)
VALUES('사회적 의존관계 수립', 8);

select * from tbl_subject;

UPDATE tbl_subject
SET subject_name='심리학의 이해'
WHERE id= 6;

UPDATE tbl_subject
SET subject_name='자기관리의 개념'
WHERE id= 7;

UPDATE tbl_subject
SET subject_name='믿고 듣는 주식초보 입문기'
WHERE id= 8;


select 
avg(subject_score) as "average",
sum(subject_score) as "total",
max(subject_score) as "max",
min(subject_score) as "min",
count(subject_score) as "count"
from tbl_subject;

-- db에서 연산해서 파이썬으로 보내는것이 가장 깔끔하다!! 파이썬에서 연산 할 생각 보다는 기본적인 와꾸는 db 에서 !

/*수강 신청 테이블*/
create table tbl_student_subject(
   id bigint unsigned auto_increment primary key,
   subject_grade varchar(255),
   subject_status varchar(255),
   student_id bigint unsigned,
   subject_id bigint unsigned,
   constraint fk_student_subject_student foreign key(student_id)
   references tbl_student(id),
   constraint fk_student_subject_subject foreign key(subject_id)
   references tbl_subject(id)
);


/*총 점수*/
/*평균 점수*/
/*수강 신청한 학생 수*/


/*수강 완료한 학생들 정보 추가*/

-- 이 부분 정리 필요합니다!!!
select * from tbl_student;
select * from tbl_subject;

alter table tbl_student_subject change subject_grade subject_grade int;
alter table tbl_student_subject change subject_status subject_status varchar(255) default 'done';

insert into tbl_student_subject
(subject_grade, student_id, subject_id)
values(100, 214, 5);


/*
 * group by: 묶을 때 사용(~별)
 * 
 * group by 컬럼명 having 조건식
 * 
 * */
select subject_id, count(id) "count" 
from tbl_student_subject
group by subject_id;


select * from tbl_subject;
select * from tbl_student_subject;

/*
 * group by 후 전체 조회 시
 * 중복된 데이터는 가장 먼저 찾은 데이터로 조회된다.
 * */
select * from tbl_student_subject
group by student_id;

select student_id, subject_id from tbl_student_subject
group by student_id, subject_id;

select student_id, count(student_id) from tbl_student_subject
group by student_id;

select student_id, avg(subject_grade) average from tbl_student_subject
group by student_id;

select subject_id, count(student_id) from tbl_student_subject
group by subject_id;


/*
 * group by: 묶을 때 사용(~별)
 * 
 * group by 컬럼명 having 조건식
 * 
 * */
select subject_id, count(id) "count" 
from tbl_student_subject
group by subject_id;


select * from tbl_subject;
select * from tbl_student_subject;

/*
 * group by 후 전체 조회 시
 * 중복된 데이터는 가장 먼저 찾은 데이터로 조회된다.
 * */
select * from tbl_student_subject
group by student_id;

select student_id, subject_id from tbl_student_subject
group by student_id, subject_id;

select student_id, count(student_id) from tbl_student_subject
group by student_id;

select student_id, avg(subject_grade) average from tbl_student_subject
group by student_id;

select subject_id, count(student_id) from tbl_student_subject
group by subject_id;

/**********************************************************************/
drop table tbl_reply;
drop table tbl_post;
drop table tbl_file;
drop table tbl_member;

create table tbl_member(
   id bigint unsigned auto_increment primary key,
   member_type varchar(255) default 'basic',
   member_id varchar(255) unique not null,
   member_password varchar(255) not null
);

insert into tbl_member(member_id, member_password)
values('hds', '1234');

insert into tbl_member(member_id, member_password)
values('hgd', '1234');

insert into tbl_member(member_id, member_password)
values('lss', '1234');

select * from tbl_member;

create table tbl_office(
   id bigint unsigned auto_increment primary key,
   office_name varchar(255),
   office_location varchar(255)
);

insert into tbl_office(office_name, office_location)
values('강남점', '강남구');

insert into tbl_office(office_name, office_location)
values('노원점', '노원구');

insert into tbl_office(office_name, office_location)
values('분당점', '분당');

insert into tbl_office(office_name, office_location)
values('인천점', '인천');

select * from tbl_office;

create table tbl_conference_room(
   id bigint unsigned auto_increment primary key,
   office_id bigint unsigned,
   constraint conference_room_office_office foreign key(office_id)
   references tbl_office(id)
);

insert into tbl_conference_room
(office_id)
values (4);

select * from tbl_conference_room;

create table tbl_part_time(
   id bigint unsigned auto_increment primary key,
   start_time datetime,
   end_time datetime,
   conference_room_id bigint unsigned,
   constraint part_time_conference_room foreign key(conference_room_id)
   references tbl_conference_room(id)
);

alter table tbl_part_time change start_time start_time time;
alter table tbl_part_time change end_time end_time time;

insert into tbl_part_time
(start_time, end_time, conference_room_id)
values('11:00:00', '12:00:00', 11);
insert into tbl_part_time
(start_time, end_time, conference_room_id)
values('11:00:00', '12:00:00', 1);
insert into tbl_part_time
(start_time, end_time, conference_room_id)
values('11:00:00', '12:00:00', 9);
insert into tbl_part_time
(start_time, end_time, conference_room_id)
values('16:00:00', '18:00:00', 7);

select * from tbl_part_time;

/*시작 시간별 회의실 개수*/
select start_time, end_time, count(conference_room_id) from tbl_part_time
group by start_time, end_time;

select current_time  from dual;

create table tbl_reservation(
   id bigint unsigned auto_increment primary key,
   member_id bigint unsigned,
   conference_room_id bigint unsigned,
   constraint reservation_member foreign key(member_id)
   references tbl_member(id),
   constraint reservation_conference_room foreign key(conference_room_id)
   references tbl_conference_room(id)
);
/*회의실 별 등록인원 수
 *회의실 별 등록 인원 수가 2명이 넘는 회의실 조회 */



/*SUB QUERY*/
/*
 * FROM절: IN LINE VIEW
 * SELECT절: SCALAR
 * WHERE절: SUB QUERY
 * 
 * */
INSERT INTO tbl_field_trip
(field_trip_title, field_trip_content, field_trip_number)
VALUES('테스트 제목1', '테스트 내용1', 10);
INSERT INTO tbl_field_trip
(field_trip_title, field_trip_content, field_trip_number)
VALUES('테스트 제목2', '테스트 내용2', 20);
INSERT INTO tbl_field_trip
(field_trip_title, field_trip_content, field_trip_number)
VALUES('테스트 제목3', '테스트 내용3', 25);
INSERT INTO tbl_field_trip
(field_trip_title, field_trip_content, field_trip_number)
VALUES('테스트 제목3', '테스트 내용4', 5);
INSERT INTO tbl_field_trip
(field_trip_title, field_trip_content, field_trip_number)
VALUES('테스트 제목2', '테스트 내용5', 40);

/*제목이 '테스트 제목3'인 체험학습 중에 지원 가능 수가 5보다 큰 체험학습 조회*/
select * from
(
   select * from tbl_field_trip
   where field_trip_title = '테스트 제목3'
) ft
where ft.field_trip_number > 5;

/*select * from (
	select * from tbl_field_trip
	where field_trip_title = '테스트 제목3'
) ft
where ft.field_trip_number >5;*/


/*체험학습 평균 지원수 보다 큰 체험학습 전체 정보 조회*/

select * from tbl_field_trip
where field_trip_number > 
(select avg(field_trip_number) from tbl_field_trip);

/*select ft.*, (select avg(field_trip_number) from tbl_field_trip) 
from tbl_field_trip ft
where field_trip_number > 
(select avg(field_trip_number) from tbl_field_trip);*/
select * 
from tbl_field_trip
where field_trip_number > 
(select avg(field_trip_number) from tbl_field_trip);

/*체험학습 제목 별 개수가 2이상인 체험학습의 전체 정보 조회*/
/*컬럼명 in(A, B, ...)*/
/*컬럼명 = A OR 컬럼명 = B OR, ...*/
/*where field_trip_title = '테스트 제목2' OR field_trip_title = '테스트 제목3';*/
/*where field_trip_title in ('테스트 제목2', '테스트 제목3');*/
/*결과가 여러 개 나오는데 비교대상이 하나 일때 =은 사용 할 수 없다 이 때 in을 쓴다*/

select * from tbl_field_trip
where field_trip_title in
(
   select field_trip_title 
   from tbl_field_trip
   group by field_trip_title
   having count(id) >= 2
);

/*order by*/ /*정렬*/
/*asc: 오름차순, 생략 가능 (디폴트 값이다!)*/
/*desc: 내림차순*/
/*order by [컬럼명] [asc/desc]*/

select * from tbl_field_trip
where field_trip_title in
(
   select field_trip_title 
   from tbl_field_trip
   group by field_trip_title
   having count(id) >= 2
)
order by field_trip_number desc;

/*
 * SQL 실행 순서
 * from > on > join > where > group by > having > select > order by
 * 
 * */

INSERT INTO tbl_member
(member_id, member_password, member_email, member_birth, member_address)
VALUES('hds1234', '1234', 'hds1234@gmail.com', '2023-12-04', '경기도 남양주시');

INSERT INTO tbl_member
(member_id, member_password, member_email, member_birth, member_address)
VALUES('lub7890', '1234', 'lub7890@gmail.com', '2023-12-04', '경기도 남양주시');

INSERT INTO tbl_product
(product_name, product_price, product_stock)
VALUES('옷', 30000, 50);

INSERT INTO tbl_order
(member_id, product_id, product_count)
VALUES(1, 1, 5);

select * from tbl_member;
select * from tbl_product;


select * from tbl_order;
select * 
from tbl_order o 
inner join tbl_member m
on o.member_id = m.id
inner join tbl_product p
on o.product_id = p.id;b 

/*회원 정보 추가*/
/*게시글 추가*/
/*댓글 추가*/

/*게시글 정보와 그 게시글을 작성한 회원 정보 모두 조회*/
/*댓글 조회와 작성자 정보 모두 조회*/
/*댓글 내용 중 "안녕"이 포함된 댓글의 게시글 정보 중 게시글 제목과 내용 조회*/

create table tbl_post(
   id bigint unsigned auto_increment primary key,
   post_title varchar(255) not null,
   post_content varchar(255) not null,
   member_id bigint unsigned,
   constraint fk_post_member foreign key(member_id)
   references tbl_member(id)
);
drop table tbl_reply;
create table tbl_reply(
   id bigint unsigned auto_increment primary key,
   reply_content varchar(255) not null,
   post_id bigint unsigned,
   member_id bigint unsigned,
   constraint fk_reply_post foreign key(post_id)
   references tbl_post(id),
   constraint fk_reply_member foreign key(member_id)
   references tbl_member(id)
);

create table tbl_member(
   id bigint unsigned auto_increment primary key,
   member_id varchar(255) not null unique,
   member_password varchar(255) not null,
   member_email varchar(255) not null unique,
   member_address varchar(255),
   member_birth date
);

/*회원 정보 추가*/
select * from tbl_member;
insert into tbl_member(member_id, member_password, member_email, member_address, member_birth)
values('jhj7343', 1234, 'jhj7343@naver.com', '부천시', '1991-02-28');
insert into tbl_member(member_id, member_password, member_email, member_address, member_birth)
values('hgd7343', 1234, 'hgd4545@naver.com', '강남구', '1995-03-18');
insert into tbl_member(member_id, member_password, member_email, member_address, member_birth)
values('pdd7343', 1234, 'pdd1234@naver.com', '부천시', '1988-11-08');
insert into tbl_member(member_id, member_password, member_email, member_address, member_birth)
values('yar1111', 1234, 'zgzg713@gmail.com', '부천시', '1991-02-28');

/*게시글 추가*/
select * from tbl_post;

insert into tbl_post(post_title, post_content, member_id)
values('테스트 제목1', '테스트 내용1' , 1);
insert into tbl_post(post_title, post_content, member_id)
values('테스트 제목2', '테스트 내용2' , 3);
insert into tbl_post(post_title, post_content, member_id)
values('테스트 제목3', '테스트 내용3' , 3);
insert into tbl_post(post_title, post_content, member_id)
values('테스트 제목4', '테스트 내용4' , 1);
insert into tbl_post(post_title, post_content, member_id)
values('테스트 제목5', '테스트 내용5' , 1);

select * from tbl_post;

/*댓글 추가*/
select * from tbl_reply;

insert into tbl_reply(reply_content, member_id, post_id)
values('테스트 댓글1', 3, 1);
insert into tbl_reply(reply_content, member_id, post_id)
values('테스트 댓글2', 3, 1);
insert into tbl_reply(reply_content, member_id, post_id)
values('테스트 댓글3', 3, 3);
insert into tbl_reply(reply_content, member_id, post_id)
values('테스트 댓글1', 1, 4);
insert into tbl_reply(reply_content, member_id, post_id)
values('테스트 댓글1', 1, 5);

select * from tbl_reply;

/*게시글 정보와 그 게시글을 작성한 회원 정보 모두 조회*/
/*내부 join 에서는 A inner join B  A가 선행테이블 로서 1대 다 관계에서 1이 오는 것이 성능이 좋습니다!*/

/*select * from tbl_post inner join tbl_member => 여기서는 tbl_member가 1쪽이므로 앞으로 보낸다.*/

select *
from tbl_member m
inner join tbl_post p
on m.id = p.member_id;

select * 
from tbl_member m
inner join tbl_post p
on m.id = p.member_id;

/*댓글 조회와 작성자 정보 모두 조회*/

select *
from tbl_member m
inner join tbl_reply r
on m.id = r.member_id;



select *
from tbl_member m
inner join tbl_reply r
on m.id = r.member_id;

/*댓글 내용 중 "안녕"이 포함 된 댓글의 게시글 정보 중 게시글 제목과 내용 조회*/

update tbl_reply
set reply_content ='테스트 안녕!'
where id = 4;


select * from 
tbl_post p
inner join tbl_reply r
on reply_content like '%안녕%' and p.id = r.post_id;
-- -- 							/*이 부분 다시 설명 부탁 하기*/

/*sub query 써도 가능*/
select post_title, post_content
from tbl_post p
inner join
(
	select * from tbl_reply
	where reply_content like '%안녕%'
)r
on p.id = r.post_id;
/*게시글 별 댓글 수가 가장 많은 게시글 정보와 작성자 정보 조회*/
select * from tbl_member m


select * 
from tbl_member m
inner join
tbl_post p
on p.id =
(
   select post_id
   from
   (
      select p1.post_id, max(p1.reply_count) 
      from
      (
         select post_id, count(post_id) reply_count from tbl_reply
         group by post_id
      ) p1
   ) p2
)
and
m.id = p.member_id;
/*게시글 별 댓글 수가 가장 많은 게시글 정보와 작성자 정보 조회*/
/*
 * limit 행번호(0부터), 개수 =>
 *limit 0, 1 => 0번째 행에서부터 1개 가져와라  => 강의 4시간 55분쯤 부터
 * */
select * from tbl_member m
inner join tbl_post p
on p.id =
(
   select post_id from tbl_reply
   group by post_id
   order by count(post_id) desc
   limit 0, 1
)
and
m.id = p.member_id;
/*sub쿼리는 cost 낭비가 심하므로 되도록 지양 하자*/

/*게시글 별 댓글 수가 가장 많은 게시글 정보와 작성자 정보 조회*/
select * 
from tbl_member m
inner join
tbl_post p
on p.id =
(
   select post_id
   from
   (
      select p1.post_id, max(p1.reply_count) 
      from
      (
         select post_id, count(post_id) reply_count from tbl_reply
         group by post_id
      ) p1
   ) p2
)
and
m.id = p.member_id;

/*
 * limit 행번호(0부터), 개수
 * 
 * */
where post_id
select post_id,  reply_count from tbl_reply
group by post_id
order by count(post_id) desc
limit 0, 1;

/*부모 테이블*/
insert into tbl_parent(parent_name, parent_age, parent_address, parent_phone, parent_gender)
values('한동석', 20, '경기도 남양주', '01012341234', '남자');
insert into tbl_parent(parent_name, parent_age, parent_address, parent_phone, parent_gender)
values('임희수', 21, '잠실 시그니엘', '01078977897', '여자');
insert into tbl_parent(parent_name, parent_age, parent_address, parent_phone, parent_gender)
values('임수현', 21, '경기도 안성', '01088889999', '남자');

select * from tbl_parent;

/*아이 테이블*/
insert into tbl_child(child_name, child_age, child_gender, parent_id)
values('장동혁', 5, '남자', 1);
insert into tbl_child(child_name, child_age, child_gender, parent_id)
values('임웅빈', 4, '남자', 2);
insert into tbl_child(child_name, child_age, child_gender, parent_id)
values('오주연', 3, '여자', 3);
insert into tbl_child(child_name, child_age, child_gender, parent_id)
values('허은상', 11, '남자', 1);
insert into tbl_child(child_name, child_age, child_gender, parent_id)
values('김혜빈', 20, '여자', 2);

select * from tbl_child;

/*체험학습 테이블*/
insert into tbl_field_trip(field_trip_title, field_trip_content, field_trip_number)
values('매미 잡기 체험학습', '매미 잡으러 떠나자!', 5);
insert into tbl_field_trip(field_trip_title, field_trip_content, field_trip_number)
values('메뚜기 때려 잡기 체험학습', '메뚜기 다 잡자!', 50);
insert into tbl_field_trip(field_trip_title, field_trip_content, field_trip_number)
values('물놀이 체험학습', '한강 수영장으로 퐁당!', 20);
insert into tbl_field_trip(field_trip_title, field_trip_content, field_trip_number)
values('블루베리 채집 체험학습', '맛있어 블루베리 냠냠!', 25);
insert into tbl_field_trip(field_trip_title, field_trip_content, field_trip_number)
values('코딩 체험학습', '나도 빌게이츠!', 20);

select * from tbl_field_trip;
select * from tbl_child;
/*신청하기 테이블*/
insert into tbl_apply(child_id, field_trip_id)
values(1, 10);
insert into tbl_apply(child_id, field_trip_id)
values(2, 7);
insert into tbl_apply(child_id, field_trip_id)
values(3, 8);
insert into tbl_apply(child_id, field_trip_id)
values(4, 8);
insert into tbl_apply(child_id, field_trip_id)
values(4, 9);
insert into tbl_apply(child_id, field_trip_id)
values(5, 9);
insert into tbl_apply(child_id, field_trip_id)
values(5, 6);
insert into tbl_apply(child_id, field_trip_id)
values(5, 10);
insert into tbl_apply(child_id, field_trip_id)
values(5, 8);

select * from tbl_apply;




/*매미 체험학습에 신청한 아이의 전체 정보*/
select * from tbl_child
where id in
(
   select child_id from tbl_apply
   where field_trip_id =
   (
      select id from tbl_field_trip
      where field_trip_title = '매미 잡기 체험학습'
   )
);

select c.* from tbl_field_trip ft
inner join tbl_apply a
on ft.field_trip_title = '매미 잡기 체험학습'
and a.field_trip_id = ft.id
inner join tbl_child c
on c.id = a.child_id;

/*체험학습을 2개 이상 신청한 아이의 정보와 부모의 정보 모두 조회*/
select c.*, p.* from tbl_child c
inner join
(
   select child_id from tbl_apply
   group by child_id
   having count(field_trip_id) >= 2
) a
on c.id = a.child_id
inner join tbl_parent p
on c.parent_id = p.id;

/*나이가 21살인 부모의 아이들이 지원한 체험학습 전체 조회 */
select id from tbl_parent
where parent_age = 21;

/*distinct는 중복된 행을 제거해준다.*/
select distinct ft.*
from tbl_apply a
inner join
(
   select id from tbl_child
   where parent_id in
   (
      select id from tbl_parent
      where parent_age = 21
   )
) c
on a.child_id = c.id
inner join tbl_field_trip ft
on a.field_trip_id = ft.id;

/*평균 참가자(지원자) 수보다 적은 체험학습의 제목과 내용 조회 */
select * from tbl_field_trip
where id in
(
   select field_trip_id from tbl_apply
   group by field_trip_id
   having count(child_id) <
   (
      select avg(child_count) from
      (
         select count(child_id) child_count from tbl_apply
         group by field_trip_id
      ) a
   )
);

/*참가자(지원자) 수가 가장 적은 체험학습의 제목과 내용 조회 */
select ft.* from tbl_field_trip ft
inner join
(
   select field_trip_id, count(child_id) from tbl_apply
   group by field_trip_id
   having count(child_id) in
   (
      select min(child_count) from
      (
         select count(child_id) child_count from tbl_apply
         group by field_trip_id
         order by child_count
      ) a1
   )
) a2
on ft.id = a2.field_trip_id;


/************************************************************************************************/

create table tbl_company(
   id bigint unsigned auto_increment primary key,
   company_name varchar(255) not null,
   company_address varchar(255) not null,
   company_phone varchar(255) not null,
   company_type varchar(255) not null
);

drop table tbl_category_a;
drop table tbl_category_b;

create table tbl_category_a(
   id bigint unsigned auto_increment primary key,
   category_a_name varchar(255) not null
);

create table tbl_category_b(
   id bigint unsigned auto_increment primary key,
   category_b_name varchar(255) not null,
   category_a_id bigint unsigned,
   constraint fk_category_b_category_a foreign key(category_a_id)
   references tbl_category_a(id)
);

create table tbl_category_c(
   id bigint unsigned auto_increment primary key,
   category_c_name varchar(255) not null,
   category_b_id bigint unsigned,
   constraint fk_category_c_category_b foreign key(category_b_id)
   references tbl_category_b(id)
);

create table tbl_advertisement(
   id bigint unsigned auto_increment primary key,
   advertisement_title varchar(255) not null,
   advertisement_content varchar(255) not null,
   category_c_id bigint unsigned not null,
   constraint fk_advertisement_category_c foreign key(category_c_id)
   references tbl_category_c(id)
);

drop table tbl_apply;
create table tbl_apply(
   id bigint unsigned auto_increment primary key,
   company_id bigint unsigned,
   advertisement_id bigint unsigned,
   constraint fk_apply_company foreign key(company_id)
   references tbl_company(id),
   constraint fk_apply_advertisement foreign key(advertisement_id)
   references tbl_advertisement(id)
);
INSERT INTO view_advertisement (advertisement_title,advertisement_content,category_a_name,category_b_name,category_c_name) VALUES
    ('풍성한 추석보내세요 사과와 함께','사과중에 으뜸은 햇사과!','과일','사과','햇사과'),
    ('아오리 사과와 함께','아이도 좋아하는 아오리 아오리 좋아!','과일','사과','아오리 사과'),
    ('결제가 내 손안에','갑시다 결제 고고','플랫폼','은행','결제'),
    ('인터넷으로 자유롭게','자산 관리 합시다.','플랫폼','은행','인터넷 뱅킹'),
    ('둥둥 하얀 구름','너도 이제 대표!','플랫폼','클라우드','개인 서버'),
    ('너 128GB 샀어?','난 32GB사고 512GB 클라우드 샀어!','플랫폼','클라우드','이미지 갤러리');

insert into tbl_category_a(category_a_name)
values('과일');

select * from tbl_category_a;

insert into tbl_category_b(category_b_name, category_a_id)
values('사과', 1);

select * from tbl_category_b;

insert into tbl_category_c(category_c_name, category_b_id)
values('아오리 사과', 1);

select * from tbl_category_c;

insert into tbl_advertisement(advertisement_title, advertisement_content, category_c_id)
values('풍성한 추석보내세요 사과와 함께', '사과중에 으뜸은 햇사과!', 1);

insert into tbl_advertisement(advertisement_title, advertisement_content, category_c_id)
values('아오리 사과와 함께', '아이도 좋아하는 아오리 아오리 좋아!', 2);

create or replace view view_advertisement as
(
   select ad.id, ad.advertisement_title, ad.advertisement_content, a.category_a_name, b.category_b_name, c.category_c_name 
   from tbl_advertisement ad
   inner join tbl_category_c c
   on ad.category_c_id = c.id
   inner join tbl_category_b b
   on c.category_b_id = b.id
   inner join tbl_category_a a
   on b.category_a_id = a.id
);

select * from view_advertisement;

/*기업 정보 추가*/
insert into tbl_company(company_name, company_address, company_phone, company_type)
values('네이버', '서울', '0212341234', 'big');
insert into tbl_company(company_name, company_address, company_phone, company_type)
values('구글', '서울', '0255556666', 'big');
insert into tbl_company(company_name, company_address, company_phone, company_type)
values('동석마트', '서울', '0299998888', 'small');

/*광고 정보 추가*/
insert into tbl_category_a(category_a_name)
values('플랫폼');

select * from tbl_category_a;

insert into tbl_category_b(category_b_name, category_a_id)
values('은행', 2);

insert into tbl_category_b(category_b_name, category_a_id)
values('클라우드', 2);

select * from tbl_category_b;

insert into tbl_category_c(category_c_name, category_b_id)
values('결제', 2);

insert into tbl_category_c(category_c_name, category_b_id)
values('인터넷 뱅킹', 2);

insert into tbl_category_c(category_c_name, category_b_id)
values('개인 서버', 3);

insert into tbl_category_c(category_c_name, category_b_id)
values('이미지 갤러리', 3);

select * from tbl_category_c;


insert into tbl_advertisement(advertisement_title, advertisement_content, category_c_id)
values('결제가 내 손안에', '갑시다 결제 고고', 3);

insert into tbl_advertisement(advertisement_title, advertisement_content, category_c_id)
values('인터넷으로 자유롭게', '자산 관리 합시다.', 4);

insert into tbl_advertisement(advertisement_title, advertisement_content, category_c_id)
values('둥둥 하얀 구름', '너도 이제 대표!', 5);

insert into tbl_advertisement(advertisement_title, advertisement_content, category_c_id)
values('너 128GB 샀어?', '난 32GB사고 512GB 클라우드 샀어!', 6);

select * from view_advertisement;

/*광고 지원 정보 추가*/
insert into tbl_apply(company_id, advertisement_id)
values(3, 1);
insert into tbl_apply(company_id, advertisement_id)
values(3, 3);

insert into tbl_apply(company_id, advertisement_id)
values(1, 3);
insert into tbl_apply(company_id, advertisement_id)
values(1, 5);

insert into tbl_apply(company_id, advertisement_id)
values(2, 3);
insert into tbl_apply(company_id, advertisement_id)
values(2, 4);
insert into tbl_apply(company_id, advertisement_id)
values(2, 5);
insert into tbl_apply(company_id, advertisement_id)
values(2, 5);
insert into tbl_apply(company_id, advertisement_id)
values(2, 6);

select * from tbl_company;
select * from tbl_advertisement;
select * from tbl_apply;


/*기업 중 대기업이 등록한 광고 전체 정보 조회*/


select * from tbl_company
where id in
(
	select advertisement_id from tbl_category_a
	where company_type = big
);
	
	

/*대기업이 신청한 광고 중 대 카테고리 별 신청 개수 조회*/
/*소 카테고리 별 가장 인기 많은 광고 정보 조회*/
/*대 카테고리 중에서 중 카테고리가 2개 이상인 카테고리 이름 조회*/
/*체험학습을 2개 이상 신청한 아이의 정보와 부모의 정보 모두 조회*/
select c.*, p.* from tbl_child c
inner join
(
   select child_id from tbl_apply
   group by child_id
   having count(field_trip_id) >= 2
) a
on c.id = a.child_id
inner join tbl_parent p
on c.parent_id = p.id;

select category_b_id from category_a
group by category_b_id 
having count(category_a_id) > =2;

/*광고를 가장 많이 신청한 기업 정보 조회*/

/********************************************************************************
 * out join: 외부조인*/

DELETE FROM study.tbl_apply
WHERE id=0 AND company_id=0 AND advertisement_id=0;

