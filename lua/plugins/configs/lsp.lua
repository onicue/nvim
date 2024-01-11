return {
  "neovim/nvim-lspconfig",
  dependencies = {
    --'nvimdev/lspsaga.nvim',
    'RishabhRD/nvim-lsputils'
  },
  priority = 51,
  config = function ()
    local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    }
    vim.lsp.set_log_level("off")
    local lsp = require'lspconfig'
    --top bar--
    -- require('lspsaga').setup({
    --   devicon = false,
    --   ui = {
    --     code_action = '',
    --   },
    --   symbol_in_winbar = {
    --     in_custom = false,
    --     enable = false,
    --     separator = ' ',
    --     show_file = true,
    --     file_formatter = ""
    --   },
    -- })

    lsp.lua_ls.setup {
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = {},
          },
          workspace = {
            library = {
              [vim.fn.expand "$VIMRUNTIME/lua"] = true,
              [vim.fn.stdpath "config" .. "/lua"] = true,
            },
          },
        },
      },
    }

    lsp.clangd.setup {
      capabilities = capabilities,
      root_dir = lsp.util.root_pattern('compile_commands.json', 'CMakeLists.txt', '.git'),
      cmd = {"clangd", "--clang-tidy", "--background-index", "--header-insertion=never"}
    }

    lsp.asm_lsp.setup {
      capabilities = capabilities,
      root_dir = lsp.util.root_pattern('compile_commands.json', 'settings.json', '.git'),
    }

    lsp.rust_analyzer.setup {
      capabilities = capabilities,
      --root_dir = "/home/flean/dev/asmX"
    }
  end
}
