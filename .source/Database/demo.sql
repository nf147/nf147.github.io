-- 源数据
select * from china_city limit 4;
select * from lagou_position_bk limit 2; -- lagou_position_bk (工作信息，地区信息，分类信息，公司信息)


-- 要求，创建三张表
-- lagou_city (cityid, province, city, district)  # 全国的省市县信息，需要从 china_city 表中提取出来
-- lagou_company (cid, name, short_name, size, financestage) # 所有的公司表，从 lagou_position_bk 中分离出来
-- lagou_position (pid, cityid, cid, position, field, salary_min, salary_max, workyear, education, ptype, pnature, advantage, published_at, updated_at)


-- lagou_city 创建过程
-- 373 市 3341 县 总和 3714
select count(*) from china_city where depth=3;

create table lagou_city01 as
select d.id, p.cityName as province, c.cityName as city, d.cityName as district from
  (select * from china_city where depth=3) d
    join china_city c on d.parentId = c.id and c.depth=2
    join china_city p on c.parentId = p.id and p.depth=1;

select * from lagou_city01 limit 1;

insert into lagou_city01
select c.id, p.cityName as province, c.cityName as city, null as district from (select * from china_city where depth=2) c
  join china_city p on c.parentId = p.id and p.depth = 1;


select count(*) from lagou_city01;

create table lagou_city as
select d.id, p.cityName as province, c.cityName as city, d.cityName as district from
  (select * from china_city where depth=3) d
    join china_city c on d.parentId = c.id and c.depth=2
    join china_city p on c.parentId = p.id and p.depth=1
union
select c.id, p.cityName as province, c.cityName as city, null as district from (select * from china_city where depth=2) c
  join china_city p on c.parentId = p.id and p.depth = 1;
