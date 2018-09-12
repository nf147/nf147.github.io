select * from lagou_position_result limit 5;

create table area_demo1 (
  area_id int auto_increment primary key,
  sheng varchar(20) not null,
  shi varchar(20) not null,
  xian varchar(20) not null,
  quhao varchar(20) not null,
  youbian varchar(20),
  jingdu decimal(10, 10),
  weidu decimal(10, 10)
  );

insert into area_demo1 (sheng, shi, xian, quhao) values
  ('广东省', '珠海市', '斗门区', '22323'),
  ('广东省', '珠海市', '香洲区', '22324'),
  ('广东省', '珠海市', '金湾区', '22325'),
  ('广东省', '广州市', '天河区', '11155'),
  ('广东省', '广州市', '越秀区', '11156'),
  ('广东省', '广州市', '白云区', '11157');

select * from area_demo1 where shi='珠海市' or shi='广州市';

select distinct shi from area_demo1 where sheng='广东省';

select * from area_demo1;

create table s_sheng (id int auto_increment primary key, name varchar(20));
insert into s_sheng (name) values ('广东省'), ('山东省'), ('广西省'), ('湖南省');

create table s_shi (id int auto_increment primary key, name varchar(20), sheng int references s_sheng(id));
insert into s_shi (name, sheng) values
  ('珠海市', 1), ('广州市', 1), ('湛江', 1),
  ('桂林市', 3), ('南宁市', 3), ('柳州', 3);

drop table if exists s_xian;
create table s_xian (id int auto_increment primary key, name varchar(20), shi int references s_shi(id), youbian varchar(20), jingdu varchar(20), weidu  varchar(20));
insert into s_xian (name, shi) values
  ('斗门区',  1), ('金湾区', 1), ('香洲区', 1);

select * from s_sheng;
select * from s_shi;
select * from s_xian;

-- 全连接，笛卡尔积
select * from s_shi full join s_sheng;
