--if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics = { virtual_text = true, virtual_lines = false }, -- diagnostic settings on startup
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- passed to `vim.filetype.add`
    filetypes = {
      -- see `:h vim.filetype.add` for usage
      extension = {
        foo = "fooscript",
      },
      filename = {
        [".foorc"] = "fooscript",
      },
      pattern = {
        [".*/etc/foo/.*"] = "fooscript",
      },
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs
        -- ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        -- ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- 新增 buffer 跳转快捷键
        ["gt"] = {
          function() require("astrocore.buffer").nav(vim.v.count1) end,
          desc = "Next buffer",
          nowait = true,
          noremap = true,
        },
        ["gT"] = {
          function() require("astrocore.buffer").nav(-vim.v.count1) end,
          desc = "Previous buffer",
          nowait = true,
          noremap = true,
        },

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },
        ["<Leader>f<CR>"] = { function() require("telescope.builtin").resume() end, desc = "恢复上次查找" },
        ["<Leader>f'"]   = { function() require("telescope.builtin").marks() end, desc = "查找 marks" },
        ["<Leader>fl"]   = { function() require("telescope.builtin").current_buffer_fuzzy_find() end, desc = "查找当前 buffer 行" },
        ["<Leader>fa"]   = {
          function()
            require("telescope.builtin").find_files { cwd = vim.fn.stdpath "config" }
          end,
          desc = "查找 AstroNvim 配置文件",
        },
        ["<Leader>fb"]   = { function() require("telescope.builtin").buffers() end, desc = "查找 buffers" },
        ["<Leader>fc"]   = { function() require("telescope.builtin").grep_string() end, desc = "查找光标下单词" },
        ["<Leader>fC"]   = { function() require("telescope.builtin").commands() end, desc = "查找命令" },
        ["<Leader>ff"]   = { function() require("telescope.builtin").find_files() end, desc = "查找文件" },
        ["<Leader>fF"]   = {
          function()
            require("telescope.builtin").find_files { hidden = true, no_ignore = true }
          end,
          desc = "查找所有文件",
        },
        ["<Leader>fg"]   = { function() require("telescope.builtin").git_files() end, desc = "查找 git 文件" },
        ["<Leader>fh"]   = { function() require("telescope.builtin").help_tags() end, desc = "查找帮助" },
        ["<Leader>fk"]   = { function() require("telescope.builtin").keymaps() end, desc = "查找按键映射" },
        ["<Leader>fm"]   = { function() require("telescope.builtin").man_pages() end, desc = "查找 man 手册" },
        ["<Leader>fn"]   = { function() require("telescope.builtin").notifications() end, desc = "查找通知" }, -- 需要 telescope-notify 插件
        ["<Leader>fo"]   = { function() require("telescope.builtin").oldfiles() end, desc = "查找最近文件" },
        ["<Leader>fp"]   = { function() require("telescope.builtin").projects() end, desc = "查找项目" }, -- 需要 telescope-project.nvim 插件
        ["<Leader>fr"]   = { function() require("telescope.builtin").registers() end, desc = "查找寄存器" },
        ["<Leader>fs"]   = { function() require("telescope.builtin").buffers() end, desc = "查找 buffer/最近/文件" },
        ["<Leader>ft"]   = { function() require("telescope.builtin").colorscheme() end, desc = "查找主题" },
        ["<Leader>fw"]   = { function() require("telescope.builtin").live_grep() end, desc = "查找内容" },
        ["<Leader>fW"]   = {
          function()
            require("telescope.builtin").live_grep { additional_args = function() return { "--hidden", "--no-ignore" } end }
          end,
          desc = "查找所有文件内容",
        },
        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- ["<Leader>b"] = { desc = "Buffers" },

        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,
      },
    },
  },
}
