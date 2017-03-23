有兴趣加入本项目的话，请关注下面的认领列表，选择相应的章节翻译，或者协助校验正在翻译的项目。如果有兴趣加入，可以fork本项目，开始翻译后提交PR，便于我们协助校验，不必翻译结束后才提交PR.

## 认领方式

**开issue**

```md
章节名称：*****
译者：******
PR: PR的链接
```


|章节名称|认领状态|中文链接|
|:------|:------|:------|
| [Intro](https://github.com/mhinz/vim-galore#intro) | | |
- [What is Vim?](#what-is-vim)
- [The Vim Philosophy](#the-vim-philosophy)
- [First steps](#first-steps)
- [Minimal vimrc](#minimal-vimrc)
- [What kind of Vim am I running?](#what-kind-of-vim-am-i-running)
- [Cheatsheets](#cheatsheets)

## [Basics](#basics-1)

- [Buffers, windows, tabs](#buffers-windows-tabs)
- [Active, loaded, listed, named buffers](#active-loaded-listed-named-buffers)
- [Argument list](#argument-list)
- [Mappings](#mappings)
- [Mapleader](#mapleader)
- [Registers](#registers)
- [Ranges](#ranges)
- [Marks](#marks)
- [Completion](#completion)
- [Motions, operators, text objects](#motions-operators-text-objects)
- [Autocmds](#autocmds)
- [Changelist, jumplist](#changelist-jumplist)
- [Undo tree](#undo-tree)
- [Quickfix and location lists](#quickfix-and-location-lists)
- [Macros](#macros)
- [Colorschemes](#colorschemes)
- [Folding](#folding)
- [Sessions](#sessions)
- [Locality](#locality)

## [Usage](#usage-1)

- [Getting help offline](#getting-help-offline)
- [Getting help offline (alternative)](#getting-help-offline-alternative)
- [Getting help online](#getting-help-online)
- [Autocmds in practice](#autocmds-in-practice)
  - [User events](#user-events)
  - [Nested autocmds](#nested-autocmds)
- [Clipboard](#clipboard)
  - [Clipboard usage (Windows, OSX)](#clipboard-usage-windows-osx)
  - [Clipboard usage (Linux, BSD, ...)](#clipboard-usage-linux-bsd-)
- [Restore cursor position when opening file](#restore-cursor-position-when-opening-file)
- [Handling backup, swap, undo, and viminfo files](#handling-backup-swap-undo-and-viminfo-files)
- [Editing remote files](#editing-remote-files)
- [Managing plugins](#managing-plugins)
- [Block insert](#block-insert)
- [Running external programs and using filters](#running-external-programs-and-using-filters)
- [Cscope](#cscope)
- [MatchIt](#matchit)

## [Tips](#tips-1)

- [Saner behavior of n and N](#saner-behavior-of-n-and-n)
- [Saner command-line history](#saner-command-line-history)
- [Saner CTRL-L](#saner-ctrl-l)
- [Disable audible and visual bells](#disable-audible-and-visual-bells)
- [Quickly move current line](#quickly-move-current-line)
- [Quickly add empty lines](#quickly-add-empty-lines)
- [Quickly edit your macros](#quickly-edit-your-macros)
- [Quickly jump to header or source file](#quickly-jump-to-header-or-source-file)
- [Quickly change font size in GUI](#quickly-change-font-size-in-gui)
- [Change cursor style dependent on mode](#change-cursor-style-dependent-on-mode)
- [Don't lose selection when shifting sidewards](#dont-lose-selection-when-shifting-sidewards)
- [Reload a file on saving](#reload-a-file-on-saving)
- [Smarter cursorline](#smarter-cursorline)
- [Faster keyword completion](#faster-keyword-completion)
- [Cosmetic changes to colorschemes](#cosmetic-changes-to-colorschemes)

## [Commands](#commands-1)

- [:global and :vglobal](#global-and-vglobal) - Execute a command on all matching lines.
- [:normal and :execute](#normal-and-execute) - The scripting dream team.
- [:redir](#redir) - Redirect messages.

## [Debugging](#debugging-1)

- [General tips](#general-tips)
- [Verbosity](#verbosity)
- [Profiling startup time](#profiling-startup-time)
- [Profiling at runtime](#profiling-at-runtime)
- [Debugging Vim scripts](#debugging-vim-scripts)
- [Debugging syntax files](#debugging-syntax-files)

## [Miscellaneous](#miscellaneous-1)

- [Additional resources](#additional-resources)
- [Vim distributions](#vim-distributions)
- [Standard plugins](#standard-plugins)
- [Map CapsLock to Control](#map-capslock-to-control)
- [Easter eggs](#easter-eggs)
- [Why hjkl for navigation?](#why-hjkl-for-navigation)

## [Common problems](#common-problems-1)

- [Editing small files is slow](#editing-small-files-is-slow)
- [Editing huge files is slow](#editing-huge-files-is-slow)
- [Bracketed paste (or why do I have to set 'paste' all the time?)](#bracketed-paste-or-why-do-i-have-to-set-paste-all-the-time)
- [Delays when using escape key in terminal](#delays-when-using-escape-key-in-terminal)
- [Function search undo](#function-search-undo)

## [Technical quirks](#technical-quirks-1)

- [Newline used for NUL](#newline-used-for-nul)

## [List of colorschemes](#list-of-colorschemes-1)

## [List of plugins](contents/plugins.md)
