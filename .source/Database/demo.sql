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



-- 创建一张表，插入随机的 10w 条数据

-- 存储过程不建议使用
-- 1. 难以调试，难以维护
-- 2. 业务逻辑跟数据库耦合度过高，不便于迁移
-- 3. 对数据库的压力过大，需要分拆
-- 4. MySQL 对存储过程的支持有些弱鸡

-- 创建表
create table t_person
(
  pid int auto_increment primary key,
  name varchar(20) not null,
  weixin varchar(20) not null
  );

insert into  t_person (name, weixin) values
 ('ksdjkfsdj1', 'ksddjfksdj2333'),
  ('ksdjkfsdj2', 'ksddjfksdj2333'),
   ('ksdjkfsdj3', 'ksddjfksdj2333'),
    ('ksdjkfsdj4', 'ksddjfksdj2333'),
     ('ksdjkfsdj5', 'ksddjfksdj2333'),
      ('ksdjkfsdj6', 'ksddjfksdj2333'),
       ('ksdjkfsdj7', 'ksddjfksdj2333'),
        ('ksdjkfsdj8', 'ksddjfksdj2333');


delimiter //
drop procedure if exists pro_person_data;
create procedure pro_person_data (num int)
begin
    -- 定义变量
    -- 1. 局部变量，使用在存储过程或函数中，这样的变量使用 declare 进行声明，使用 set 进行赋值。作用域是过程中。
    -- 2. 用户变量，定义 set @xxx = 333; select @xxx := 333;  需要用 @ 符号进行修饰
    -- 3. 系统变量，系统自带的，内建的变量
    --    - 可以通过命令行的方式进行设置 mysqld --default_storage_engine=MyISAM
    --    - 可以在 my.ini 配置文件中进行配置 default_storage_engine=MyISAM
    --    - 可以通过 set 的方式进行动态设置
    --    - 系统变量，分为两类:
    --      1. 全局的(global)
    --         show global variables;
    --         set global default_storage_engine=MyISAM;
    --         set @@global.default_storage_engine=MyISAM;
    --      2. 会话的(session)
    --         show session variables;
    --         show local variables;
    --         show variables;
    --         set session default_storage_engine=MyISAM;
    --         set local   default_storage_engine=MyISAM;
    --         set @@session.default_storage_engine=MyISAM;
    --         set @@local.default_storage_engine=MyISAM;
    --         set default_storage_engine=MyISAM;
    --         set @@default_storage_engine=MyISAM;
    declare ii int default 0;
    declare v_name varchar(20);
    declare v_weixin varchar(20);

    -- while .. end while
    -- repeat .. until .. end repeat
    -- loop_label:loop ... leave loop_label .. end loop;
    while ii < num do
          set v_name = substring(md5(rand()), 9, 7);
          set v_weixin = substring(rand(), 3, 8);

          insert into t_person (name, weixin) values (v_name, v_weixin);

          set ii = ii + 1;
    end while;
end;
//
