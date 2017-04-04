### debug等级

Vim现在正在使用的另一个比较有用的方法是增加debug信息输出详细等级。现在Vim支持9个等级，可以用```:h 'verbose'```命令查看。

```vim
:e /tmp/foo
:set verbose=2
:w
:set verbose=0
```

这可以显示出所有引用的文件、没有变化的文件或者各种各样的作用于保存的插件。

如果你只是想用简单的命令来提高等级，也是用 ```:verbose``` ，放在其他命令之前，通过计数来指明等级，默认是1.

```vim
:verb set verbose
"  verbose=1
:10verb set verbose
"  verbose=10
```

通常用等级1来显示上次从哪里设置的选项

```vim
:verb set ai?
"      Last set from ~/.vim/vimrc
```

一般等级越高输出信息月详细。但是不要害怕，亦可以把输出导入到文件中：

```vim
:set verbosefile=/tmp/foo | 15verbose echo "foo" | vsplit /tmp/foo
```

你可以一开始的时候就打开verbosity，用 ```-V``` 选项，它默认设置调试等级为10。 ```vim -V5```