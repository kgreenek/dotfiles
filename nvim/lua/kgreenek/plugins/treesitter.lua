return {
  "nvim-treesitter/nvim-treesitter",
  build = function()
    local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
    ts_update()
  end,
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      -- One of "all", "maintained" (parsers with maintainers), or a list of languages.
      ensure_installed = {
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
      },
      sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
      ignore_install = { "" }, -- List of parsers to ignore installing
      autopairs = {
        enable = true,
      },
      highlight = {
        enable = true, -- false will disable the whole extension
        disable = { "" }, -- list of language that will be disabled
        -- This is disabled to improve performance.
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true, disable = { "yaml" } },
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
    })
  end,
}
