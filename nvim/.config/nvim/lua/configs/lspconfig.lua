require("nvchad.configs.lspconfig").defaults()

-- Config customizada do gopls
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if client and client.server_capabilities.semanticTokensProvider then
      vim.lsp.semantic_tokens.start(args.buf, client.id)
    end
  end,
})

-- Configurando C para os calouros
vim.lsp.config("clangd", {
  cmd = { "clangd" },
  filetypes = { "c", "cpp" },
})

vim.lsp.config("gopls", {
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
})
vim.lsp.enable {
  "ruff",
  "gopls",
  "pyright",
  "clangd",
}

-- read :h vim.lsp.config for changing options of lsp servers
