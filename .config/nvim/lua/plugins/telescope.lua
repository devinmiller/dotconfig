return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-file-browser.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      -- Useful for getting pretty icons, but requires a Nerd Font.
      { 'nvim-tree/nvim-web-devicons',              enabled = vim.g.have_nerd_font },
    },
    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")
      local action_set = require("telescope.actions.set")

      --- Perform 'horizontal' action on selection, usually something like
      ---`:topleft new <selection>`
      --- or if `splitblow = true`
      ---`:botright new <selection`
      ---
      --- i.e. open the selection in a new full width horizontal split
      ---@param prompt_bufnr number: The promp bufnr
      local select_full_horizontal = function(prompt_bufnr)
        if vim.o.splitbelow then
          return action_set.edit(prompt_bufnr, "botright new")
        else
          return action_set.edit(prompt_bufnr, "topleft new")
        end
      end

      --- Perform 'vertical' action on selection, usually something like
      ---`:topleft vnew <selection>`
      --- or if `splitright = true`
      ---`:botright vnew <selection`
      ---
      --- i.e. open the selection in a new full height vertical split
      ---@param prompt_bufnr number: The promp bufnr
      local select_full_vertical = function(prompt_bufnr)
        if vim.o.splitright then
          return action_set.edit(prompt_bufnr, "botright vnew")
        else
          return action_set.edit(prompt_bufnr, "topleft vnew")
        end
      end

      local mappings = {
        n = {
          ["X"] = select_full_horizontal,
          ["V"] = select_full_vertical
        }
      }

      telescope.setup({
        defaults = {
          mappings = mappings,
          initial_mode = "normal"
        },
        pickers = {
          help_tags = {
            theme = "ivy"
          },
          find_files = {
            theme = "ivy"
          },
          buffers = {
            theme = "ivy"
          }
        },
        extensions = {
          fzf = {},
        }
      })

      telescope.load_extension("fzf")

      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [Help]" })
      vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[F]ind [K]eymaps" })
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
      vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[F]ind [B]uffers" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind by [G]rep" })
    end
  }
}
