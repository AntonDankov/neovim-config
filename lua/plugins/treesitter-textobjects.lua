return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "python", "lua", "javascript", "c", "cpp", "zig" }, -- list your languages here
      highlight = {
        enable = true,
      },
      textobjects = {
        select = {
          enable = true,               -- Enable selection text objects
          lookahead = true,            -- Automatically jump forward to text object
          keymaps = {
            ["af"] = "@function.outer",  -- 'a function' text object
            ["if"] = "@function.inner",  -- 'inner function' text object
            ["ac"] = "@class.outer",     -- 'a class' text object
            ["ic"] = "@class.inner",     -- 'inner class' text object
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]m"] = "@function.outer",
            ["]]"] = "@class.outer",
          },
          goto_previous_start = {
            ["[m"] = "@function.outer",
            ["[["] = "@class.outer",
          },
        },
      },
    })
  end,
}
