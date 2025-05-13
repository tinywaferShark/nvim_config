return {
  "Saghen/blink.cmp",
  opts = function(_, opts)
    opts.keymap = {
      ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
      ["<C-N>"] = { "select_next", "show" },
      ["<C-P>"] = { "select_prev", "show" },
      ["<C-J>"] = { "select_next", "fallback" },
      ["<C-K>"] = { "select_prev", "fallback" },
      ["<C-U>"] = { "scroll_documentation_up", "fallback" },
      ["<C-D>"] = { "scroll_documentation_down", "fallback" },
      ["<C-e>"] = { "hide", "fallback" },
      ["<CR>"] = { "accept", "fallback" },
      ["<Tab>"] = {
        "select_next",
        "snippet_forward",
        function(cmp)
          if vim.fn.col('.') > 1 or vim.api.nvim_get_mode().mode == "c" then return cmp.show() end
        end,
        "fallback",
      },
      ["<S-Tab>"] = {
        "select_prev",
        "snippet_backward",
        function(cmp)
          if vim.api.nvim_get_mode().mode == "c" then return cmp.show() end
        end,
        "fallback",
      },
    }

    opts.appearance = { nerd_font_variant = 'mono' }
    opts.completion = { documentation = { auto_show = false } }

    opts.fuzzy = opts.fuzzy or {}
    opts.fuzzy.prebuilt_binaries = opts.fuzzy.prebuilt_binaries or {}
    opts.fuzzy.prebuilt_binaries.ignore_version_mismatch = true

    opts.sources = opts.sources or {}
    opts.sources.default = { "lsp", "path", "snippets", "buffer", "cmdline" }

    opts.sources.providers = vim.tbl_deep_extend("force", opts.sources.providers or {}, {
      lsp = { name = "LSP", score_offset = 0 },
      path = { name = "Path", score_offset = 1 },
      snippets = { name = "Snippets", score_offset = -1 },
      buffer = { name = "Buffer", score_offset = -2 },
      cmdline = { name = "Cmdline", score_offset = -1 },
    })

    return opts
  end,
}
