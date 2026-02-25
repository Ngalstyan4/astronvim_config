-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.typescript" },

  -- https://github.com/AstroNvim/astrocommunity/tree/main/lua/astrocommunity/pack/rust
  --  NOTE: This pack DOES not add rust_analyzer. This should be managed by rustup.
  --         To add it to rustup, run: rustup component add rust-analyzer
  { import = "astrocommunity.pack.rust" },

  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.python-ruff" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.tailwindcss" },

  { import = "astrocommunity.pack.lua" },
  -- import/override with your plugins folder
}
