return {
  -- 覆盖 blink.cmp 插件的配置
  "Saghen/blink.cmp",
  opts = function(_, opts) -- 使用函数形式确保与默认配置合并
    -- 1. 确保 'path' 和 'buffer' 源在默认启用的列表中
    --    我们使用 vim.list_extend 并去重来安全地添加，避免重复
    local default_sources = vim.list_extend(opts.sources.default or {}, { "path", "buffer" })
    -- 去重 (简单实现)
    local unique_defaults = {}
    local seen = {}
    for _, src in ipairs(default_sources) do
      if not seen[src] then
        table.insert(unique_defaults, src)
        seen[src] = true
      end
    end
    opts.sources.default = unique_defaults

    -- 2. (可选) 在 providers 中定义或调整它们的配置和优先级
    --    如果 providers 表还不存在，则创建它
    opts.sources.providers = opts.sources.providers or {}
    --    合并我们的配置，如果这些键已存在，则会覆盖；如果不存在，则添加。
    vim.tbl_deep_extend("force", opts.sources.providers, {
      path = {
        name = "Path", -- 补全项旁边显示的名称
        -- 你可以调整 score_offset 来改变优先级
        -- 正数更高，负数更低。0 通常是 LSP 的基准。
        score_offset = 1, -- 让文件路径优先级稍高（比 LSP 高一点）
        -- 通常不需要更多配置，除非你想自定义行为
      },
      buffer = {
        name = "Buffer", -- 显示名称
        -- buffer 中的词通常优先级较低
        score_offset = -2, -- 让它比 LSP 和 Snippets 优先级低
        -- 你可以添加 'opts' 子表来自定义 buffer 源的行为，
        -- 例如像文档示例中那样，指定从哪些 buffer 获取内容。
        -- opts = { ... }
      },
    })

    -- 返回修改后的 opts 表
    return opts
  end,
}
