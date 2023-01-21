return {
  -- Snippets
  { 'L3MON4D3/LuaSnip',
    dependencies = {
      "rafamadriz/friendly-snippets" -- Community snippets
    }
  },

  { "hrsh7th/nvim-cmp", -- Autocompletion plugin
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      'saadparwaiz1/cmp_luasnip',
      "hrsh7th/cmp-nvim-lua",
    },
    config = function()
      -- luasnip setup
      local luasnip = require 'luasnip'
      require("luasnip.loaders.from_vscode").lazy_load()

      -- nvim-cmp setup
      local cmp = require 'cmp'
      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        sources = {
          { name = "copilot" },
          { name = "nvim_lua" },
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = "buffer", keyword_length = 5 },
        },
        completion = { completeopt = "menu,menuone,noinsert" },
        experimental = { ghost_text = true },
      }
    end
  },

  -- Copilot
  { "zbirenbaum/copilot-cmp",
    dependencies = { "zbirenbaum/copilot.lua" },
    config = function()
      require("copilot").setup()
      require("copilot_cmp").setup()
    end
  },
}
