return {
  -- Disable bufferline
  { "akinsho/bufferline.nvim", enabled = false },

  -- Use barbar instead
  {
    "romgrk/barbar.nvim",
    dependencies = {
      "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
      "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
    },
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      -- animation = true,
      -- insert_at_start = true,
      -- …etc.
      icons = {
        buffer_index = true,
      },
      sidebar_filetypes = {
        -- Or, specify the event which the sidebar executes when leaving:
        ["neo-tree"] = { text = "Explorer (Neo-tree)", event = "BufWipeout" },
      },
      no_name_title = "(New file)",
    },
    version = "^1.0.0", -- optional: only update when a new 1.x version is released
  },
}
