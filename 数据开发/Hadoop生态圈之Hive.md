Hadoop生态圈之Hive
===

Index
---
- [定位](#定位)
- [数据存储](#数据存储)
- [计算模型](#计算模型)
- [执行语句](#执行语句)
- [Reference](#Reference)

## 定位
基于Hadoop的一个**数据仓库工具**，可以用来进行数据提取转化加载ETL<br/>
将(1)HDFS上结构化的数据文件映射为一张数据表，(2)写sql语句实现查询，(3)后台将sql语句转换成MapReduce任务运行<br>

## 数据存储
存储数据的系统是**HDFS**(Hadoop中的分布式文件系统)<br/>
- Hive 与 HDFS 文件系统的关联<br/>
![示例图](../图片/Hive与HDFS的关联.png)
  
## 计算模型<br/>
使用的计算模型是**MapReduce**(Hadoop中的组件)

## 执行语句<br/>
HQL(类sql语句)<br/>
操作模板<br/>


## Reference
- [Hive基础入门](https://zhuanlan.zhihu.com/p/51210324)
- [一脸懵逼学习Hive的使用以及常用语法（Hive语法即Hql语法）](https://cloud.tencent.com/developer/article/1010869)
