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
 
## [模板](../测试/jupyter模板.ipynb)

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


## Reference
- [jupyter部署指南](https://blog.csdn.net/weixin_41079550/article/details/89199254)
- [只需15分钟，使用谷歌云平台运行Jupyter Notebook](https://blog.csdn.net/Uwr44UOuQcNsUQb60zk2/article/details/78610044)
- [google云平台的使用](https://blog.csdn.net/golduty2/article/details/82151407)
- [Jupyter notebook快速入门教程](https://cloud.tencent.com/developer/news/208412)
- [Jupyter Notebook Quickstart](https://jupyter.readthedocs.io/en/latest/content-quickstart.html)
- [magic关键字](https://www.jianshu.com/p/97fd13a71d93)
- [jupyter notebook导出包含中文的PDF并正常显示pandas表格](https://www.jianshu.com/p/e97946777866)

