return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
        library = {
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
  },
  config = function()
    local lsp = require("lspconfig")
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    lsp.lua_ls.setup({ capabilities = capabilities })
    lsp.pyright.setup({ capabilities = capabilities })
    -- lsp.ts_ls.setup({ capabilities = capabilities })
    lsp.html.setup({ capabilities = capabilities })
    lsp.emmet_ls.setup({ capabilities = capabilities, filetypes = { "html", "typescriptreact" } })

    vim.keymap.set("n", "<leader>dg", vim.diagnostic.open_float, { noremap = true, silent = true })
  end,
}
