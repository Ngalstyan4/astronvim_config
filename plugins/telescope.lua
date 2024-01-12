return {
  "telescope.nvim",
  -- opts = function(_, opt)
  -- require("telescope").setup {
  opts = {
    defaults = {
      vimgrep_arguments = {
        "rg",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "-L",
        "--column",
        "--smart-case",
      },
    },
    pickers = {
      find_files = {
        follow = true,
      },
    },
  },
}
