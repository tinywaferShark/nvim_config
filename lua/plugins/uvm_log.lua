return {
  -- 你的其他插件...

  {
    --dir = "~/Projects/uvm_log_highlight", -- 本地插件路径
    "tinywaferShark/sv_parser_hl.nvim",
    event = { "BufReadPre", "BufNewFile" },
    ft = { "uvm_log", "log" }, -- 文件类型触发
    config = function()
      require("uvm_log_highlight").setup({
        -- 这里可以传递你的自定义配置
      })
    end,
  },

  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup({
        timeout = vim.o.timeoutlen,
        default_mappings = false, -- 不加载默认映射
        mappings = {
          i = { j = { j = "<Esc>" } }, -- 只保留 insert 模式下 jj
        },
      })
    end,
  },

  -- 函数参数高亮（适合阅读 UVM/SV 大项目）
  {
    "m-demare/hlargs.nvim",
    event = "VeryLazy",
    config = function()
      require("hlargs").setup()
    end,
  },

  -- 快速跳转增强，使用 flash.nvim
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function() require("flash").jump() end,
        desc = "Flash Jump",
      },
    },
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "sindrets/diffview.nvim",        -- optional - Diff integration
      -- Only one of these is needed.
      "nvim-telescope/telescope.nvim", -- optional
    },
  },

  {
  "kevinhwang91/nvim-hlslens",
  -- event = "VeryLazy", -- lazy.nvim 会根据 keys 推断加载时机，但 event 也可以保留
    --keys = {
    --  {
    --    "n", -- 模式
    --    "n", -- 按键
    --    function() -- 执行的 Lua 函数
    --      local count = vim.v.count1 > 0 and vim.v.count1 or 1
    --      vim.cmd('normal! ' .. count .. 'n')
    --      -- 确保 hlslens 已经加载 (lazy.nvim 通常会处理好)
    --      require('hlslens').start()
    --    end,
    --    { noremap = true, silent = true, desc = "Hlslens next search result" } -- 选项和描述
    --  },
    --  {
    --    "n",
    --    "N",
    --    function()
    --      local count = vim.v.count1 > 0 and vim.v.count1 or 1
    --      vim.cmd('normal! ' .. count .. 'N')
    --      require('hlslens').start()
    --    end,
    --    { noremap = true, silent = true, desc = "Hlslens previous search result" }
    --  },
    --  { "n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], { noremap = true, silent = true, desc = "Hlslens search forward" } },
    --  { "n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], { noremap = true, silent = true, desc = "Hlslens search backward" } },
    --  { "n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], { noremap = true, silent = true, desc = "Hlslens search forward (no boundary)" } },
    --  { "n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], { noremap = true, silent = true, desc = "Hlslens search backward (no boundary)" } },
    --},
    config = function()
      -- config 函数现在只负责 setup
      require('hlslens').setup({
        calm_down = true,
        nearest_only = true,
        nearest_float_when = 'always'
      })
      -- 注意：按键映射已经移到上面的 keys 表中了
    end,
  }

  -- 你的其他插件...
}
