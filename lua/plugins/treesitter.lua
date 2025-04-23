---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      --"verilog",
      "bash",
      "python",
      "c",
      "tcl",
      "yaml",
      "json",
      "toml",
      "csv",
      "make",
      -- add more arguments for adding more treesitter parsers
    },
  },
}
