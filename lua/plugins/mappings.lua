return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- General mappings
        i = {
          -- In Insert mode, pressing 'ff' will switch to Visual mode
          ["FF"] = { "<ESC>v", desc = "Switch to Visual mode" },
        },
        n = {
          -- In Normal mode, pressing 'ff' will switch to Visual mode
          ["FF"] = { "v", desc = "Switch to Visual mode" },
          -- Navigate vim panes better
          ["<c-k>"] = { ":wincmd k<CR>", desc = "Move to pane up" },
          ["<c-j>"] = { ":wincmd j<CR>", desc = "Move to pane down" },
          ["<c-h>"] = { ":wincmd h<CR>", desc = "Move to pane left" },
          ["<c-l>"] = { ":wincmd l<CR>", desc = "Move to pane right" },
          -- Clear search highlight
          ["<leader>h"] = { ":nohlsearch<CR>", desc = "Clear search highlight" },
          -- Open file explorer with Ctrl-n
          ["<c-n>"] = { ":Neotree toggle<CR>", desc = "Toggle file explorer" },

          -- nvim leap keybinds
          vim.keymap.set({'n', 'x', 'o'}, 's',  '<Plug>(leap-forward)'),
          vim.keymap.set({'n', 'x', 'o'}, 'S',  '<Plug>(leap-backward)'),
          vim.keymap.set({'n', 'x', 'o'}, 'gs', '<Plug>(leap-from-window)'),
          vim.api.nvim_set_keymap('i', '<C-j>', '<ESC>', { noremap = true, silent = true, desc = "switch to normal mode" }),
        },
      },
    },
  },
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      mappings = {
        n = {
          -- LSP-specific mappings
          K = {
            function()
              vim.lsp.buf.hover()
            end,
            desc = "Hover symbol details",
          },
          gD = {
            function()
              vim.lsp.buf.declaration()
            end,
            desc = "Declaration of current symbol",
            cond = "textDocument/declaration",
          },
        },
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip"
    },
    config = function()
      local cmp = require'cmp'
      local luasnip = require'luasnip'

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = {
          ['<C-j>'] = cmp.mapping.select_next_item(),
          ['<C-k>'] = cmp.mapping.select_prev_item(),
          ['<Tab>'] = cmp.mapping.confirm({ select = true }),  -- Confirm selection with Tab
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.close(),
        },
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
        }, {
          { name = 'buffer' },
        })
      })
    end,
  },
-- ~/.config/nvim/lua/user/mappings.lua

  -- Existing plugin configurations...

  -- Add ChatGPT key mappings using the new which-key spec
  {
    "which-key.nvim", -- Ensure which-key is installed
    config = function()
      local wk = require("which-key")

      wk.register({
        ["<leader>k"] = { name = "ChatGPT" }, -- Group prefix

        -- ChatGPT Commands
        ["<leader>kc"] = { "<cmd>ChatGPT<CR>", "Open ChatGPT" },
        ["<leader>ke"] = { "<cmd>ChatGPTEditWithInstructions<CR>", "Edit with Instructions", mode = { "n", "v" } },
        ["<leader>kg"] = { "<cmd>ChatGPTRun grammar_correction<CR>", "Grammar Correction", mode = { "n", "v" } },
        ["<leader>kt"] = { "<cmd>ChatGPTRun translate<CR>", "Translate", mode = { "n", "v" } },
        ["<leader>kk"] = { "<cmd>ChatGPTRun keywords<CR>", "Keywords", mode = { "n", "v" } },
        ["<leader>kd"] = { "<cmd>ChatGPTRun docstring<CR>", "Docstring", mode = { "n", "v" } },
        ["<leader>ka"] = { "<cmd>ChatGPTRun add_tests<CR>", "Add Tests", mode = { "n", "v" } },
        ["<leader>ko"] = { "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code", mode = { "n", "v" } },
        ["<leader>ks"] = { "<cmd>ChatGPTRun summarize<CR>", "Summarize", mode = { "n", "v" } },
        ["<leader>kf"] = { "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs", mode = { "n", "v" } },
        ["<leader>kx"] = { "<cmd>ChatGPTRun explain_code<CR>", "Explain Code", mode = { "n", "v" } },
        ["<leader>kr"] = { "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit", mode = { "n", "v" } },
        ["<leader>kl"] = { "<cmd>ChatGPTRun code_readability_analysis<CR>", "Code Readability Analysis", mode = { "n", "v" } },
      }, {
        mode = "n",          -- Normal mode
        prefix = "",         -- No prefix because keys include <leader>
        silent = true,
        noremap = true,
        nowait = true,
      })
    end,
  },
}

