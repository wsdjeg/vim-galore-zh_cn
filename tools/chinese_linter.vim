scriptencoding utf-8
let s:ERRORS = {
            \ 'E001' : ['中文字符后使用英文标点', '[^a-zA-Z],'],
            \ 'E002' : ['中英文之间需要增加空格', ''],
            \ 'E003' : ['中文与数字之间需要增加空格', ''],
            \ 'E004' : ['数字与单位之间需要增加空格', ''],
            \ 'E005' : ['全角标点与其他字符之间不加空格', ''],
            \ 'E006' : ['不重复使用标点符号', ''],
            \ 'E007' : ['使用全角中文标点', ''],
            \ 'E008' : ['数字使用半角字符', ''],
            \ 'E009' : ['遇到完整的英文整句、特殊名词，其內容使用半角标点', ''],
            \ }
command! -nargs=? CheckChinese call s:check(<q-args>)

function! s:check(...) abort
    let s:file = getline(1,'$')
    let s:bufnr = bufnr('$')
    let s:linenr = 0
    let s:colnr = 0
    let s:qf = []
    for l:line in s:file
        let s:linenr += 1
        call s:parser(l:line)
    endfor
    let s:linenr = 0
    let s:colnr = 0
    if !empty(s:qf)
        let g:wsd = s:qf
        call s:update_qf(s:qf)
        copen
    else
        call setqflist([])
    endif
endfunction

function! s:parser(line) abort
    for l:error_nr in keys(s:ERRORS)
        call s:find_error(l:error_nr, a:line)
    endfor
endfunction

function! s:find_error(nr, line) abort
    let l:error = s:ERRORS[a:nr]
    let s:colnr = matchend(a:line, l:error[1])
    if s:colnr != -1
        call s:add_to_qf(a:nr)
    endif
endfunction

function! s:add_to_qf(nr) abort
    let l:error_item = {
                \ 'bufnr' : s:bufnr,
                \ 'lnum' : s:linenr,
                \ 'col' : s:colnr,
                \ 'vcol' : 0,
                \ 'text' : s:ERRORS[a:nr][0],
                \ 'nr' : a:nr,
                \ 'type' : 'E'
                \ }
    call add(s:qf, l:error_item)
endfunction

" TODO 加入语法分析


function! s:update_qf(dict) abort
    call setqflist(a:dict)
endfunction
