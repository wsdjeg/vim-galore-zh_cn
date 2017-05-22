### 运行时检测

需要的特性：+profile

Vim 提供了一个内置的运行时检查功能，能够找出运行慢的代码。

```:profile``` 命令后面跟着子命令来确定要查看什么。

如果你想查看所有的：

```Vim
:profile start /tmp/profile.log
:profile file *
:profile func *
<do something in Vim>
<quit Vim>
```

Vim 不断地在内存中检查信息，只在退出的时候输出出来。（Neovim 已经解决了这个问题用 ```:profile dump``` 命令）

看一下 ```/tmp/profile.log``` 文件，检查时运行的所有代码都会被显示出来，包括每一行代码运行的频率和时间。

大多数代码都是用户不熟悉的插件代码，如果你是在解决一个确切的问题，直接跳到这个日志文件的末尾，那里有 ```FUNCTIONS SORTED ON TOTAL TIME``` 和 ```FUNCTIONS SORTED ON SELF TIME``` 两个部分，如果某个function运行时间过长一眼就可以看到。