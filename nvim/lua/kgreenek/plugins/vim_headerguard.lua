return {
  "drmikehenry/vim-headerguard",
  config = function()
    vim.cmd([[
      function! g:HeaderguardName()
        let relpath = substitute(expand("%:p"), getcwd() . "/" , "", "")
        return toupper(substitute(relpath, "[^0-9a-zA-Z_]", "_", "g")) . "_"
      endfunction
    ]])

    vim.cmd([[
      function! g:HeaderguardLine3()
        return "#endif  // " . g:HeaderguardName()
      endfunction
    ]])
  end,
}
