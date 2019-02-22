## 使用终端中 Esc 键时的延迟

如果你生活在命令行里，你可能使用 xterm， gnome-terminal， iTerm2 等等所谓的 _终端虚拟器_。（区别于真正的[终端](https://en.wikipedia.org/wiki/Computer_terminal)）

和宿主终端一样，终端虚拟器使用 [退出序列](https://en.wikipedia.org/wiki/Escape_sequence) （或者叫 _控制序列_）来控制光标移动，更换文本颜色等等。
退出序列是一些以退出码（在 [插入符号](https://en.wikipedia.org/wiki/Caret_notation) 中展示为 `^[`）开头的 ASCII 码串。
当接收到码串时，终端虚拟器会从 [terminfo](https://en.wikipedia.org/wiki/Terminfo) 数据库中寻找与之匹配的指令。

为了使问题更清晰，我想先解释一下映射超时。映射超时经常在模糊映射时发生：

```vim
:nnoremap ,a  :echo 'foo'<cr>
:nnoremap ,ab :echo 'bar'<cr>
```

两个映射都有可能，键入 `,a` ，就会有一秒钟的延迟，因为 Vim 会等待用户会再键入 `b` 还是不会了。

退出序列也会引起一样的问题：

- `<esc>` 在返回正常模式或退出指令时被大量使用。
- 光标键使用了退出序列进行编码
- Vim 运用 <kbd>Alt</kbd> （也被称为 _Meta key_）去发送固定的高位集编码的8位比特，但是很多终端虚拟器不支持（或者默认不启用），而用退出序列代替。

你可以用 `vim -u NONE -N` 试一试上面所说的，然后键入 `i<c-v><left>` ，你就会看见一串以 `^[`（表征退出码）开头的被输入序列。

简而言之，区分键入的 `<esc>` 和一个严格意义上的退出序列对 Vim 来说是一个痛苦的过程。

默认情况下 `:set timeout timeoutlen=1000` ，Vim 会有1秒的延迟在等 _还有吗_ 的模糊映射。
对于映射来说，这是一个稳健的值，但是通常为了解决整个问题，你可以自定义键入的超时阈值：

```vim
set timeout           " 映射超时
set timeoutlen=1000   " 默认值
set ttimeout          " 键入超时
set ttimeoutlen=10    " 察觉不到的小值
```

执行 `:h ttimeout` 你可以找到一个小表格展示这些选项的相互关系。

如果你在 Vim 和终端虚拟器之间使用的是 tmux ，请将以下一行放入 `~/.tmux.conf`：

```tmux
set -sg escape-time 0
```
