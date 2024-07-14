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
        }, {
          { name = 'buffer' },
        })
      })
    end,
  },
}
