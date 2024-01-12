# https://code.mehalter.com/AstroNvim_user/~files/master/highlights/astrotheme.lua
# todo:: this does not work rn. initially did it to figure out hot configure normal and normalNC
return function()
  local astro = require("astrotheme")
  local C = require("astrotheme.lib.util").set_palettes(require("astrotheme").config)
  for k, v in pairs(C.ui) do
    print("haha, ", k, v)
  end
  local get_hlgroup = require("astronvim.utils").get_hlgroup
  -- get highlights from highlight groups
  local normal = get_hlgroup "Normal"
  local fg, bg = normal.fg, normal.bg
  local bg_alt = get_hlgroup("Visual").bg
  local green = get_hlgroup("String").fg
  local red = get_hlgroup("Error").fg
  -- return a table of highlights for telescope based on colors gotten from highlight groups
  return {
   Normal = { bg = "#0000ff" },
    inactive = {
      a = { fg = C.ui.text_inactive, bg = "#00ff00", gui = "bold" },
      b = { fg = C.ui.text_inactive, bg = "#00ff00", gui = "bold" },
      c = { fg = C.ui.text_inactive, bg = "#00ff00", gui = "bold" },
    },
  }
end
