return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    formatting = {
      format_on_save = {
        enabled = false, -- 全局关闭保存自动格式化
        ignore_filetypes = { "markdown", "verilog", "systemverilog" },
      },
    },
    servers = { "prolog_lsp", "verible" },
    config = {
      prolog_lsp = {
        cmd = {
          "swipl",
          "-g",
          "use_module(library(lsp_server)).",
          "-g",
          "lsp_server:main",
          "-t",
          "halt",
          "--",
          "stdio",
        },
        filetypes = { "prolog" },
        root_dir = require("lspconfig.util").root_pattern("pack.pl"),
      },
    },
  },
}
