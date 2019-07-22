jupyter
===

Index
---
- [定位](#定位)
- [语法支持](#语法支持)
- [架构](#架构)
- [模板](#模板)
- [快捷键](#快捷键)
- [magic关键字python](#magic关键字python)
- [生成目录](#生成目录)
- [进阶版工具jupyterlab](#进阶版工具jupyterlab)
- [Reference](#Reference)

## 定位
交互式笔记本,可将代码、文字、图表完美结合起来，输出分析报告<br/>
创建和共享程序文档的web应用程序

## 语法支持
- markdown
- latex公式
- html/R/Python等40多种编程语言<br/>

## 架构
![示例](../图片/jupyter架构.png)


## 安装方式
- 本地部署
  - pip
  - anaconda
- [远程部署](https://blog.csdn.net/weixin_41079550/article/details/89199254)
 
## 模板
- numpy：矩阵运算，N维数组对象ndarray
  - 数组属性<br/>
  维度的数量：ndarray.ndim<br/>
  数组的维度：ndarray.shape<br/>
  数组元素的大小：ndarray.size
  - 创建数组
  ```
  numpy.array(shape, dtype = float, order = 'C')
  np.asarray() # 从已有数组创建数组
  np.zeros()
  np.ones()
  np.empty()
  np.arrange() # 生成等差数列
  np.linspace() # 生成等差数列
  np.frombuffer() # 从数据流中生成
  np.fromiter() # 从迭代对象中生成
  ```
  - 索引
  ```
  A[2] # 整数索引
  A[2,1:3] # 数组索引
  A[~np.isnan(A)] # 布尔索引
  ```
  - 数组操作
  ```
  ## 迭代数组
  np.nditer(A)
  ## 修改数组形状
  np.reshape()  # 对数组的形状重构
  np.ravel() # 展开的数组元素，是原数组的视图
  np.transpose() # 对换数组维度
  ## 连接数组
  np.concatenate(a,b, axis=0) # 沿轴0连接两个数组
  ## 分割数组
  np.split(a,3，axis=0) # 将数组沿着轴0分割为3个大小相等的子数组
  ## 数组元素的添加与删除
  np.append() # 沿轴axis尾部添加相同维度的数组
  np.insert() # 沿轴axis在指定索引前加入元素
  np.delete() # 沿轴axis在删除制定索引元素
  np.unique() # 数组去重
  ```
  -  函数(数学、统计、排序/条件删选)
  ```
  np.sin/cos/tan() # 三角函数
  np.ceil/floor/round() # 取整函数
  np.add/subtract/multiply/divide/power/mod/reciprocal/diff() # 对应元素的算数运算函数
  np.min/argmin/max/argmax/sum/cumsum/ptp/percentile/median/mean/average/std/var() # 统计函数
  np.sort/argsort/lexsort/sort_complex/partiton/() # 排序函数
  np.nonzero/where/extract/clip() # 条件筛选函数  
  ```
  - 矩阵库 np.matlib
  ```
  np.matlib.empty/zeros/ones/eye/identify/rand(shape,dtype,order)
  ```
  - = 号赋值与copy赋值<br/>
  = 号赋值:数组间有关联性<br/>
  copy赋值:数组间无关联性
  - 线性代数 np.linalg库
  ```
  np.linalg.det() # 计算矩阵的行列式
  np.linalg.solve() # 线性方程求解
  np.linalg.inv() # 求矩阵的逆矩阵
  np.linalg.eigvals() # 求矩阵的特征值
  np.linalg.eig() # 求矩阵的特征向量
  np.linalg.svd() # 对矩阵进行奇异值分解
  np.linalg.norm() # 矩阵或向量的范数
  ```
  - numpy IO
    - 二进制文件<br/>
    np.save/savez()<br/>
    np.load()
    - 文本文件<br/>
    np.savetxt()<br/>
    np.loadtxt()  
- numpy matplotlib:python会图库
  - 模板<br/>
  ```
  import numpy as np
  from matplotlib import pyplot as plt
  x = np.arange(1,11)
  y = 2*x+5
  ## 基于nummpy画图
  plt.plot/bar/hist(x,y) # plot:曲线图，bar:条形图，用于离散值的可视化，hist:直方图，用于连续值分区间统计
  ## 基于pandas中的dataframe画图
  df[column_name].plot()
  plt.title()
  plt.xlabel()
  plt.ylabel()
  plt.show()
  ```
  - 中文显示<br/>
  ```
  zhfont1 = matplotlib.font_manager.FontProperties(fname)
  plt.xlabel(,fonproperties)
  ```
  - 标记和颜色
  - subplot
  ```
  plt.subplot(2,1,1)
  plt.subplot(2,1,2)
  ```  
- pandas：numpy的升级版本,数据分析库
  - 与numpy的区别<br/>
  更强大的输入输出机制，如支持xls,csv,hdf,xml,html<br/>
  处理更多的数据类型<br/>
  可以转换数据类型<br/>
  核心就像操作一个电子表格<br/>
  - 数据结构
    - series
    ```
    import pandas as pd
    pd.Series(a, index) # 只有行索引
    ```
    - dataframe：series的集合
    ```
    pd.DataFrame(a, index=dates, columns=['a','b','c','d']) # 有行索引和列索引
    ```
    - 算数操作：根据index匹配后，对应元素进行算数操作
  - dataframe 基础
    - 增加列/删除行、列
    ```
    df['add']= pd.Series(data, index)
    df.drop(index/columns, axis)
    ```
    - 查找元素
    ```
    df.loc[index list, columns list] # 按索引、列名查找数据
    df.iloc[index list, columns list] # 按行号、列号查找数据
    df[condition_1 &/| condition_2] # 条件筛选
    df.loc[index_1].loc[index_2] # 多级索引查找元素
    df.xs(22, level='Num') # 多级索引里单维度查找元素，如查找所有levels中 Num=22的行
    ```
    - 索引
    ```
    df.set_index(index_column_name) # 设置index
    pd.MultiIndex.from_tuples/arrays # 多级索引，从元组或数组创建
    ```
    - 删除或填充空值
    ```
    df.dropna(data, axis)
    df.fillna(fill_data_string)
    ```
    - 分组求统计数值
    ```
    df.groupby(group_by_column).mean/std/sum/median/count() 
    df.groupby(group_by_column).describe() # 可以输出所有统计性描述信息
    ```
    - 组合数据框 
    堆叠concat与附加append与归并merge与连接join
    ```
    pd.concat([df1, df2, df3], axis) # 堆叠,df索引按书按需叠加
    df.append(df2) # 按行堆叠
    pd.merge(left_df, right_df, merge_how, on_key) # merge 类似于sql 中的join
    left.join(right, join_how) # 按行索引进行连接
    
    ```
    - 查找不重复的值
    ```
    df.unique()
    df.nunique()
    df.value_counts()
    ```
    - apply方法:将自定义函数应用对dataframe上
    ```
    df[column_name].apply(udf)
    df[column_name].apply(lambda function)
    ```
    - 排序
    ```
    df.sort_values(sort_column_name)
    ```
    - 空值
    ```
    df.isnull()
    ```
    - 透视表
    ```
    df.pivot_table(values=, index=, columns=)    
    ```
    - 导入导出数据：excel/csv/sql数据库库/html文件
    ```
    ## csv
    pd.read_csv()
    df.to_csv()
    ## excel
    pd.read_excel()
    df.to_excel()
    ## 
    pd.read_html()
    pd.to_html()
    ```
    
    
    
    
    


- sklearn：

## 快捷键
![示例](../图片/jupyter快捷键.png)

## magic关键字python
- 功能
控制notebook本身或执行系统调用
- 关键字分类
  - 行magic命令（一个百分号%）：仅应用于编写magic命令时所在的行
  - 单元格magic命令（两个百分号%%）：应用与整个单元格
- 常用magic关键字
  - 代码计时：%timeit/%%timeit
  - 在notebook中嵌入可视化内容:%matplotlib inline
  - 在notebook中调试代码：%pdb
  - 运行.py文件：%run filename.py
  

## 生成目录
![示例](../图片/jupyter生成目录1.png)<br/>
![示例](../图片/jupyter生成目录2.png)

## [进阶版工具jupyterlab](https://www.jianshu.com/p/90982d195160)

## Reference
- [jupyter部署指南](https://blog.csdn.net/weixin_41079550/article/details/89199254)
- [只需15分钟，使用谷歌云平台运行Jupyter Notebook](https://blog.csdn.net/Uwr44UOuQcNsUQb60zk2/article/details/78610044)
- [google云平台的使用](https://blog.csdn.net/golduty2/article/details/82151407)
- [Jupyter notebook快速入门教程](https://cloud.tencent.com/developer/news/208412)
- [Jupyter Notebook Quickstart](https://jupyter.readthedocs.io/en/latest/content-quickstart.html)
- [magic关键字](https://www.jianshu.com/p/97fd13a71d93)
- [jupyter notebook导出包含中文的PDF并正常显示pandas表格](https://www.jianshu.com/p/e97946777866)
- [python数据分析及处理案例技巧11-20（基于jupyter）](https://blog.csdn.net/pbgc396dwxjb77f2je/article/details/78786978)
- [python数据分析及处理案例技巧1-10（基于jupyter）](https://blog.csdn.net/PbGc396Dwxjb77F2je/article/details/78786979)
- [Jupyter Notebook 添加目录插件](https://www.jianshu.com/p/7687c6bec65e)
- [numpy教程](https://www.runoob.com/numpy/numpy-terating-over-array.html)
- [Python 数据科学入门教程：Pandas](https://www.jianshu.com/p/d9774cf1fea5)
- [最全面的Pandas的教程！没有之一!](https://cloud.tencent.com/developer/article/1419056)

