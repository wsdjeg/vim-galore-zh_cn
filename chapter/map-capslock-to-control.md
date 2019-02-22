## 映射大写锁定键（CapsLock）到控制键（Ctrl）

大写锁定键属于键盘上最少用到的按键，但是它要比控制键更加容易按到，
因为它位于你手放在键盘时的[起始行](https://raw.githubusercontent.com/mhinz/vim-galore/master/contents/images/content-homerow.png)。
如果你敲很多代码的话，映射大写锁定键（CapsLock）到控制键（Ctrl）可以有效降低
[重复使力伤害](https://de.wikipedia.org/wiki/Repetitive-Strain-Injury-Syndrom) (ps:为什么将 jk 映射为 esc，而不是 jj，重复点击同一个按键对手指伤害很大)。

友情提示：当你习惯这个设定后，你就离不开它了。

**OSX**:

`System Preferences -> Keyboard -> Keyboard Tab -> Modifier Keys`. 变更
"CapsLock" 为 "Control"。

**Linux**:

为了使按键生效，请把以下几行放入 `~/.xmodmap` 文件:

    remove Lock = Caps_Lock
    keysym Caps_Lock = Control_L
    add Control = Control_L

用以下命令使之生效<br> `$ xmodmap ~/.xmodmap`。

替代方法有[caps2esc](https://github.com/oblitum/caps2esc) 或者
[xcape](https://github.com/alols/xcape)。

**Windows**:

请参看 [superuser.com: 在Windows8.1映射大写锁定键到控制键](http://superuser.com/questions/764782/map-caps-lock-to-control-in-windows-8-1)。
