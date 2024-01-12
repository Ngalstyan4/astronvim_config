return function()
  local astro = require "astrotheme"
  local C = require("astrotheme.lib.util").set_palettes(require("astrotheme").config)
  -- return a table of highlights for telescope based on colors gotten from highlight groups
  return {
    -- for color palettes: https://github.com/AstroNvim/astrotheme/blob/main/lua/astrotheme/palettes/astrodark.lua
    -- Normal = { bg = "#0000ff" },
    NormalNC = { bg = "#26282D" },
    -- haha = { bg = "#000000" },
  }
end
