## 内置插件

出乎很多人的意料，Vim自己默认加载了大把大把的插件。启动 Vim 后，用`:scriptnames`查看所有加载的源文件

这些文件多数永远不会被用到，所以请禁止如你所见的以下插件。
这些插件仍旧会在源文件列出，但是当Vim启动时，只有第一行会被读取，而之后的配置，命令和日志都不会执行。

| 插件     | 禁用                  | 帮助 |
|------------|-------------------------------------|------|
| 2html      | `let g:loaded_2html_plugin = 1`     | `:h 2html` |
| getscript  | `let g:loaded_getscriptPlugin = 1`  | `:h pi_getscript` |
| gzip       | `let g:loaded_gzip = 1`             | `:h pi_gzip` |
| logipat    | `let g:loaded_logipat = 1`          | `:h pi_logipat` |
| matchparen | `let g:loaded_matchparen = 1`       | `:h pi_paren` |
| netrw      | `let g:loaded_netrwPlugin = 1`      | `:h pi_netrw` |
| rrhelper   | `let g:loaded_rrhelper = 1`         | `:e $VIMRUNTIME/plugin/rrhelper.vim` |
| spellfile  | `let g:loaded_spellfile_plugin = 1` | `:h spellfile.vim` |
| tar        | `let g:loaded_tarPlugin = 1`        | `:h pi_tar` |
| vimball    | `let g:loaded_vimballPlugin = 1`    | `:h pi_vimball` |
| zip        | `let g:loaded_zipPlugin = 1`        | `:h pi_zip` |
