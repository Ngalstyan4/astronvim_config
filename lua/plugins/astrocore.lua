-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics = { virtual_text = true, virtual_lines = false }, -- diagnostic settings on startup
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- passed to `vim.filetype.add`
    filetypes = {
      -- see `:h vim.filetype.add` for usage
      extension = {
        foo = "fooscript",
      },
      filename = {
        [".foorc"] = "fooscript",
      },
      pattern = {
        [".*/etc/foo/.*"] = "fooscript",
      },
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },

        ["<Leader>lt"] = {
          function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end,
          desc = "Toggle inlay hints",
        },

        ["<Leader>fg"] = {
          function() require("snacks").picker.grep() end,
        },
        ["<Leader>fG"] = {
          function()
            -- vim.ui.input({ prompt = "Enter file type:" }, function(type_name)
            local ll = io.popen("rg --type-list | awk -F ':' '{print $1}'"):lines()
            local tt = {}
            for l in ll do
              table.insert(tt, l)
            end

            vim.ui.select(tt, { prompt = "Enter file Type:" }, function(type_name)
              if not type_name then return end
              require("snacks").picker.grep { ft = type_name }
            end)
          end,
          desc = "grep for given file type",
        },
        ["<Leader>fh"] = {
          function() require("snacks").picker.search_history() end,
        },
        ["<Leader>ch"] = {
          function() require("snacks").picker.command_history() end,
        },
        ["<Leader>uh"] = {
          function() require("snacks").picker.undo() end,
        },
        -- remove default lsp mappings
        ["gra"] = false,
        ["grn"] = false,
        ["grr"] = false,
        -- add picker lsp reference finder mapping
        ["gr"] = {
          function() require("snacks").picker.lsp_references() end,
          desc = "Find References with Picker",
        },
        [":Ex"] = { ":e %:h", desc = "Open current dir" },
        ["<Leader>go"] = {
          function() vim.notify "todo:: install chosen github copier dependency" end,
          desc = "Copy remote URL",
        },
        ["<Leader>lF"] = {

          function()
            vim.g.autoformat = not vim.g.autoformat
            vim.notify("Autoformat: " .. (vim.g.autoformat and "enabled" or "disabled"))
          end,
          desc = "Toggle autoformat",
        },
        ["<Leader>C"] = { function() require("astrocore.buffer").close() end, desc = "Close buffer" },

        ["<Leader>rr"] = { "<cmd>RustLsp run<cr>", desc = "Run rust code" },
        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- ["<Leader>b"] = { desc = "Buffers" },

        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,
      },
      x = {
        ["gra"] = false,
      },
    },
  },
}
