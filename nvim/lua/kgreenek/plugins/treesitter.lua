local langs = {
  "arduino",
  "bash",
  "c",
  "capnp",
  "cmake",
  "cpp",
  "css",
  "csv",
  "cuda",
  "dockerfile",
  "git_config",
  "git_rebase",
  "gitattributes",
  "gitcommit",
  "gitignore",
  "glsl",
  "gnuplot",
  "go",
  "helm",
  "hlsl",
  "html",
  "http",
  "ini",
  "java",
  "javascript",
  "json",
  "json5",
  "jsonnet",
  "julia",
  "kotlin",
  "latex",
  "llvm",
  "lua",
  "luadoc",
  "make",
  "meson",
  "ninja",
  "nix",
  "objc",
  "ocaml",
  "perl",
  "printf",
  "proto",
  "python",
  "r",
  "regex",
  "ruby",
  "rust",
  "scss",
  "slint",
  "sql",
  "ssh_config",
  "starlark",
  "swift",
  "terraform",
  "tmux",
  "todotxt",
  "toml",
  "typescript",
  "udev",
  "vim",
  "vimdoc",
  "xml",
  "yaml",
}

return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false, -- main explicitly does not support lazy-loading.
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup({
      ensure_installed = langs,
    })

    -- Enable treesitter features on filetypes that have a parser installed.
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        local ft = vim.bo[args.buf].filetype
        local lang = vim.treesitter.language.get_lang(ft)
        if not lang then
          return
        end

        -- Highlighting (Neovim built-in)
        pcall(vim.treesitter.start, args.buf, lang)

        -- Indentation (nvim-treesitter provides indentexpr; experimental on main)
        if ft ~= "yaml" then
          vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end,
}
