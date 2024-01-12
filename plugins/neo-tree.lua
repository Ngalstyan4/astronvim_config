return {
  "nvim-neo-tree/neo-tree.nvim",
  window = {
    mappings = {
      ["P"] = function(state)
        local node = state.tree:get_node()
        require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
      end,
    },
  },

  filesystem = {
    filtered_items = {
      visible = true,
      hide_dotfiles = false,
      -- hide_gitignore = false,
      hide_by_name = {
        -- '.git',
        -- '.DS_Store',
        -- 'thumbs.db',
      },
    },
  },
}
