## 语法文件调试

语法文件由于包含错误的或者复制的正则表达式，常常会使得Vim的运行较慢。如果Vim在编译的时候包含了`+profile` [feature](#what-kind-of-vim-am-i-running)特性，就可以给用户提供一个超级好用的`:syntime`命令。

```vim
:syntime on
" 多次敲击<c-l>来重绘窗口，这样的话就会使得相应的语法规则被重新应用一次
:syntime off
:syntime report
```
输出结果包含了很多的度量维度。比如，你可以通过结果知道哪些正则表达式耗时太久需要被优化；哪些正则表达式一直在别使用但重来没有一次成功匹配。

请查阅`:h :syntime`。


