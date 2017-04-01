## 常见问题

### 编辑小文件时很慢

有两个因素对性能影响非常大：

1. 过于复杂的 **正则表达式** 。尤其是 Ruby 的语法文件，以前会造成性能下降。（见[调试语法文件](#debugging-syntax-files)）

2. **屏幕重绘** 。有一些功能会强制重绘所有行。

| 典型肇事者 | 原因 | 解决方案 |
|--------|--------|-----------|
| `:set cursorline` | 会导致所有行重绘 |  `:set nocursorline` |
| `:set cursorcolumn` | 会导致所有行重绘 | `:set nocursorcolumn` |
| `:set relativenumber` | 会导致所有行重绘 | `:set norelativenumber` |
| `:set foldmethod=syntax` | 如果语法文件已经很慢了，这只会变得更慢 | `:set foldmethod=manual`，`:set foldmethod=marker` 或者使用[快速折叠](https://github.com/Konfekt/FastFold)插件 |
| `:set synmaxcol=3000` | 由于内部表示法，Vim 处理比较长的行时会有问题。让它高亮到 3000 列…… | `:set synmaxcol=200` |
| matchparen.vim | Vim 默认加载的插件，用正则表达式查找配对的括号 | 禁用插件：`:h matchparen` |


**注意**：只有在你真正遇到性能问题的时候才需要做上面的调整。在大多数情况下使用上面提到的选项是完全没有问题的。


### 编辑大文件的时候很慢

Vim 处理大文件最大的问题就是它会一次性读取整个文件。这么做是由于缓冲区的内部机理导致的（在 [vim_dev](https://groups.google.com/forum/#!topic/vim_dev/oY3i8rqYGD4/discussion) 中讨论）。

如果只是想查看的话，`tail hugefile | vim -` 是一个不错的选择。

如果你能接受没有语法高亮，并且禁用所有插件和设置的话，使用：

```sh
$ vim -u NONE -N
```

这将会使得跳转变快很多，尤其是省去了基于很耗费资源的正则表达式的语法高亮。你还可以告诉 Vim 不要使用交换文件和 viminfo 文件，以避免由于写这些文件而造成的延时：

```sh
$ vim -n -u NONE -i NONE -N
```

简而言之，尽量避免使用 Vim 写过大的文件。



### 持续粘贴（为什么我每次都要设置 'paste' 模式）

持续粘贴模式让终端模拟器可以区分输入内容与粘贴内容。

你有没有遇到过往 Vim 里粘贴代码之后被搞的一团糟？

这在你使用 `cmd+v`、`shirt-insert`、`middle-click` 等进行粘贴的时候才会发生。因为那样的话你只是向终端模拟器扔了一大堆的文本。 Vim 并不知道你刚刚是粘贴的文本，它以为你在飞速的输入。于是它想缩进这些行但是失败了。

这明显不是个问题，如果你用 Vim 的寄存器粘贴，如：`"+p` ，这时 Vim 就知道了你在粘贴，就不会导致格式错乱了。

使用 `:set paste` 就可以解决这个问题正常进行粘贴。见 `:h 'paste'` 和 `:h 'pastetoggle'` 获取更多信息。

如果你受够了每次都要设置 `'paste'` 的话，看看这个能帮你自动设置的插件：[bracketed-paste](https://github.com/ConradIrwin/vim-bracketed-paste)。

[点此](http://cirw.in/blog/bracketed-paste)查看该作者对于这个插件的更多描述。

Neovim 尝试把这些变得更顺畅，如果终端支持的话，它会自动开启持续粘贴模式，无须再手动进行切换。


### 在终端中按 ESC 后有延时

如果你经常使用命令行，那么肯定要接触_终端模拟器_，如 xterm、gnome-terminal、iTerm2 等等（与实际的[终端](https://en.wikipedia.org/wiki/Computer_terminal)不同）。

终端模拟器与他们的祖辈一样，使用 [转义序列](https://zh.wikipedia.org/wiki/%E8%BD%AC%E4%B9%89%E5%BA%8F%E5%88%97) （也叫_控制序列_）来控制光标移动、改变文本颜色等。转义序列就是以转义字符开头的 ASCII 字符串（用[脱字符表示法](https://zh.wikipedia.org/wiki/%E8%84%B1%E5%AD%97%E7%AC%A6%E8%A1%A8%E7%A4%BA%E6%B3%95)表示成 `^[` ）。当遇到这样的字符串后，终端模拟器会从[终端信息](https://en.wikipedia.org/wiki/Terminfo)数据库中查找对应的动作。

为了使用问题更加清晰，我会先来解释一下什么是映射超时。在映射存在歧义的时候就会产生映射超时：

```vim
:nnoremap ,a :echo 'foo'<cr>
:nnoremap ,ab :echo 'bar'<cr>
```

上面的例子中两个映射都能正常工作，但是当输入 `,a` 之后，Vim 会延时1秒，因为它要确认用户是否还要输入那个 `b`。

转义序列会产生同样的问题：

* `<esc>` 作为返回普通模式或取消某个动作的按键而被大量使用
* 光标键使用转义序列进行的编码
* Vim 期望 <kbd>Alt</kbd> （也叫作 _Mate Key_）会发送一个正确的 8-bit 编码的高位，但是许多终端模拟器并不支持这个（也可能默认没有启用），而只是发送一个转义序列作为代替。

你可以这样测试上面所提到的事情： `vim -u NONE -N` 然后输入 `i<c-v><left>` ，你会看到一个以 `^[` 开头的字符串，表明这是一个转义序列，`^[` 就是转义字符。

简而言之，Vim 在区分录入的 `<esc>` 和转义序列的时候需要一定的时间。

默认情况下，Vim 用 `:set timeout timeoutlen=1000`，就是说它会用 1 秒的时间来区分有歧义的映射 _以及_ 按键编码。这对于映射来说是一个比较合理的值，但是你可以自行定义按键延时的长短，这是解决该问题最根本的办法：

```vim
set timeout           " for mappings
set timeoutlen=1000   " default value
set ttimeout          " for key codes
set ttimeoutlen=10    " unnoticeable small value
```

在 `:h ttimeout` 里你可以找到一个关于这些选项之间关系的小表格。

而如果你在 tmux 中使用 Vim 的话，别忘了把下面的配置加入到你的 `~/.tmux.conf`文件中：

```
set -sg escape-time 0
```


### 无法重复函数中执行的搜索

* 在命令中的搜索（`/`、`:substitute` 等）内容会改变“上次使用的搜索内容”。（它保存在`/`寄存器中，用 `:echo @/` 可以输出它里面的内容）
* 简单的文本变化可以通过 `.` 重做。（它保存在 `.` 寄存器，用 `:echo @.` 可以输出它的内容）

而在你在函数中进行这些操作的时候，一切就会变得不同。因此你不能用 N/n 查找某个函数刚刚查找的内容，也不能重做函数中对文本的修改。

帮助文档：`:h function-search-undo`。

