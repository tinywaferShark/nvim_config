-- ~/.config/nvim/lua/user/snippets/common.lua (or systemverilog.lua)

local ls = require("luasnip")
-- Snippet nodes
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local f = ls.function_node
-- Helper for formatting strings with nodes
local fmt = require("luasnip.extras.fmt").fmt

-- Define the header snippet
local header_snippet = s("header", fmt(
[[
// /////////////////////////////////////////////////////////////////////////////
// File Name      : {}
// Author         : {}
// Created Time   : {}
// Function       : {}
// Version        : V1.0
// /////////////////////////////////////////////////////////////////////////////

{}
]],
  {
    -- Placeholder 1: File Name (dynamic)
    f(function()
      -- Get current file name, or 'untitled' if buffer has no name
      return vim.fn.expand('%:t') or "untitled"
    end, {}),

    -- Placeholder 2: Author (dynamic from environment variable)
    f(function()
      -- Try USER, then USERNAME, else fallback
      return os.getenv('USER') or os.getenv('USERNAME') or "Your Name"
    end, {}),

    -- Placeholder 3: Creation Time (dynamic)
    f(function()
      -- Format: YYYY-MM-DD HH:MM:SS
      return os.date('%Y-%m-%d %H:%M:%S')
    end, {}),

    -- Placeholder 4: File Function (user input)
    -- This will be the first place the cursor stops
    i(1, "Enter file function description here"),

    -- Placeholder 5: Final cursor position after snippet expansion
    i(0)
  }
))

-- Decide which filetypes this snippet applies to
-- Option A: Apply to ALL filetypes
ls.add_snippets("all", { header_snippet })

-- Option B: Apply ONLY to SystemVerilog and Verilog
-- ls.add_snippets({"systemverilog", "verilog"}, { header_snippet })


-- Important: Return the snippets table if using Lua Loader later (optional but good practice)
-- return { header_snippet } -- Uncomment if using from_lua loader for this file specifically
