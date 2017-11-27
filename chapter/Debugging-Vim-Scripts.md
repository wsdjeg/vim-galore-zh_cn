## Vim脚本调试

如果你以前使用过命令行调试器的话，对于`:debug`命令你很快就会感到熟悉。

只需要在任何其他命令之前加上`:debug`就会让你进入调试模式。也就是，被调试的Vim脚本会在第一行停止运行，同时该行会被显示出来。

想了解可用的6个调试命令，可以查阅`:h >cont`和阅读下面内容。需要指出的是，类似gdb和其他相似调试器，调试命令可以使用它们的简短形式：`c`、 `q`、`n`、`s`、 `i`和 `f`。

除了上面的之外，你还可以自由地使用任何Vim的命令。比如，`:echo myvar`，该命令会在当前的脚本代码位置和上下文上被执行。

只需要简单使用`:debug 1`，你就获得了[REPL](https://en.wikipedia.org/wiki/Read%E2%80%93eval%E2%80%93print_loop)调试特性。

当然，调试模式下是可以定义断点的，不然的话每一行都去单步调试就会十分痛苦。（断点之所以被叫做断点，是因为运行到它们的时候，运行就会停止下来。因此，你可以利用断点跳过自己不感兴趣的代码区域）。请查阅`:h :breakadd`、 `:h :breakdel`和 `:h :breaklist`获取更多细节。

假设你需要知道你每次在保存一个文件的时候有哪些代码在运行：

```vim
:au BufWritePost
" signify  BufWritePost
"     *         call sy#start()
:breakadd func *start
:w
" Breakpoint in "sy#start" line 1
" Entering Debug mode.  Type "cont" to continue.
" function sy#start
" line 1: if g:signify_locked
>s
" function sy#start
" line 3: endif
>
" function sy#start
" line 5: let sy_path = resolve(expand('%:p'))
>q
:breakdel *
```

正如你所见，使用`<cr>`命令会重复之前的调试命令，也就是在该例子中的`s`命令。

`:debug`命令可以和[verbose](#verbosity)选项一起使用。

