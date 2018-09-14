-- 显示所有引擎
show engines;

-- 创建表指定引擎
create table xxx_inno (id int) engine = innodb;

create table xxx_myisam (id int) engine = myisam;

show create table xxx_myisam;

-- 事务操作的基本语法
start transaction; -- begin; 事务的边界
savepoint xxx;
rollback;
commit;


select * from xxx_inno;

select * from xxx_myisam;

-- % _
show tables like 'lagou\____';

show full processlist;

kill 109;
