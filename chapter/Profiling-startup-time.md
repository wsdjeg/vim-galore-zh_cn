### 查看启动时间

感觉Vim启动的慢？到了研究几个数字的时候了：

```vim
vim --startuptime /tmp/startup.log +q && vim /tmp/startup.log
```

第一栏是最重要的因为它显示了**绝对运行时间**，如果在前后两行之间时间差有很大的跳跃，那么是第二个文件太大或者含有需要检查的错误的VimL代码。

