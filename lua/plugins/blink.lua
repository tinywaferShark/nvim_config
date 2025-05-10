return {
  "Saghen/blink.cmp",
  opts = function(_, opts)
    opts.keymap = { preset = 'default' }
    opts.appearance = { nerd_font_variant = 'mono' }
    opts.completion = { documentation = { auto_show = false } }

    -- 新增 fuzzy.prebuilt_binaries 配置
    opts.fuzzy = opts.fuzzy or {}
    opts.fuzzy.prebuilt_binaries = opts.fuzzy.prebuilt_binaries or {}
    opts.fuzzy.prebuilt_binaries.ignore_version_mismatch = true

    -- 设置默认启用的补全源
    opts.sources = opts.sources or {}
    opts.sources.default = { "lsp", "path", "snippets", "buffer", "cmdline" }

    -- 设置各补全源的优先级和显示名称
    opts.sources.providers = vim.tbl_deep_extend("force", opts.sources.providers or {}, {
      lsp = {
        name = "LSP",
        score_offset = 0,
      },
      path = {
        name = "Path",
        score_offset = 1,
      },
      snippets = {
        name = "Snippets",
        score_offset = -1,
      },
      buffer = {
        name = "Buffer",
        score_offset = -2,
      },
      cmdline = {
        name = "Cmdline",
        score_offset = -1,
      },
    })

    return opts
  end,
}
