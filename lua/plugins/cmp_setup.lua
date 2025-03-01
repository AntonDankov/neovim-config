--return {
--  "saghen/blink.cmp",
--  -- Make blink.cmp toogleable
--  opts = function(_, opts)
--    local completion_toggle = Snacks.toggle({
--      name = "Completion",
--      get = function()
--        return vim.b.completion
--      end,
--      set = function(state)
--        vim.b.completion = state
--      end,
--    })
--
--    -- Define a function that toggles completion
--    local function toggle_completion()
--      -- If completion is currently active, close it first
--      require("blink.cmp").hide()
--      completion_toggle:toggle() -- Flip the state
--    end
--    vim.keymap.set({ "i", "n" }, "<C-q>", toggle_completion, { desc = "Toggle Completion" })
--    opts.enabled = function()
--      return vim.b.completion
--    end
--    opts.keymap = {
--      preset = "default",
--    }
--
--    return opts
--  end,
--}

local function custom_tab(cmp)
	  -- Initialize our buffer-local flag if needed.
	  if vim.b._tab_pressed == nil or vim.b._tab_pressed == false then
		vim.b._tab_pressed = true
		-- On first press, show the completion menu.
		return cmp.action("show")
	  else
		-- On subsequent presses, select the next item.
		return cmp.action("select_next")
	  end
	end

	-- Reset the flag when leaving Insert mode to start a new session.
	vim.api.nvim_create_autocmd("InsertLeave", {
	  callback = function()
		vim.b._tab_pressed = false
	  end,
	})
	
-- Helper function to check if there's a word before the cursor.
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  if col == 0 then
    return false
  end
  local text = vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]
  return text:sub(col, col):match("%s") == nil
end

return {
  "saghen/blink.cmp",
  -- optional: provides snippets for the snippet source
  dependencies = "rafamadriz/friendly-snippets",

  -- use a release tag to download pre-built binaries
  version = "*",
  -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  -- build = 'cargo build --release',
  -- If you use nix, you can build from source using latest nightly rust with:
  -- build = 'nix run .#build-plugin',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- 'default' for mappings similar to built-in completion
    -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
    -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
    -- See the full "keymap" documentation for information on defining your own keymap.
	
    keymap = { preset = "none",
		--['<Tab>'] = { function (cmp)
		--	if cmp.is_visible() then
		--		--vim.b._autfill_started = true
		--		-- On first press, show the completion menu.
		--		return cmp.select_next()
		--	else return cmp.show() end
		--end,
		--'fallback' },
		["<Tab>"] = {
			function(cmp, fallback)
			  -- Only trigger autocomplete if there's a word before the cursor.
			  if not has_words_before() then
				return cmp.cancel()
			  end
			  --cmp.show({
				--callback = function()
				  cmp.select_prev()
				   cmp.select_next()
				   return cmp.show()
				  --return cmp.fallback()
				--end
			  --})
			end,
			'select_next',
			'fallback'
		  },
		  ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
		--['<Tab>'] = {'show','fallback'},
		--['<Up>'] = { 'select_prev', 'fallback' },
		--['<Down>'] = { 'snippet_forward', 'fallback' },
	},

    appearance = {
      -- Sets the fallback highlight groups to nvim-cmp's highlight groups
      -- Useful for when your theme doesn't support blink.cmp
      -- Will be removed in a future release
      use_nvim_cmp_as_default = true,
      -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = "mono",
    },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      -- default = { "lsp", "path", "snippets", "buffer" },
      default = { "buffer", "lsp" },
    },
	completion = {
	trigger = {
		show_in_snippet = false,
	},
	list = {
		selection = {
			preselect = true,
			auto_insert = true,
		},
		cycle = {
			-- When `true`, calling `select_next` at the _bottom_ of the completion list
			-- will select the _first_ completion item.
			from_bottom = true,
			-- When `true`, calling `select_prev` at the _top_ of the completion list
			-- will select the _last_ completion item.
			from_top = true,
		  },
	},
	
		menu = {
		auto_show = false,
			draw = {
			 -- columns = { 
			  --{ "label", "label_description", gap = 1 }, { "kind" }, { "source_name" }  
			  --},
			  -- treesitter = { "lsp" },
			  --components = {
				--kind = {
				--  text = function(ctx) return ctx.source_name == "cmdline" and "" or ctx.kind end,
				--},
				--source_name = {
				--  text = function(ctx) return false end,
				--},
			  --},
			}
		}
	},
	
  },
  opts_extend = { "sources.default" },
  
}



