---测试组
-- ① 建表
create table if not exists tmp_train.tyh_test_c
(
    showid string comment '曝光id',
	flag int comment '标签，1是正例，0是负例',
    ismale int comment '创单用户是男性，isMale=1，否则isMale=0',
    age int comment '创单用户年龄',
    refundcount int comment '用户历史退票次数',
    refundmoney float comment '用户历史退票损失金额',
    settlementcount int comment '用户历史理赔次数',
	skusalesprice float comment 'item售价',
    skumaxcost int comment '最大的赔率,即曝光的赔率',
    purchasecount int comment '用户历史购买退改无忧的次数 '
)comment '对照组'
location '/data/train/tmp_train/tyh_test_c'

-- ② 导入数据
insert overwrite table tmp_train.tyh_test_c
select 
showid,
flag,
ismale,
age,
refundcount,
refundmoney,
settlementcount,
skusalesprice,
skumaxcost,
purchasecount
from tmp_train.tyh_test32_raw


-- ③ 查询
create table tyh_test_c_time_1 as 
select *
from tmp_train.tyh_test_c

---实验组1：分区表
-- ① 建表
create table if not exists tmp_train.tyh_test_t1
(
    showid string comment '曝光id',
	flag int comment '标签，1是正例，0是负例',
    ismale int comment '创单用户是男性，isMale=1，否则isMale=0',
    age int comment '创单用户年龄',
    refundcount int comment '用户历史退票次数',
    refundmoney float comment '用户历史退票损失金额',
    settlementcount int comment '用户历史理赔次数',
	skusalesprice float comment 'item售价',
    skumaxcost int comment '最大的赔率,即曝光的赔率',
    purchasecount int comment '用户历史购买退改无忧的次数 '
)comment '实验组1'
partitioned by (partition_date string comment '日期')
location '/data/train/tmp_train/tyh_test_t1'

-- ② 导入数据
--原先的表分区到两个表里，每个表各占50%数据
insert overwrite table tmp_train.tyh_test_t1 partition(partition_date='2019-07-10')
select 
showid,
flag,
ismale,
age,
refundcount,
refundmoney,
settlementcount,
skusalesprice,
skumaxcost,
purchasecount
from tmp_train.tyh_test32_raw
where rand()<=0.5

insert overwrite table tmp_train.tyh_test_t1 partition(partition_date='2019-07-11')
select 
showid,
flag,
ismale,
age,
refundcount,
refundmoney,
settlementcount,
skusalesprice,
skumaxcost,
purchasecount
from tmp_train.tyh_test32_raw
where rand()<=0.5

-- ③ 查询
create table tyh_test_t_time_1 as 
select *
from tmp_train.tyh_test_t1
where partition_date='2019-07-11'

---实验组2：分桶表
-- ① 建表
create table if not exists tmp_train.tyh_test_t2
(
    showid string comment '曝光id',
	flag int comment '标签，1是正例，0是负例',
    ismale int comment '创单用户是男性，isMale=1，否则isMale=0',
    age int comment '创单用户年龄',
    refundcount int comment '用户历史退票次数',
    refundmoney float comment '用户历史退票损失金额',
    settlementcount int comment '用户历史理赔次数',
	skusalesprice float comment 'item售价',
    skumaxcost int comment '最大的赔率,即曝光的赔率',
    purchasecount int comment '用户历史购买退改无忧的次数 '
)comment '实验组2'
partitioned by (partition_date string comment'日期')
clustered by (age) into 10 buckets
location '/data/train/tmp_train/tyh_test_t2'

-- ② 导入数据
insert overwrite table tmp_train.tyh_test_t2 partition (partition_date='2019-07-11')
select 
showid,
flag,
ismale,
age,
refundcount,
refundmoney,
settlementcount,
skusalesprice,
skumaxcost,
purchasecount
from tmp_train.tyh_test32_raw

-- ③ 查询
create table tyh_test_t_time_2 as 
select *
from tmp_train.tyh_test_t2
where partition_date='2019-07-11'
and age>=30 and age<=50

---实验组3：orcfile
-- ① 建表
create table if not exists tmp_train.tyh_test_t3
(
    showid string comment '曝光id',
	flag int comment '标签，1是正例，0是负例',
    ismale int comment '创单用户是男性，isMale=1，否则isMale=0',
    age int comment '创单用户年龄',
    refundcount int comment '用户历史退票次数',
    refundmoney float comment '用户历史退票损失金额',
    settlementcount int comment '用户历史理赔次数',
	skusalesprice float comment 'item售价',
    skumaxcost int comment '最大的赔率,即曝光的赔率',
    purchasecount int comment '用户历史购买退改无忧的次数 '
)comment '实验组2'
stored as orcfile
location '/data/train/tmp_train/tyh_test_t3'

-- ② 导入数据
insert overwrite table tmp_train.tyh_test_t3
select 
showid,
flag,
ismale,
age,
refundcount,
refundmoney,
settlementcount,
skusalesprice,
skumaxcost,
purchasecount
from tmp_train.tyh_test32_raw


-- ③ 查询
create table tyh_test_t_time_3 as 
select *
from tmp_train.tyh_test_t3