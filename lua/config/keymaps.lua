-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

-- Out of terminal mode
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]])
-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Moving lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- //Moving camera up and down and cursor stays in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Search in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Append line
vim.keymap.set("n", "J", "mzJ`z")


-- next greatest remap ever : 
vim.keymap.set({"n", "v", "i"}, "<C-c>", [["+y]])
vim.keymap.set({"n", "v"}, "<C-v>", [["+p]])
vim.keymap.set("i", "<C-v>", "<C-r>+")
vim.keymap.set("n", "<A-v>", "<C-v>", { desc = "Enter Visual Block Mode" }) 
--vim.keymap.set("n", "<C-C>", [["+Y]])

-- paste without changing buffer (with selection)
vim.keymap.set({"n", "v"}, "<leader>d", "\"_d")

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Quick fix list
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Replace the word EVERYWHERE
-- vim.keymap.set("n", "<leader>;", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- replace the word and possible to jump with n and use . to replace
vim.keymap.set('n', '<leader>r', function()
  local word = vim.fn.expand('<cword>')
  -- Set the search register to match the whole word exactly
  vim.fn.setreg('/', '\\<' .. word .. '\\>')
  vim.opt.hlsearch = true
  -- Use vim.schedule with feedkeys to simulate "ciw" so that you enter insert mode
  vim.schedule(function()
    local keys = vim.api.nvim_replace_termcodes("ciw", true, true, true)
    vim.api.nvim_feedkeys(keys, 'n', false)
  end)
end, { noremap = true, silent = true })
-- replace selected text with something else:
vim.keymap.set("v", "<leader>rs", [[:<C-u>s/<C-r>"//g<Left><Left>]], { desc = "Replace selected text in scope" })





-- undotree plugin
vim.keymap.set('n', '<leader>z', vim.cmd.UndotreeToggle)

-- Normal mode: Create a new line below and enter Insert mode
vim.keymap.set("n", "<C-CR>", "o", { desc = "New line below and insert" })
-- Insert mode: Do the same without leaving Insert mode
vim.keymap.set("i", "<C-CR>", "<C-o>o", { desc = "New line below and insert" })

vim.keymap.set("n", "<Leader>sig", function()
  vim.notify("Current Signature: " .. (vim.b.lsp_signature or "nil"))
end, { desc = "Show LSP Signature" })

-- for indents to preserve on empty lines
