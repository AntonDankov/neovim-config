--return {
--  {
--    "ellisonleao/gruvbox.nvim",
--    priority = 1000,  -- ensure it loads early
--    config = function()
--      -- Optionally configure Gruvbox here:
--      require("gruvbox").setup({
--        -- any configuration options you prefer
--        contrast = "hard",  -- or "soft", "medium"
--      })
--      vim.cmd("colorscheme gruvbox")
--    end,
--  },
--}
--return {
--{
--      'sainnhe/everforest',
--      lazy = false,
--      priority = 1000,
--      config = function()
--        -- Optionally configure and load the colorscheme
--        -- directly inside the plugin declaration.
--        vim.g.everforest_enable_italic = true
--        vim.cmd.colorscheme('everforest')
--      end
--    },
--}
--return {
--{
--      'sainnhe/gruvbox-material',
--      lazy = false,
--      priority = 1000,
--      config = function()
--        -- Optionally configure and load the colorscheme
--        -- directly inside the plugin declaration.
--        vim.g.gruvbox_material_enable_italic = true
--        vim.cmd.colorscheme('gruvbox-material')
--      end
--    },
--}

return {


{
      'sainnhe/sonokai',
      lazy = false,
      priority = 1000,
      config = function()
        -- Optionally configure and load the colorscheme
        -- directly inside the plugin declaration.
        vim.g.sonokai_enable_italic = true
        vim.cmd.colorscheme('sonokai')
      end
    }




}
	