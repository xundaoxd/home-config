function LoadConf(fname)
    exe "so" stdpath("config") . "/conf/" . a:fname
endfunc

for s in ["basic.vim", "keymaps.vim", "plugins.vim"]
    call LoadConf(s)
endfor
