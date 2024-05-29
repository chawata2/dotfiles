-- LSP Support
return {
  {
    -- LSP Configuration
    -- https://github.com/neovim/nvim-lspconfig
    'neovim/nvim-lspconfig',
    event = 'VeryLazy',
    dependencies = {
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      -- { 'j-hui/fidget.nvim',                opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      -- https://github.com/folke/neodev.nvim
      { 'folke/neodev.nvim' },
    },
    config = function()
      require('mason').setup()
      require('mason-lspconfig').setup({
        -- Install these LSPs automatically
        ensure_installed = {
          'lua_ls',
          'jsonls', -- requires npm to be installed
          'lemminx',
          'marksman',
          'quick_lint_js',
          'tsserver', -- requires npm to be installed
          'yamlls',   -- requires npm to be installed
        }
      })

      local lspconfig = require('lspconfig')
      local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lsp_attach = function(client, bufnr)
        -- Create your keybindings here...
      end

      -- Call setup on each LSP server
      -- require('mason-lspconfig').setup_handlers({
      --   function(server_name)
      --     lspconfig[server_name].setup({
      --       on_attach = lsp_attach,
      --       capabilities = lsp_capabilities,
      --     })
      --   end
      -- })

      -- Lua
      lspconfig.lua_ls.setup {
        on_attach = lsp_attach,
        capabilities = lsp_capabilities,
        settings = {
          Lua = {
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = { 'vim' },
            },
          },
        },
      }

      -- TypeScript
      local mason_registry = require('mason-registry')
      local ts_plugin_path = mason_registry.get_package('vue-language-server'):get_install_path() ..
          '/node_modules/@vue/language-server/node_modules/@vue/typescript-plugin'
      lspconfig.tsserver.setup {
        on_attach = lsp_attach,
        capabilities = lsp_capabilities,
        -- Vue setup
        init_options = {
          plugins = {
            {
              name = "@vue/typescript-plugin",
              location = ts_plugin_path,
              languages = { "vue" },
            },
          },
        },
        filetypes = {
          "javascript",
          "typescript",
          "vue",
        },
      }

      -- Vue
      lspconfig.volar.setup({
        capabilities = lsp_capabilities
      })

      -- HTML, CSS
      lspconfig.emmet_ls.setup {
        capabilities = lsp_capabilities
      }

      -- tailwindcss
      lspconfig.tailwindcss.setup {
        capabilities = lsp_capabilities
      }

      -- Globally configure all LSP floating preview popups (like hover, signature help, etc)
      local open_floating_preview = vim.lsp.util.open_floating_preview
      function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
        opts = opts or {}
        opts.border = opts.border or "rounded" -- Set border to rounded
        return open_floating_preview(contents, syntax, opts, ...)
      end
    end
  },
  {
    'nvimtools/none-ls.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.prettier.with({
            filetypes = { "html", "json", "typescript", "javascript", "vue" }
          })
        }
      })
    end
  }
}
