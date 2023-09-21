use STUDY;

create table tbl_parent(
   id bigint unsigned auto_increment primary key,
   parent_name varchar(255) not null,
   parent_age tinyint unsigned,
   parent_address varchar(255) not null,
   parent_phone varchar(255) not null,
   parent_gender varchar(10) not null
);

create table tbl_child(
   id bigint unsigned auto_increment primary key,
   child_name varchar(255) not null,
   child_age tinyint unsigned default 6,
   child_gender varchar(10) not null,
   parent_id bigint unsigned,
   constraint fk_child_parent foreign key(parent_id)
   references tbl_parent(id)
);

create table tbl_field_trip(
   id bigint unsigned auto_increment primary key,
   field_trip_title varchar(255) not null,
   field_trip_content varchar(255) not null,
   field_trip_number int unsigned
);

create table tbl_field_trip_file(
   id bigint unsigned auto_increment primary key,
   file_name varchar(255),
   file_uuid varchar(255),
   file_path varchar(255),
   file_position varchar(255),
   field_trip_id bigint unsigned,
   constraint fk_field_trip_file_field_trip foreign key(field_trip_id)
   references tbl_field_trip(id)
);

create table tbl_apply(
   id bigint unsigned auto_increment primary key,
   child_id bigint unsigned not null,
   field_trip_id bigint unsigned not null,
   constraint fk_apply_child foreign key(child_id)
   references tbl_child(id),
   constraint fk_apply_field_trip foreign key(field_trip_id)
   references tbl_field_trip(id)
);