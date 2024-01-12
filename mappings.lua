-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    ["<leader>lc"] = {
      "<cmd>!cd ~/Documents/projects/lanterndb/build && C_INCLUDE_PATH=/usr/local/include CPLUS_INCLUDE_PATH=/usr/local/include cmake -DUSEARCH_NO_MARCH_NATIVE=ON -DCMAKE_BUILD_TYPE=Debug .. && C_INCLUDE_PATH=/usr/local/include CPLUS_INCLUDE_PATH=/usr/local/include  make install<cr>",
      desc = "Build and install lantern",
    }, -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    ["<leader>wq"] = { "<cmd>wq<cr>", desc = "Save and close" },
    ["<leader>fg"] = { "<cmd>Telescope live_grep<cr>" }, -- telescope find files
    [",p"] = { '"0p' }, -- paste from copy register
    [",P"] = { '"0P' }, -- paste from copy register
    [":Ex"] = { ":e %:h", desc = { "Open current dir" } },
    ["<leader>go"] = {
      function() require("git-link.main").copy_line_url() end,
      desc = { "Copy remote URL" },
    },

    ["<C-h>"] = { "<cmd>NvimTmuxNavigateLeft<cr>" },
    ["<C-j>"] = { "<cmd>NvimTmuxNavigateDown<cr>" },
    ["<C-k>"] = { "<cmd>NvimTmuxNavigateUp<cr>" },
    ["<C-l>"] = { "<cmd>NvimTmuxNavigateRight<cr>" },
    ["<C-\\>"] = { "<cmd>NvimTmuxNavigateLastActive<cr>" },
    ["<C-Space>"] = { "<cmd>NvimTmuxNavigateNext<cr>" },
  },
  v = {
    [",p"] = { '"0p' }, -- paste from copy register
    [",P"] = { '"0P' }, -- paste from copy register
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
