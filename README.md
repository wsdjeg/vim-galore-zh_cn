# vim-galore 中文翻译
> Vim from zero to hero

#### [介绍](#intro-1)

- [什么是Vim](#what-is-vim)
- [Vim中的哲学](#the-vim-philosophy)
- [起步](#first-steps)
- [精简的vimrc](#minimal-vimrc)
- [我正在使用的是什么样的vim](#what-kind-of-vim-am-i-running)
- [备忘录](#cheatsheets)

#### [基础](#basics-1)

- [缓冲区, 窗口, 标签?](#buffers-windows-tabs)
- [当前缓冲区, 加载缓冲区, 缓冲区列表,命名缓冲区?](#active-loaded-listed-named-buffers)
- [映射?](#mappings)
- [Mapleader?](#mapleader)
- [寄存器?](#registers)
- [标注?](#marks)
- [光标移动? 动作和操作符?文本对象?](#motions-operators-text-objects)
- [自动命令?](#autocmds)
- [改变表? 跳转表?](#changelist-jumplist)
- [Quickfix and 位置列表?](#quickfix-and-location-lists)
- [配色方案?](#colorschemes)
- [折叠?](#folding)
- [会话?](#sessions)
- [局部化?](#locality)

#### [用法](#usage-1)

- [获取离线帮助](#getting-help-offline)
- [获取离线帮助(可选择的)](#getting-help-offline-alternative)
- [获取在线帮助](#getting-help-online)
- [剪贴板](#clipboard)
  - [剪贴板使用 (Windows, OSX)](#clipboard-usage-windows-osx)
  - [剪贴板使用 (Linux, BSD, ...)](#clipboard-usage-linux-bsd-)
- [打开文件时恢复光标位置](#restore-cursor-position-when-opening-file)
- [备份文件，交换文件，撤销文件以及viminfo文件的处理](#handling-backup-swap-undo-and-viminfo-files)
- [编辑远程文件](#editing-remote-files)
- [插件管理](#managing-plugins)
- [片段插入](#block-insert)
- [使用外部程序和过滤器](#running-external-programs-and-using-filters)
- [MatchIt](#matchit)

#### [技巧](#tips-1)

- [聪明的使用n和N](#saner-behavior-of-n-and-n)
- [聪明的使用命令行历史](#saner-command-line-history)
- [聪明的使用CTRL-L](#saner-ctrl-l) 
- [快速移动当前行](#quickly-move-current-line)
- [快速添加空行](#quickly-add-empty-lines)
- [快速编辑自定义宏](#quickly-edit-your-macros)
- [快速跳转到源(头)文件](#quickly-jump-to-header-or-source-file)
- [在GUI中快速改变字体大小](#quickly-change-font-size-in-gui)
- [根据模式改变光标类型](#change-cursor-style-dependent-on-mode)
- [不要在水平滑动的时候失去选择](#dont-lose-selection-when-shifting-sidewards)
- [重新载入保存文件](#reload-a-file-on-saving)
- [智能当前行](#smarter-cursorline)
- [更快的关键字补全](#faster-keyword-completion)

#### [命令](#commands-1)

- [:global](#global) - 在所有匹配行执行命令
- [:normal and :execute](#normal-and-execute) - 脚本梦之队
- [:redir](#redir) - 重定向消息

#### [调试](#debugging-1)

- [常规建议](#general-tips)
- [启动时刨视](#profiling-startup-time)
- [运行时刨视](#profiling-at-runtime)
- [详细模式](#verbosity)
- [vim脚本调试](#debugging-vim-scripts)
- [语法文件调试](#debugging-syntax-files)

#### [杂项](#miscellaneous-1)

- [附加资源](#additional-resources)
- [Vim 发布](#vim-distributions)
- [标准插件](#standard-plugins)
- [将Control映射到CapsLock](#map-capslock-to-control)
- [复活节彩蛋](#easter-eggs)
- [为何使用hjkl](#why-hjkl-for-navigation)

#### [奇事](#quirks-1)

- [编辑小文件很慢](#editing-small-files-is-slow)
- [编辑打文件很慢](#editing-huge-files-is-slow)
- [新行用于NUL](#newline-used-for-nul)
- [相同部分粘贴 (要不为什么我总要设置‘粘贴’?)](#bracketed-paste-or-why-do-i-have-to-set-paste-all-the-time)
- [在终端使用Esc延时](#delays-when-using-escape-key-in-terminal)

#### [配色主题](#list-of-colorschemes-1)

#### [插件列表](content/plugins.md)

#### [Neovim](content/neovim.md)

---

## Intro

#### What is Vim?

[Vim](http://www.vim.org) 是一个历史悠久的文本编辑器,可以追溯到 [qed](https://en.wikipedia.org/wiki/QED_(text_editor)). [Bram
Moolenaar](https://en.wikipedia.org/wiki/Bram_Moolenaar) 于1991年发布初始版本.

该项目托管在 [vim.org](http://www.vim.org/index.php).

获取Vim: 使用你最喜欢的包管理器安装,或者在vim.org上[下载](http://www.vim.org/download.php) .

讨论使用相关问题最好在
[vim_use](https://groups.google.com/forum/#!forum/vim_use) 邮件列表或者使用IRC ([Freenode](https://freenode.net)) 的 `#vim` 频道.

项目开发在 [Github](https://github.com/vim/vim), 项目讨论请至
[vim_dev](https://groups.google.com/forum/#!forum/vim_dev) 邮件列表.

阅读 [Why, oh WHY, do those #?@! nutheads use
vi?](http://www.viemu.com/a-why-vi-vim.html), 对Vim有一个大致的了解.


#### Vim 哲学

Vim 坚持着模式编辑的理念. 这意味着他提供了多种模式，并根据模式，同一按键有不同含义。你可以在 _普通模式_下浏览文件, 在_ 插入模式_下插入文本, 在_可视模式_下选择行, 在_命令模式_下执行命令.
这一开始听起来可能很复杂, 但是这有一个很大的优点: 你不需要让你的手指因为一次要同时按住很多键而受苦, 大多数时候你只要一个接着一个按.越常用的任务，所需要的按键数量越少. 

动作和操作符是一个能在模式编辑中表现良好的概念._操作符_开始一些行为, e.g. 修改, 删除, 或者选择文本.之后你要用_动作_选择你要使用那些行为的文本区域。
为了去改变括号内的内容, 使用 `ci(` (read _change inner
parentheses_). 删除整个段落的内容, 使用 `dap` (read _delete
around paragraph_).

如果你能看见Vim高级用户工作,你会发现他们使用Vim语言就像钢琴师处理自己的乐器一样。复杂的操作只需要几个案件就能完成。他们甚至不用刻意去想，因为这已经成为[肌肉记忆](https://en.wikipedia.org/wiki/Muscle_memory)了. 这减少[认识负荷](https://en.wikipedia.org/wiki/Cognitive_load)并帮助人们专注与实际任务.
#### 开始

Vim自带一个交互式的教程,内含你需要了解的最基础的信息,你可以通过运行以下命令打开教程:

```
$ vimtutor
```

不要因为这个看上去很无聊而推迟，按照此教程多练习。你以前用的IDEs或者其他编辑器大多数都是无模式的。
因此一开始在模式之间切换将会看上去很笨拙。但是你使用VIM越多，
[肌肉记忆](https://en.wikipedia.org/wiki/Muscle_memory)将更加强大。

Vim 基于 [Stevie](https://en.wikipedia.org/wiki/Stevie_(text_editor)), a
[vi](https://en.wikipedia.org/wiki/Vi) 克隆, 支持两种操作模式:
"compatible" 和 "nocompatible". 使用兼容模式 vim 意味着 使用vi默认设置
, 相对于VIM 默认设置. 只要你没有新建一个用户的vimrc 或者使用 `vim -N` 命令启动VIM ， 兼容模式将被使用! 不要使用VIM的兼容模式.

下一步:

1. 创建你自己的[vimrc](#minimal-vimrc). TODO
2. 在第一周准备 [备忘录](#cheatsheets).
3. 通读[基础](#basics-1) 一节知道做什么是可能的.
4. 了解需求! 你永远不能够学完VIM. 如果你遇到了任何问题，那就在网络上去寻找。你的问题可能早就被解决了。VIM 拥有大量的参考文档，所有知道如何去利用这些参考文档就很有必要了:[获取离线帮助](#getting-help-offline).
5. 浏览[附加资源](#additional-resources).

最后一个建议: 请先学会正确使用VIM在你开始使用那些只是实现VIM原生功能的[插件](#managing-plugins).

#### Minimal vimrc

用户的vimrc配置文件可以放在`~/.vimrc`或者为了更好的分离放在`~/.vim/vimrc`. 后者更容易让整个配置处于版本控制之下并且上传, 比方说github.

你可以在网上发现许多精简的vimrc配置文件, 我的版本可能并不是最简单的版本, 但是我的版本提供了一套我认为良好的，理智的设置.

最终你需要阅读完那些设置，然后自行决定需要使用哪些. :-)

vimrc地址: [minimal-vimrc](content/minimal-vimrc.vim)

如果你有兴趣, 这里是我的 [vimrc](https://github.com/mhinz/dotfiles/blob/master/vim/vimrc).

**建议**: 大多数插件作者都维护一些插件并且将他们的vimrc放在Github上展示(通常放在叫做"vim-config" 或者 "dotfiles"的仓库中), 所以当你发现你喜欢的插件时, 去插件维护者的 Github 主页看看有没有这样的仓库.

#### What kind of Vim am I running?

使用`:version`命令将给你展示你所需要知道的当前正在运行的vim是如何编译的的所有信息.

第一行告诉你这个二进制文件的编译时间和版本号 e.g. 7.4.
接下来的一行呈现`Included patches: 1-1051`, 这是补丁版本. 因此你VIM确切的版本号是7.4.1051.

另一行显示着一些向`Tiny version without GUI` 或者`Huge version
with GUI`的信息. 很显然这些信息告诉你你的VIM是否包含着GUI支持, e.g. 从Shell中运行`gvim` 或者从VIM内部的终端仿真器运行`:gui` . 另一个重要的信息是 `Tiny` 和`Huge`. Vim的特性集区分被叫做`tiny`, `small`, `normal`,
`big`, and `huge`, 所有的都实现不同的功能子集.

`:version` 主要的输出内容是特性列表.`+clipboard` 意味这剪贴板功能被编译了, `-clipboard` 意味着剪贴板特性没有被编译.

为了让他们工作一些VIM功能需要被编译. E.g. 为了让`:prof`工作, 你需要带有huge 功能集合的VIM, 因为那个功能集确保了`+profile` 特性.

如果你的输出情况并不是那样并且你是从包管理器安装Vim的, 确保你安装了`vim-x`, `vim-x11`, `vim-gtk`, `vim-gnome` 这些包或者相似的, 因为这些包通常带有较大的功能集.

你也可以测试你的VIM的版本或者编程功能：

```viml
" Do something if running at least Vim 7.4.42 with +profile enabled.
if (v:version > 704 || v:version == 704 && has('patch42')) && has('profile')
  " do stuff
endif
```

相关帮助:

```
:h :version
:h feature-list
:h +feature-list
```

#### Cheatsheets

为了避免版权问题, 我只贴出链接:

- http://people.csail.mit.edu/vgod/vim/vim-cheat-sheet-en.png
- https://cdn.shopify.com/s/files/1/0165/4168/files/preview.png
- http://www.nathael.org/Data/vi-vim-cheat-sheet.svg
- http://michael.peopleofhonoronly.com/vim/vim_cheat_sheet_for_programmers_screen.png
- http://www.rosipov.com/images/posts/vim-movement-commands-cheatsheet.png

## Basics

#### Buffers, windows, tabs?

Vim 是一个文本编辑器. 每次文本都是作为**缓冲区**的一部分显示的.每一份文件都是在他们自己独有的缓冲区打开的. 插件显示的东西在他们自己的缓冲区中.

缓冲区有很多属性, 比如这个缓冲区的内容是否可以修改,或者这个缓冲区是否和文件相关联，是否需要同步保存到磁盘上.

**窗口** 是缓冲区的视窗. 如果你想同时查看几个文件或者查看同一文件的不同位置，那样你会需要窗口.

请别把他们叫做_分离_. 你可以把一个窗口分割成两个, 但是这并没有让这两个窗口_分离_.

窗口可以水平或者竖直分割并且现有窗口的高度和宽度都是可以被调节设置的.因此你可以使用你喜欢的窗口布局.

**标签页** (标签) 是窗口的集合. 因此使用标签当你想使用多种窗口布局的时候.

简单的说, 如果你启动VIM的时候没有附带任何参数,你会得到一个包含着一个呈现一个缓冲区的窗口的标签.

顺带提一下, 缓冲区列表是全局可见的，你可以从任一一个标签中进入任何一个缓冲区.

#### Active, loaded, listed, named buffers?

用类似 `vim file1`的命令启动VIM. 这个文件的内容将会被加载到缓冲区.你现在有一个**载入的缓冲区**.如果你在VIM中保存这个文件，缓冲区内容将会被同步到磁盘上(写回文件中).

由于这个缓冲区也在一个窗口上显示, 所以他也是一个**活动缓冲区**. 如果你现在通过`:e file2`命令加载另一个文件, `file1` 将会变成一个**隐藏缓冲区**,并且`file2`变成活动缓冲区.

使用`:ls`我们能够得到缓冲区列表的输出. 插件缓冲区和帮助缓冲区通常被标记为列表外的缓冲区, 因为那并不是你会经常编辑的常规文件. 通过:ls!`命令可以显示被放入缓冲区列表的和未被放入列表的缓冲区.

**未命名缓冲区**是一种没有关联特定文件的缓冲区,这种缓冲区经常被插件使用. 比如`:enew`将会创建一个无名临时缓冲区. 添加一些文本然后使用`:w /tmp/foo`将他写入到磁盘, 这样这个缓冲区就会变成一个命名缓冲区.

#### Argument list?

[全局缓冲区列表](#buffers-windows-tabs)是VIM中的特性. 在这之前的VI中,仅仅只有参数列表, 参数列表在VIM中依旧可以使用.

每一个通过shell命令传递给VIM的文件名都被记录在一个参数列表中.可以有多个参数列表:默认情况下所有参数都被放在全局参数列表下, 但是你可以使用`:arglocal`命令去创建一个本地窗口的参数列表.

使用`:args`命令可以列出当前参数. 使用`:next`, `:previous`, `:first`, `:last` 命令可以在切换在参数列表中的文件.通过使用`:argadd`, `:argdelete` or `:args`等命令加上一个文件列表可以改变参数列表.

偏爱缓冲区列表还是参数列表是一个个人品味问题.我的印象中大多数人都是使用缓冲区列表的.

然而参数列表在有些情况下被大量使用: 批处理
使用 `:argdo`! 一个简单的重构例子:

```vim
:args **/*.[ch]
:argdo %s/foo/bar/ge | update
```

这条命令将替换掉当前目录下以及当前目录的子目录中所有的C源文件和头文件中的"foo",并用"bar"代替.

相关帮助: `:h argument-list`

#### Mappings?

使用`:map`命令家族你可以定义属于你自己的快捷键. 该家族的每一个命令都限定在特定的模式下.从技术上来说VIM自带高达12中模式, 其中6种可以被映射另外一些命令作用于多种模式:

| Recursive | Non-recursive | Modes                            |
|-----------|---------------|----------------------------------|
| `:map`    | `:noremap`    | normal, visual, operator-pending |
| `:nmap`   | `:nnoremap`   | normal                           |
| `:xmap`   | `:xnoremap`   | visual                           |
| `:cmap`   | `:cnoremap`   | command-line                     |
| `:omap`   | `:onoremap`   | operator-pending                 |
| `:imap`   | `:inoremap`   | insert                           |

E.g. 这个自定义的快捷键只在普通模式下工作:

```viml
:nmap <space> :echo "foo"<cr>
```

使用`:nunmap <space>`可以取消这个映射.

对于更少数，不常见的模式(或者他们的组合), 查看`:h
map-modes`.

到现在为止还好.对新手而言有一个问题会困扰他们: `:nmap` 是**递归执行**的!结果是, 右边执行可能的映射.

你自定义了一个简单的映射去输出"Foo":

```vim
:nmap b :echo "Foo"<cr>
```

但是如果你想要映射`b` (回退一个单词)的默认功能到一个键上?

```vim
:nmap a b
```

如果你敲击<kbd>a</kbd>,我们期望着光标回退到上一个单词,但是实际情况是"Foo"被输出到命令行里! 因为在右边, `b`已经被映射到别的行为上了,换句话说就是`:echo "Foo"<cr>`.

解决此问题的正确方法是使用一种_非递归_的映射代替:

```vim
:nnoremap a b
```

经验法则: 除非递归是必须的，否则总是使用非递归映射.

通过不给一个右值来检查你的映射. 比如`:nmap` 显示所以普通模式下的映射,`:nmap <leader>` 显示所有以<leader>键开头的普通模式下的映射.

如果你想禁止用标准映射, 把他们映射到特殊字符 `<nop>`上, e.g. `:noremap <left> <nop>`.

相关帮助:

    :h key-notation
    :h mapping
    :h 05.3

### 加入我们

可以协助我们核对翻译，或者从[章节列表](CONTRIBUTING.md)中认领章节进行翻译。

### 致谢：

- [Linux 中国翻译组](https://github.com/LCTT)
- [掘金翻译计划](https://github.com/xitu/gold-miner)
