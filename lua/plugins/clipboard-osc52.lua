-- ensures that I can copy things inside nvim running inside docker or ssh
-- found at https://github.com/neovim/neovim/discussions/29350#discussioncomment-10299517
if vim.env.TMUX ~= nil then
  local copy = { "tmux", "load-buffer", "-w", "-" }
  local paste = { "bash", "-c", "tmux refresh-client -l && sleep 0.05 && tmux save-buffer -" }
  vim.g.clipboard = {
    name = "tmux",
    copy = {
      ["+"] = copy,
      ["*"] = copy,
    },
    paste = {
      ["+"] = paste,
      ["*"] = paste,
    },
    cache_enabled = 0,
  }
elseif vim.env.SSH_TTY ~= nil or vim.env.container ~= nil or vim.fn.filereadable("/.dockerenv") == 1 then
  vim.g.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = require("vim.ui.clipboard.osc52").copy "+",
      ["*"] = require("vim.ui.clipboard.osc52").copy "*",
    },
    paste = {
      ["+"] = require("vim.ui.clipboard.osc52").paste "+",
      ["*"] = require("vim.ui.clipboard.osc52").paste "*",
    },
  }
end

return {}
