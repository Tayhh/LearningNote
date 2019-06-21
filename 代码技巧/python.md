# python好用的技巧
## [参数](./python.md)
 - 一个\*号代表将**多个**参数转换为一个**对象**：tuple类型，可以进行tuple操作
 - 两个\*号代表将**多个**参数转换为一个**对象**：dict类型，可以进行dict操作
 - 1和2同时出现时最好用**key-value**形式说明放入dict对象的参数，如
 ```
 def foo(a, b=10, *args, **kwargs):
    print (a)
    print (b)
    print (args)
    print (kwargs)
foo(1, 2, 3, 4, e=5, f=6, g=7)
 ```
 ![输出结果](../图片/参数.png)
## [debug](./python.md)
 - **debug是很好的源码阅读助手，通过设置断点可以更快的了解代码的功能**
 - 花10分钟阅读、实践下[Pycharm中debug](https://www.ibm.com/developerworks/cn/linux/l-cn-pythondebugger/index.html)
## [生成器](./python.md)
 - 由关键字***yeild**标识
 - 一个比较好的理解是，可以把它看做是**return**
 - 注意它会导致程序产生“断点”，如果yeild 后面是赋值语句，**注意赋值是在“断点”后才赋值的**(https://blog.csdn.net/qq_36330643/article/details/78247070)
 - 最大的好处就是**避免内存浪费**，如读文件的时候，如果文件很大，通常会内存溢出，但是yeild可以优雅的解决
 ```
 ```

 
