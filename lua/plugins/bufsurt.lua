-- In your lua/plugins/bufsurf.lua file
return {
  {
    "ton/vim-bufsurf",
    event = "VeryLazy",
    config = function()
      -- Map Ctrl+Alt+Left and Ctrl+Alt+Right to buffer surf commands
      vim.keymap.set('n', '<C-A-Left>', '<Cmd>BufSurfBack<CR>', { desc = "Navigate to previous buffer in history" })
      vim.keymap.set('n', '<C-A-Right>', '<Cmd>BufSurfForward<CR>', { desc = "Navigate to next buffer in history" })
      vim.keymap.set('n', '<A-h>', '<Cmd>BufSurfBack<CR>', { desc = "Navigate to previous buffer in history" })
      vim.keymap.set('n', '<A-l>', '<Cmd>BufSurfForward<CR>', { desc = "Navigate to next buffer in history" })
   
    end,
  }
}
