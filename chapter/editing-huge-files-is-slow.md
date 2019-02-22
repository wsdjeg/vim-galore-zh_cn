## 编辑大文件很慢

大文件最大的问题，就是 Vim 会一次性读取整个文件。这一过程的完成取决于内部如何提供缓存空间。
([Vim 开发的讨论](https://groups.google.com/forum/#!topic/vim_dev/oY3i8rqYGD4/discussion))

如果你只是想读取， `tail hugefile | vim -` 会是一个很好的解决方法.

如果不用语法，设定和插件，你也能生活自理一段时间:

```
$ vim -u NONE -N
```

这将使得导航明显提速，因为代价高昂的语法高亮正则表达式不再被使用。你也应该让 Vim 不要使用交换文件和 Vim 信息文件，以避免写入时的长延迟。

```
$ vim -n -u NONE -i NONE -N
```

简而言之，真的写入超大文件的时候尽量别用 Vim。 :\
