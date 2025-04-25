--// /////////////////////////////////////////////////////////////////////////////
--// File Name      : luasnip.lua
--// Author         : Your Name
--// Created Time   : 2025-04-24 17:56:35
--// Function       : Enter file function description here
--// Version        : V1.0
--// /////////////////////////////////////////////////////////////////////////////


return{
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      -- Keep other dependencies like friendly-snippets if you use them
      "rafamadriz/friendly-snippets",
    },
    config = function(plugin, opts)
      -- Include the default astronvim config
      require "astronvim.plugins.configs.luasnip"(plugin, opts)

      local ls = require "luasnip"

      -- Load other snippet collections if needed
      require("luasnip.loaders.from_vscode").lazy_load()

      -- *** ADD THIS LINE to load your custom snippet file ***
      require("user.snippets.common") -- Use the path matching where you saved the file
      -- or require("user.snippets.systemverilog") if you named it that way

      -- Other customizations (like filetype_extend) can remain here
      ls.filetype_extend("javascript", { "javascriptreact" })
      -- Maybe extend verilog/systemverilog if needed
      ls.filetype_extend("verilog", { "systemverilog" })

    end,
  },


}
