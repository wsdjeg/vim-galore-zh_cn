## 用法

### 获取离线帮助

Vim 自带了一套很完善的帮助文档，它们是一个个有固定排版格式的文本文件，通过标签可以访问这些文件的特定位置。

在开始之前先读一下这个章节：`:help :help`。执行这个命令以后会在新窗口打开 `$VIMRUNTIME/doc/helphelp.txt` 文件并跳转到这个文件中 `:help` 标签的位置。

一些关于帮助主题的简单规则：

* 用单引号把文本包起来表示选项，如：`:h 'textwidth'`
* 以小括号结尾表示 VimL 函数，如：`:h reverse()`
* 以英文冒号开头表示命令，如：`:h :echo`

使用快捷键 `<c-d>` （这是 <kbd>ctrl</kbd>+<kbd>d</kbd>）来列出所有包含你当前输入的内容的帮助主题。如：`:h tab<c-d>` 会列出所有包含 `tab` 主题，从 `softtabstop` 到 `setting-guitablabel` （译者注：根据安装的插件不同列出的选项也会不同）。

你想查看所有的 VimL 方法吗？很简单，只要输入：`:h ()<c-d>` 就可以了。你想查看所有与窗口相关的函数吗？输入 `:h win*()<c-d>`。

相信你很快就能掌握这些技巧，但是在刚开始的时候，你可能对于该通过什么进行查找一点线索都没有。这时你可以想象一些与要查找的内容相关的关键字，再让 `:helpgrep` 来帮忙。

```vim
:helpgrep backwards
```

上面的命令会在所有的帮助文件中搜索“backwards”，然后跳转到第一个匹配的位置。所有的匹配位置都会被添加到全局位置信息表，用 `:cp / :cn` 可以在匹配位置之间进行切换。或者用 `:copen` 命令来打开全局位置信息表，将光标定位到你想要的位置，再按 回车就可以跳转到该匹配项。详细说明请参考 `:h quickfix`。


### 获取离线帮助（补充）

这个列表最初发表在 [vim_dev](https://groups.google.com/forum/#!forum/vim_dev)，由 @chrisbra 编辑的，他是 Vim 开发人员中最活跃的一个。

经过一些微小的改动后，重新发布到了这里。

---

如果你知道你想要找什么，使用帮助系统的搜索会更简单一些，因为搜索出的主题都带有固定的格式。

而且帮助系统中的主题包含了你当前使用的 Vim 版本的所特有特性，而网上那些已经过时或者是早期发布的话题是不会包含这些的。

因此学习使用帮助系统以及它所用的语言是很有必要的。这里是一些例子（不一定全，我有可能忘了一些什么）。

（译者注：下面列表中提及的都是如何指定搜索主题以便快速准确的找到你想要的帮助）

1. 选项要用单引号引起来。用 `:h 'list'` 来查看列表选项帮助。只有你明确的知道你要找这么一个选项的时候才可以这么做，不然的话你可以用 `:h options.txt` 来打开所有选项的帮助页面，再用正则表达式进行搜索，如：`/width`。某些选项有它们自己的命名空间，如：`:h cpo-a`，`:h cpo-A`， `:h cpo-b` 等等。

2. 普通模式的命令不能用冒号作为前缀。使用 `:h gt` 来转到“gt”命令的帮助页面。

3. 正则表达式以“/”开头，所以 `:h /\+` 会带你到正则表达式中量词“+”的帮助页面。

4. 组合键经常以一个字母开头表示它们可以在哪些模式中使用。如：`:h i_CTRL-X` 会带你到插入模式下的 CTRL-X 命令的用法帮助页面，这是一个自动完成类的组合键。需要注意的是某些键是有固定写法的，如Control键写成CTRL。还有，查找普通模式下的组合键帮助时，可以省略开头的字母“n”，如：`:h CTRL-A`。而 `:h c_CTRL-A`（译者注：原文为 `:h c_CRTL-R`，感觉改为 A 更符合上下文语境）会解释 CTRL-A 在命令模式下输入命令时的作用；`:h v_CTRL-A` 说的是在可见模式下把光标所在处的数字加 1；`:h g_CTRL-A` 则说的是 g 命令（你需要先按 "g" 的命令）。这里的 "g" 代表一个普通的命令，这个命令总是与其它的按键组合使用才生效，与 "z" 开始的命令相似。

5. 寄存器是以 "quote" 开头的。如：`:h quote:` （译者注：原文为`:h quote`，感觉作者想以":"来举例）来查看关于":"寄存器的说明。

6. 关于 Vim 脚本（VimL）的帮助都在 `:h eval.txt` 里。而某些方面的语言可以使用 `:h expr-X` 获取帮助，其中的 'X' 是一个特定的字符，如：`:h expr-!` 会跳转到描述 VimL 中'!'（非）的章节。另外一个重要提示，可以使用 `:h function-list` 来查看所有函数的简要描述，列表中包括函数名和一句话描述。

7. 关于映射都可以在 `:h map.txt` 中找到。通过 `:h mapmode-i` 来查找 `:imap` 命令的相关信息；通过 `:h map-topic` 来查找专门针对映射的帮助（译者注：topic 为一个占位符，正如上面的字符 'X' 一样，在实际使用中需要替换成相应的单词）（如：`:h :map-local` 查询本地buffer的映射，`:h map-bar` 查询如何在映射中处理'|')。

8. 命令定义用 "command-" 开头，如用 `:h command-bar` 来查看自定义命令中'!'的作用。

9. 窗口管理类的命令是以 "CTRL-W" 开头的，所以你可以用 `:h CTRL-W_*` 来查找相应的帮助（译者注：'*'同样为占位符）（如：`:h CTRL-W_p` 查看切换到之前访问的窗口命令的解释）。如果你想找窗口处理的命令，还可以通过访问 `:h windows.txt` 并逐行向下浏览，所有窗口管理的命令都在这里了。

10. 执行类的命令以":"开头，即：`:h :s` 讲的是 ":s" 命令。

11. 在输入某个话题时按 CTRL-D，让 Vim 列出所有的近似项辅助你输入。

12. 用 `:helpgrep` 在所有的帮助页面（通常还包括了已安装的插件的帮助页面）中进行搜索。参考 `:h :helpgrep` 来了解如何使用。当你搜索了一个话题之后，所有的匹配结果都被保存到了全局位置信息表（或局部位置信息表）当中，可以通过 `:copen` 或 `:lopen` 打开。在打开的窗口中可能通过 `/` 对搜索结果进行进一步的过滤。

13. `:h helphelp` 里介绍了如何使用帮助系统。

14. 用户手册。它采用了一种对初学者更加友好的方式来展示帮助话题。用 `:h usr_toc.txt` 打开目录（你可能已经猜到这个命令的用处了）。浏览用户手册能帮助你找出某些你想了解的话题，如你可以在第24章看到关于“复合字符”以及“输入特殊字符”的讲解（用 `:h usr_24.txt` 可以快速打开相关章节）。

15. 高亮分组的帮助以 `hl-` 开头。如：`:h hl-WarningMsg` 说的是警告信息分组的高亮。

16. 语法高亮以`:syc-` 开头，如：`:h :syn-conceal` 讲的是 `:syn` 命令的对于隐藏字符是如何显示的。

17. 快速修复命令以 `:c` 开头，而位置列表命令以 `:l` 开头。

18. `:h BufWinLeave` 讲的是 BufWinLeave 自动命令。还有，`:h autocommand-events` （译者注：原文是 `:h autocommands-events`，但是没有该帮助）讲的是所有可用的事件。

19. 启动参数都以“-”开头，如：`:h -f` 会告诉你 Vim 中 “-f” 参数的作用。

20. 额外的特性都以“+”开头，如：`:h +conceal` 讲的是关于隐藏字符的支持。

21. 错误代码可以在帮助系统中直接查到。`:h E297` 会带你到关于这一错误的详细解释。但是有时并没有转到错误描述，而是列出了经常导出这一错误的 Vim 命令，如 `:h E128` （译者注：原文为`:h hE128`，但是并没有该帮助）会直接跳转到 `:function` 命令。

22. 关于包含的语法文件的文档的帮助话题格式是 `:h ft-*-syntax`。如：`:h ft-c-syntax` 说的就是C语言语法文件以及它所提供的选项。有的语法文件还会带有自动完成（`:h ft-php-omni`）或文件类型插件（`:h ft-tex-plugin`）相关的章节可以查看。


另外在每个帮助页的顶端通常会包含一个用户文档链接（更多的从从用户的角度出发来主角命令的功能和用法，不涉及那么多细节）。如：`:h pattern.txt` 里包含了 `:h 03.9` 和 `:h usr_27` 两个章节的链接。


### 获取在线帮助

如果你遇到了无法解决的问题，或者需要指引的话，可以参考 [Vim 使用](https://groups.google.com/forum/#!forum/vim_use)邮件列表。 [IRC](https://de.wikipedia.org/wiki/Internet_Relay_Chat) 也是一个很不错的资源。 [Freenode](https://freenode.net/) 上的 `#vim` 频道很庞大，并且里面有许多乐于助人的人。

如果你想给 Vim 提交 Bug 的话，可以使用 [vim_dev](https://groups.google.com/forum/#!forum/vim_dev) 邮件列表。


### 执行自动命令

你可以触发任何事件，如：`:doautocmd BufRead`。


#### 用户自定义事件

对于插件而言，创建你自己的自定义事件有时非常有用。

```vim
function! Chibby()
    " A lot of stuff is happening here.
    " And at last..
    doautocmd User ChibbyExit
endfunction
```

现在你插件的用户可以在Chibby执行完成之后做任何他想做的事情：

```vim
autocmd User ChibbyExit call ChibbyCleanup()
```

顺便提一句，如果在使用 `:autocmd` 或 `:doautocmd` 时没有捕捉异常，那么会输出 "No matching autocommands" 信息。这也是为什么许多插件用 `silent doautocmd ...` 的原因。但是这也会有不足，那就是你不能再在 :autocmd 中使用 `echo "foo"` 了，取而代之的是你要使用 `unsilent echo "foo"` 来输出。

这就是为什么要在触发事件之前先判断事件是否存在的原因，

```vim
if exists('#User#ChibbyExit')
  doautocmd User ChibbyExit
endif
```

帮助文档：`:h User`


#### 嵌套的自动命令

默认情况下，自动命令不能嵌套！如果某个自动命令执行了一个命令，这个命令再依次触发其它的事件，这是不可能的。

例如你想在每次启动 Vim 的时候自动打开你的 vimrc 文件：

```vim
autocmd VimEnter * edit $MYVIMRC
```

当你启动 Vim 的时候，它会帮你打开你的 vimrc 文件，但是你很快会注意到这个文件没有任何的高亮，尽管平时它是正常可以高亮的。

问题在于你的非嵌套自动命令 `:edit` 不会触发“BufRead”事件，所以并不会把文件类型设置成“vim”，进而 `$VIMRUNTIME/syntax/vim.vim` 永远不会被引入。详细信息请参考：`:au BufRead *.vim`。要想完成上面所说的需求，使用下面这个命令：

```vim
autocmd VimEnter * nested edit $MYVIMRC
```

帮助文档：`:h autocmd-nested`


### 剪贴板

如果你想在没有GUI支持的Unix系统中使用 Vim 的 `'clipboard'` 选项，则需要 `+clipboard` 以及可选的 `+xterm_clipboard` 两个[特性](#what-kind-of-vim-am-i-running)支持。

帮助文档：

```vim
:h 'clipboard'
:h gui-clipboard
:h gui-selections
```

另外请参考：[持续粘贴（为什么我每次都要设置 'paste' 模式](#持续粘贴为什么我每次都要设置-paste-模式)

#### 剪贴板的使用（Windows, OSX）

Windows 自带了[剪贴板](https://msdn.microsoft.com/en-us/library/windows/desktop/ms649012(v=vs.85).aspx)，OSX 则带了一个[粘贴板](https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/PasteboardGuide106/Introduction/Introduction.html#//apple_ref/doc/uid/TP40008100-SW1)

在这两个系统中都可以用大家习惯用的 `ctrl+c / cmd+c` 复制选择的文本，然后在另外一个应用中用 `ctrl+v / cmd+v` 进行粘贴。

需要注意的是复制的文本已经被发送到了剪贴板，所以你在粘贴复制的内容之前关闭这个应用是没有任何问题的。

每次复制的时候，都会向剪贴板寄存器 `*` 中写入数据。 而在 Vim 中分别使用 `"*y` 和 `"*p` 来进行复制（yank) 和 粘贴（paste)。

如果你不想每次操作都要指定 `*` 寄存器，可以在你的 vimrc 中添加如下配置：

```vim
set clipboard=unnamed
```

通常情况下复制/删除/放入操作会往 `"` 寄存器中写入数据，而加上了上面的配置之后 `*` 寄存器也会被写入同样数据，因此简单的使用 `y` 和 `p` 就可以复制粘贴了。

我再说一遍：使用上面的选项意味着每一次的复制/粘贴，即使在同一个 Vim 窗口里，都会修改剪贴板的内容。你自己决定上面的选项是否适合。

如果你觉得输入 `y` 还是太麻烦的话，可以使用下面的设置把在可视模式下选择的内容发送到剪贴板：

```vim
set clipboard=unnamed,autoselect
set guioptions+=a
```

帮助文档：

```vim
:h clipboard-unnamed
:h autoselect
:h 'go_a'
```

#### 剪贴板的使用（Linux, BSD）

如果你的系统使用了 [X 图形界面](http://www.x.org/wiki)，事情会变得有一点不同。X 图形界面实现了 [X 窗口系统协议](http://www.x.org/releases/X11R7.7/doc/xproto/x11protocol.html), 这个协议在1987年发布的主版本11，因此 X 也通常被称为 X11。

在 X10 版本中，[剪贴缓冲区](http://www.x.org/releases/X11R7.7/doc/xorg-docs/icccm/icccm.html#Peer_to_Peer_Communication_by_Means_of_Cut_Buffers)被用来实现像 _clipboard_ 一样由 X 来复制文本，并且可以被所有的程序访问。现在这个机制在 X 中还存在，但是已经过时了，很多程序都不再使用这一机制。

近年来数据在程序之间是通过[选择](http://www.x.org/releases/X11R7.7/doc/xorg-docs/icccm/icccm.html#Peer_to_Peer_Communication_by_Means_of_Selections)进行传递的。一共有三种选择，经常用到的有两种：PRIMARY 和 CLIPBOARD。

选择的工作工模大致是这样的：

```
Program A：<ctrl+c>
Program A：声称对 CLIPBOARD 的所有权
Program B：<ctrl+v>
Program B：发现CLIPBOARD的所有权被Program A持有
Program B：从Program A请求数据
Program A：响应这个请求并发送数据给Program B
Program B：从Program A接收数据并插入到窗口中
```

| 选择   | 何时使用          | 如何粘贴          | 如何在 Vim 中访问    |
|--------|-------------------|-------------------|--------------------|
| PRIMARY | 选择文本          | 鼠标中键, shift+insert |  `*` 寄存器   |
| CLIPBOARD | 选择文本并按 `ctrl+c` | `ctrl+v`   | `+`寄存器          |

**注意**：X 服务器并不会保存选择（不仅仅是 CLIPBOARD 选择）！因此在关闭了相应的程序后，你用 `ctrl+c` 复制的内容将丢失。

使用 `"*p` 来贴粘 PRIMARY 选择中的内容，或者使用 `"+y1G` 来将整个文件的内容复制到 CLIPBOARD 选择。

如果你需要经常访问这两个寄存器，可以考虑使用如下配置：

```vim
set clipboard^=unnamed          " * 寄存器
" 或者
set clipboard^=unnamedplus      " + 寄存器
```

（`^=` 用来将设置的值加到默认值之前，详见：`:h :set^=`）

这会使得所有复制/删除/放入操作使用 `*` 或 `+` 寄存器代替默认的未命令寄存器 `"`。之后你就可以直接使用 `y` 或 `p` 访问你的X选择了。

帮助文档：

```vim
:h clipboard-unnamed
:h clipboard-unnamedplus
```

### 打开文件时恢复光标位置

如果没有这个设置，每次打开文件时光标都将定位在第一行。而加入了这个设置以后，你就可以恢复到上次关闭文件时光标所在的位置了。

将下面的配置添加到你的 vimrc 文件：

```vim
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
```

这是通过判断之前的光标位置是否存在（文件可能被其它程序修改而导致所记录的位置已经不存在了），如果存在的话就执行 ``g`"`` （转到你离开时的光标位置但是不更改跳转列表）。

这需要使用 viminfo 文件：`:h viminfo-`。

### 备份文件, 交换文件, 撤销文件以及viminfo文件的处理

根据选项的不同， Vim 最多会创建4种工作文件。

**备份文件**：

你可以让 Vim 在将修改写入到文件之前先备份原文件。默认情况下， Vim 会保存一个备份文件但是当修改成功写入后会立即删除它（`:set writebackup`）。如果你想一直保留这个备份文件的话，可以使用 `:set backup`。而如果你想禁用备份功能的话，可以使用 `:set nobackup nowritebackup`。

咱们来看一下上次我在 vimrc 中改了什么：

```sh
$ diff ~/.vim/vimrc ~/.vim/files/backup/vimrc-vimbackup
390d389
< command! -bar -nargs=* -complete=help H helpgrep <args>
```

帮助文档：`:h backup`


**交换文件**：

假设你有一个非常棒的科幻小说的构思。在按照故事情节已经写了好几个小时几十万字的时候..忽然停电了！而那时你才想起来你上次保存 `~/来自外太空的邪恶入侵者.txt` 是在.. 好吧，你从来没有保存过。

但是并非没有希望了！在编辑某个文件的时候， Vim 会创建一个交换文件，里面保存的是对当前文件所有未保存的修改。自己试一下，打开任意的文件，并使用 `:swapname` 获得当前的交换文件的保存路径。你也可以将 `:set noswapfile` 加入到 vimrc 中来禁用交换文件。

默认情况下，交换文件会自动保存在被编辑文件所在的目录下，文件名以 `.file.swp` 后缀结尾，每当你修改了超过 200 个字符或是在之前 4 秒内没有任何动作时更新它的内容，在你不再编辑这个文件的时候会被删除。你可以自己修改这些数字，详见：`:h 'updatecount'` 和 `:h 'updatetime'`。

而在断电时，交换文件并不会被删除。当你再次打开 `vim ~/来自外太空的邪恶入侵者.txt` 时， Vim 会提示你恢复这个文件。

帮助文档：`:h swap-file` 和 `:h usr_11`


**撤销文件**：

[内容变更历史记录](#%E5%86%85%E5%AE%B9%E5%8F%98%E6%9B%B4%E5%8E%86%E5%8F%B2%E8%AE%B0%E5%BD%95)是保存在内存中的，并且会在 Vim 退出时清空。如果你想让它持久化到磁盘中，可以设置 `:set undofile`。这会把文件 `~/foo.c` 的撤销文件保存在 `~/foo.c.un~`。

帮助文档：`:h 'undofile'` 和 `:h undo-persistence`


**viminfo 文件**：

备份文件、交换文件和撤销文件都是与文本状态相关的，而 viminfo 文件是用来保存在 Vim 退出时可能会丢失的其它的信息的。包括历史记录（命令历史、搜索历史、输入历史）、寄存器内容、标注、缓冲区列表、全局变量等等。

默认情况下，viminfo 被保存在 `~/.viminfo`。

帮助文档：`:h viminfo` 和 `:h 'viminfo'`

---

如果你跟我一样，也喜欢把这些文件放到一个位置（如：`~/.vim/files`）的话，可以使用下面的配置：

```vim
set backup
set backupdir   =$HOME/.vim/files/backup/
set backupext   =-vimbackup
set backupskip  =
set directory   =$HOME/.vim/files/swap//
set updatecount =100
set undofile
set undodir     =$HOME/.vim/files/undo/
set viminfo     ='100,n$HOME/.vim/files/info/viminfo
```

目录 `~/.vim/files` 需要先自行创建，否则 Vim 会报错。如果你经常在新环境下工作的话，可以尝试让它自动创建：

```vim
if exists('*mkdir') && !isdirectory($HOME.'/.vim/files')
  call mkdir($HOME.'/.vim/files')
endif
```

注意：如果你在一个多用户系统中编辑某个文件时， Vim 提示你交换文件已经存在的话，可能是因为有其他的用户此时正在编辑这个文件。而如果将交换文件放到自己的home目录的话，这个功能就失效了。


### 编辑远程文件

Vim 自带的 netrw 插件支持对远程文件的编辑。实际上它将远程的文件通过 scp 复制到本地的临时文件中，再用那个文件打开一个缓冲区，然后在保存时把文件再复制回远程位置。

下面的命令在你本地的 VIM 配置与 SSH 远程服务器上管理员想让你使用的配置有冲突时尤其有用：

```vim
:e scp://bram@awesome.site.com/.vimrc
```

如果你已经设置了 `~/.ssh/config`，SSH 会自动读取这里的配置：

```
Host awesome
    HostName awesome.site.com
    Port 1234
    User bram
```

如果你的 `~/.ssh/config` 中有以上的内容，那么下面的命令就可以正常执行了：

```vim
:e scp://awesome/.vimrc
```

可以用同样的方法编辑 `~/.netrc`, 详见：`:h netrc-netrc`。

确保你已经看过了 `:h netrw-ssh-hack` 和 `:h g:netrw_ssh_cmd`。

---

另外一种编辑远程文件的方法是使用 [sshfs](https://wiki.archlinux.org/index.php/Sshfs)，它会用 [FUSE](https://en.wikipedia.org/wiki/Filesystem_in_Userspace) 来挂载远程的文件系统到你本地的系统当中。


### 插件管理

[Pathogen](https://github.com/tpope/vim-pathogen)是第一个比较流行的插件管理工具。实际上它只是修改了 _runtimepath_ （`:h 'rtp'`） 来引入所有放到该目录下的文件。你需要自己克隆插件的代码仓库到那个目录。

真正的插件管理工具会在 Vim 中提供帮助你安装或更新插件的命令。以下是一些常用的插件管理工具：

* [dein](https://github.com/Shougo/dein.vim)
* [plug](https://github.com/junegunn/vim-plug)
* [vim-addon-manager](https://github.com/MarcWeber/vim-addon-manager)
* [vundle](https://github.com/VundleVim/Vundle.vim)


### 多行编辑

这是一种可以同时输入多行连续文本的技术。参考这个[示例](https://raw.githubusercontent.com/mhinz/vim-galore/master/contents/images/content-block_insert.gif)。

用 `<c-v>` 切换到可视块模式。然后向下选中几行，按 `I` 或 `A` （译者注：大写字母，即 shift+i 或 shift+a）然后开始输入你想要输入的文本。

在刚开始的时候可能会有些迷惑，因为文本只出现在了当前编辑的行，只有在当前的插入动作结束后，之前选中的其它行才会出现插入的文本。

举一个简单的例子：`<c-v>3jItext<esc>`。

如果你要编辑的行长度不同，但是你想在他们后面追加相同的内容的话，可以试一下这个：`<c-v>3j$Atext<esc>`。

有时你可能需要把光标放到当前行末尾之后，默认情况下你是不可能做到的，但是可能通过设置 `virtualedit` 选项达到目的：

```vim
set virtualedit=all
```

设置之后 `$10l` 或 `90|` 都会生效，即使超过了行尾的长度。

详见 `:h blockwise-examples`。在开始的时候可能会觉得有些复杂，但是它很快就会成为你的第二天性的。

如果你想探索更有趣的事情，可以看看[多光标](https://github.com/terryma/vim-multiple-cursors)

### 使用外部程序和过滤器

免责声明：Vim 是单线程的，因此在 Vim 中以前端进程执行其它的程序时会阻止其它的一切。当然你可以使用 Vim 程序接口，如Lua，并且使用它的多线程支持，但是在那期间， Vim 的处理还是被阻止了。Neovim 添加了任务 API 解决了此问题。

（据说 Bram 正在考虑在 Vim 中也添加任务控制。如果你使用了较新版本的的 Vim ，可以看一下 `:helpgrep startjob`。）

使用 `:!` 启动一个新任务。如果你想列出当前工作目录下的所有文件，可以使用 `:!ls`。 用 `|` 来将结果通过管道重定向，如：`:!ls -l | sort | tail -n5`。

没有使用范围时（译者注：范围就是 `:` 和 `!` 之间的内容，`.` 表示当前行，`+4` 表示向下偏移4行，`$` 表示最末行等，多行时用 `,` 将它们分开，如 `.,$` 表示从当前行到末行），`:!` 会显示在一个可滚动的窗口中（译者注：在 GVim 和在终端里运行的结果稍有不同）。相反的，如果指定了范围，这些行会被[过滤](https://en.wikipedia.org/wiki/Filter_(software))。这意味着它们会通过管道被重定向到过滤程序的 [stdin](https://en.wikipedia.org/wiki/Standard_streams#Standard_input_.28stdin.29)，在处理后再通过过滤程序的 [stdout](https://en.wikipedia.org/wiki/Standard_streams#Standard_output_.28stdout.29) 输出，用输出结果替换范围内的文本。例如：为接下来的5行文本添加行号，可以使用：

```vim
:.,+4!nl -ba -w1 -s' '
```

由于手动添加范围很麻烦， Vim 提供了一些辅助方法以方便的添加范围。如果需要经常带着范围的话，你可以在可见模式中先选择，然后再按 `:` （译者注：选中后再按 `!` 更方便）。还可以使用 `!` 来取用一个motion的范围，如 `!ipsort` （译者注：原文为 `!ip!sort` ，但经过实验发现该命令执行报错，可能是因为 Vim 版本的原因造成的，新版本使用 `ip` 选择当前段落后自动在命令后添加了 `!` ，按照作者的写法来看，可能之前的版本没有自动添加 `!` ）可以将当前段落的所有行按字母表顺序进行排序。

一个使用过滤器比较好的案例是[Go语言](https://golang.org/)。它的缩进语法非常个性，甚至还专门提供了一个名为 `gofmt` 的过滤器来对Go语言的源文件进行正确的缩进。Go语言的插件通常会提供一个名为 `:Fmt` 的函数，这个函数就是执行了 `:%!gofmt` 来对整个文件进行缩进。

人们常用 `:r !prog` 将prog程序的插入放到当前行的下面，这对于脚本来说是很不错的选择，但是在使用的过程中我发现 `!!ls` 更加方便，它会用输出结果替换当前行的内容。（译者注：前面命令中的 `prog` 只是个占位符，在实际使用中需要替换成其它的程序，如 `:r !ls`，这就与后面的 `!!ls` 相对应了，两者唯一的不同是第一个命令不会覆盖当前行内容，但是第二个命令会）

帮助文档：

```vim
:h filter
:h :read!
```

### Cscope

[Cscope](http://cscope.sourceforge.net/) 的功能比 [ctags](http://ctags.sourceforge.net/) 要完善，但是只支持C（通过设置cscope.files后同样支持C++以及Java）。

鉴于Tag文件只是知道某个符号是在哪里定义的，cscope的数据库里的数据信息就多的多了：

* 符号是在哪里定义的？
* 符号是在哪里被使用的？
* 这个全局符号定义了什么？
* 这个变量是在哪里被赋值的？
* 这个函数在源文件的哪个位置？
* 哪些函数调用了这个函数？
* 这个函数调用了哪些函数？
* "out of space"消息是从哪来的？
* 在目录结构中当前的源文件在哪个位置？
* 哪些文件引用了这个头文件？


#### 1. 构建数据库

在你项目的根目录执行下面的命令：

```sh
$ cscope -bqR
```

这条命令会在当前目录下创建三个文件：`cscope{,.in,.po}.out` 。把它们想象成你的数据库。

不幸的时 `cscope` 默认只分析 `*.[c|h|y|l]` 文件。如果你想在Java项目中使用 cscope ，需要这样做：

```sh
$ find . -name "*.java" > cscope.files
$ cscope -bq
```

#### 2. 添加数据库

打开你新创建的数据库连接：

```vim
:cs add cscope.out
```

检查连接已经创建成功：

```vim
:cs show
```

（当然你可以添加多个连接。）


#### 3. 查询数据库

```vim
:cs find <kind> <query>
```

如：`:cs find d foo` 会列出 `foo(...)` 调用的所有函数。

| Kind | 说明 |
|------|-------------|
| s    | **s**ymbol：查找使用该符号的引用 |
| g    | **g**lobal：查找该全局符号的定义 |
| c    | **c**alls：查找调用当前方法的位置 |
| t    | **t**ext：查找出现该文本的位置 |
| e    | **e**grep：使用 egrep 搜索当前单词 |
| f    | **f**ile：打开文件名 |
| i    | **i**ncludes：查询引入了当前文件的文件 |
| d    | **d**epends：查找当前方法调用的方法 |

推荐一些比较方便的映射，如：


```vim
nnoremap <buffer> <leader>cs :cscope find s  <c-r>=expand('<cword>')<cr><cr>
nnoremap <buffer> <leader>cg :cscope find g  <c-r>=expand('<cword>')<cr><cr>
nnoremap <buffer> <leader>cc :cscope find c  <c-r>=expand('<cword>')<cr><cr>
nnoremap <buffer> <leader>ct :cscope find t  <c-r>=expand('<cword>')<cr><cr>
nnoremap <buffer> <leader>ce :cscope find e  <c-r>=expand('<cword>')<cr><cr>
nnoremap <buffer> <leader>cf :cscope find f  <c-r>=expand('<cfile>')<cr><cr>
nnoremap <buffer> <leader>ci :cscope find i ^<c-r>=expand('<cfile>')<cr>$<cr>
nnoremap <buffer> <leader>cd :cscope find d  <c-r>=expand('<cword>')<cr><cr>
```

所以 `:tag` （或 `<c-]>`）跳转到标签定义的文件，而 `:cstag` 可以达到同样的目的，同时还会打开 cscope 的数据库连接。`'cscopetag'` 选项使得 `:tag` 命令自动的像 `:cstag` 一样工作。这在你已经使用了基于标签的映射时会非常方便。

帮助文档：`:h cscope`


### MatchIt

由于 Vim 是用 C 语言编写的，因此许多功能都假设使用类似 C 语言的语法。默认情况下，如果你的光标在 `{` 或 `#endif` , 就可以使用 `%` 跳转到与之匹配的 `}` 或 `#ifdef`。

Vim 自带了一个名为 matchit.vim 的插件，但是默认没有启用。启用后可以用 `%` 在HTML相匹配的标签或 VimL 的 if/else/endif 块之间进行跳转，它还带来了一些新的命令。


##### 在 Vim 8 中安装

```vim
" vimrc
packadd! matchit
```

##### 在 Vim 7 或者更早的版本中安装

```vim
"vimrc
runtime macros/matchit.vim
```

由于matchit的文档很全面，我建议安装以后执行一次下面的命令：

```vim
:!mkdir -p ~/.vim/doc
:!cp $VIMRUNTIME/macros/matchit.vim ~/.vim/doc
:helptags ~/.vim/doc
```

##### 简短的介绍

至此这个插件已经可以使用了。 参考 `:h matchit-intro` 来获得支持的命令以及 `:h matchit-languages` 来获得支持的语言。

你可以很方便的定义自己的匹配对，如：

```vim
autocmd FileType python let b:match_words = '\<if\>:\<elif\>:\<else\>'
```

之后你就可以在任何的 Python 文件中使用 `%` （向前）或 `g%` （向后）在这三个片断之间跳转了。

帮助文档：

```vim
:h matchit-install
:h matchit
:h b:match_words
```
