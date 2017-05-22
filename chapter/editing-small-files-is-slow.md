## 编辑小文件很慢

对性能有重大影响的有两个方面：

1. 复杂的**正则表达式**。尤其是 Ruby 语法文件导致人们过去一直慢慢吞吞。（[Debugging syntax files](#debugging-syntax-files)里也有说明。）
2. **页面刷新**。一些特性强制所有行都刷新。

| 典型败笔 | 原因？ | 解决方法？ |
|-----------------|------|-----------|
| `:set cursorline`        | 导致所有行刷新。 | `:set nocursorline` |
| `:set cursorcolumn`      | 导致所有行刷新。 | `:set nocursorcolumn` |
| `:set relativenumber`    | 导致所有行刷新。 | `:set norelativenumber` |
| `:set foldmethod=syntax` | 语法文件算减速的话，这无异于刹车。 | `:set foldmethod=manual`, `:set foldmethod=marker` or [快速折叠](https://github.com/Konfekt/FastFold) |
| `:set synmaxcol=3000`    | 根据内部表示规则, Vim 一般不待见对很长的行。这一设定导致3000列时才会把所在行高亮。 | `:set synmaxcol=200` |
| matchparen.vim           | 使用默认加载。使用正则表达式去匹配括回。 | 禁用插件: `:h matchparen` |

**注意**: 只有当真的遭遇实质的性能缺陷时，你才需要做这些改进。多数情况下，上面提到的这些方面还都凑合。
