return {
  'hrsh7th/nvim-cmp',
  dependencies =
  {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'onsails/lspkind-nvim',
    --snip--
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
  },
  lazy = true,
  event = "InsertEnter",
  config = function ()
    local cmp = require("cmp")
    require('cmp').setup({
      formatting = {
        format = require("lspkind").cmp_format({with_text = false, maxwidth = 30}),
      },

      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
      },

      completion = {
        keyword_length = 1,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp'},
        { name = 'luasnip'},
        { name = 'nvim_lsp_signature_help'},
        { name = 'buffer'},
        { name = 'path', option =  {
          trailing_slash = true,
        }},
      })
    })

    -- Set configuration for specific filetype.
    cmp.setup.filetype('gitcommit', {
      sources = cmp.config.sources({
        { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
      }, {
        { name = 'buffer' },
      })
    })
  end
}
