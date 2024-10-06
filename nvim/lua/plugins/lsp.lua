require("mason").setup({
  ui = {
      icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
      }
  }
})

require("mason-lspconfig").setup({
  -- 确保安装，根据需要填写
  ensure_installed = {
    "lua_ls",
  },
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").lua_ls.setup {
  capabilities = capabilities,
}

-- C/C++
require("lspconfig").clangd.setup {
  capabilities = capabilities,
}

-- Python
require("lspconfig").pyright.setup {
  capabilities = capabilities,
}

-- Java
require("lspconfig").jdtls.setup {
  capabilities = capabilities,
}

-- Shell scripts
require("lspconfig").bashls.setup {
  capabilities = capabilities,
}
