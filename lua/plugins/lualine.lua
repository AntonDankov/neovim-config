return {
--   "nvim-lualine/lualine.nvim",
--   opts = function(_, opts)
--     -- Make sure the sections table exists
--     opts.sections = opts.sections or {}
--     opts.sections.lualine_c = opts.sections.lualine_c or {}

--     -- Insert our custom signature component at the beginning of lualine_c
--     table.insert(opts.sections.lualine_c, 1, {
--       function()
--         if vim.b.lsp_signature and vim.b.lsp_signature ~= "" then
--           return "Sig: " .. vim.b.lsp_signature
--         else
--           return ""
--         end
--       end,
--       cond = function()
--         return vim.b.lsp_signature and vim.b.lsp_signature ~= ""
--       end,
--       color = { fg = "#a3be8c" },
--       separator = " ",
--     })
--     return opts
--   end,
}
