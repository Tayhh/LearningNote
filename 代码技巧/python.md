# python代码技巧总结
- [参数](./python.md)
 1. 一个\*号代表将**多个**参数转换为一个**对象**：tuple类型，可以进行tuple操作
 2. 两个\*号代表将**多个**参数转换为一个**对象**：dict类型，可以进行dict操作
 3. 1和2同时出现时最好用key-value形式说明放入dict对象的参数，如
 '''
 def foo(a, b=10, *args, **kwargs):
    print (a)
    print (b)
    print (args)
    print (kwargs)
foo(1, 2, 3, 4, e=5, f=6, g=7)
 '''

