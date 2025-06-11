return {
--   "ray-x/lsp_signature.nvim",
--   opts = {
--     floating_window = false,   -- Use no floating window (or virtual text) for signature hints
--     hint_enable = true,         -- Disable inline signature hints
--     hint_prefix = " ",          -- (Optional) Your preferred prefix (won't be displayed if hints are disabled)
--     bind = true,
--     handler_opts = {
--       border = "rounded",
--     },
--     -- Use the callback to update a buffer variable with the current signature
--     on_signature_update = function(signature, ctx)
--   if signature and signature.result then
--     local sig = signature.result.signature or ""
--     vim.notify("Signature: " .. sig)
--     vim.b.lsp_signature = sig
--   else
--     vim.b.lsp_signature = ""
--   end
-- end,

--   },
}
