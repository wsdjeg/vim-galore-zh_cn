## 命令

下面的命令都比较有用，最好了解一下。用 `:h :<command name>` 来了解更多关于它们的信息，如：`:h :global`。


### :global 和 :vglobal

在所有符合条件的行上执行某个命令。如： `:global /regexp/ print` 会在所有包含 "regexp" 的行上执行 `print` 命令（译者注：regexp 有正则表达式的意思，该命令同样支持正则表达式，在所有符合正则表达式的行上执行指定的命令）。

趣闻：你们可能都知道老牌的 grep 命令，一个由 Ken Thompson 编写的过滤程序。它是干什么用的呢？它会输出所有符合指定正则表达式的行！现在猜一下 `:global /regexp/ print` 的简写形式是什么？没错！就是 `:g/re/p` 。 Ken Thompsom 在编写 grep 程序的时候是受了 vi `:global` 的启发。（译者注： https://robots.thoughtbot.com/how-grep-got-its-name）

它的名字是 `:global`，理应仅作用在所有行上，但是它也是可以带范围限制的。假设你想使用 `:delete` 命令删除从当前行到下一个空行（由正则表达式 `^$` 匹配）范围内所有包含 "foo" 的行：

```vim
:,/^$/g/foo/d
```

如果要在所有 _不_ 匹配的行上执行命令的话，可以使用 `:global!` 或是它的别名 `:vglobal` （ V 代表的是 inVerse ）。



### :normal 和 :execute

这两个命令经常在 Vim 的脚本里使用。

`:normal` 用于使用命令行进行普通模式的映射。如：`:normal! 4j` 会令光标下移4行（由于加了"!"，所以不会使用自定义的映射 "j"）。

需要注意的是 `:normal` 同样支持数量，故 `:%norm! Iabc` 会在所有行前加上 "abc"。

借助于 `:execute` 可以将命令和表达式混合在一起使用。假设你正在编辑一个 C 语言的文件，想切换到它的头文件：

```vim
:execute 'edit' fnamemodify(expand('%'), ':r') . '.h'
```

（译者注：头文件为与与源文件同名但是扩展名为 `.h` 的文件。上面的命令中 expand 获得当前文件的名称，fnamemodify 获取不带扩展名的文件名，再连上 '.h' 就是头文件的文件名了，最后在使用 edit 命令打开这个头文件。）

这两个命令经常一起使用。假设你想让光标下移 N 行：

```vim
:let n = 4
:execute 'normal!' n . 'j'
```


### :redir

许多命令都会输出消息，`:redir` 可以重定向这些输出。可以输出到文件、[寄存器](#register)中或是某个变量中。

```vim
:redir => neatvar
:reg
:redir END
:echo neatvar
:" 为了有趣，我们把它输出到当前缓冲区
:put =neatvar
```

（译者注：原文最后一条命令是 `:put =nicevar` 但是实际会变量未定义的错误）

帮助文档：`:h :redir`
