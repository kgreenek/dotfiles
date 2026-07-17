return {
  "saghen/blink.cmp",
  version = "1.*",
  dependencies = {
    { "saghen/blink.compat", version = "2.*" },
    "alexander-born/cmp-bazel",
  },
  opts = {
    keymap = {
      preset = "none",
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<C-j>"] = { "select_next", "fallback" },
      ["<C-b>"] = { "scroll_documentation_up", "fallback" },
      ["<C-f>"] = { "scroll_documentation_down", "fallback" },
      ["<C-Space>"] = { "show", "fallback" },
      ["<C-e>"] = { "hide", "fallback" },
      ["<CR>"] = { "accept", "fallback" },
      ["<Tab>"] = { "select_next", "fallback" },
      ["<S-Tab>"] = { "select_prev", "fallback" },
    },
    cmdline = {
      sources = { "cmdline" },
    },
    sources = {
      default = { "lsp", "path", "buffer", "bazel" },
      providers = {
        bazel = {
          name = "bazel",
          module = "blink.compat.source",
          score_offset = -3,
        },
      },
    },
    completion = {
      list = {
        selection = {
          auto_insert = false,
        },
      },
      menu = {
        draw = {
          columns = {
            { "kind_icon" },
            { "label", "label_description", gap = 1 },
            { "source_name" },
          },
          components = {
            source_name = {
              text = function(ctx)
                local labels = {
                  lsp = "[LSP]",
                  bazel = "[Bazel]",
                  buffer = "[Buffer]",
                  path = "[Path]",
                  cmdline = "[Cmd]",
                }
                return labels[ctx.source_name] or ("[" .. ctx.source_name .. "]")
              end,
            },
          },
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
      },
    },
  },
}
