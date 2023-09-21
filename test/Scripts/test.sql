-- create table tbl_student(
-- 	id bigint unsigned auto_increment primary key,
--    reply_content varchar(255) not null,
--    member_id bigint unsigned,
--    post_id bigint unsigned,
--    constraint fk_reply_member foreign key(member_id)
--    references tbl_member(id),
--    constraint fk_reply_post foreign key(post_id)
--    references tbl_post(id)
-- );

use study;
drop table tbl_student;

create table tbl_birds(
	id bigint unsigned auto_increment primary key,
	birds_name varchar(255) not null,
	birds_type varchar(255) default 'wing',
	birds_age int(30) not null,
	birds_feed varchar(255) default 'meet'
);
create table tbl_fishs(
	id bigint unsigned auto_increment primary key,
	fishs_name varchar(255) not null,
	fishs_type varchar(255) default 'nomal',
	fishs_age int(30) not null,
	fishs_feed varchar(255) default 'meet'
);

create table tbl_animal(
	id bigint unsigned auto_increment primary key,
	birds_id bigint unsigned,
	fish_id bigint unsigned,
	constraint fk_animal_birds foreign key(birds_id)
    references tbl_birds(id)
);