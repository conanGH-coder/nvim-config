require("mason").setup({
  ui = {
      icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
      }
  },
})

require("mason-lspconfig").setup({
  -- 确保安装，根据需要填写
  ensure_installed = {
    "lua_ls",
    -- "clangd",
    "pyright",
  },
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- local jdtls_path = "/home/conan/software/jdt-language-server-1.42.0-202410312059/bin/jdtls"

require("lspconfig").lua_ls.setup {
  capabilities = capabilities,
}

require("lspconfig").pyright.setup {
  capabilities = capabilities,
}

require("lspconfig").clangd.setup {
  capabilities = capabilities,
}

require("lspconfig").jdtls.setup {
  -- cmd = { jdtls_path },
  root_dir = vim.fs.dirname(vim.fs.find({'.mvn', 'src', 'gradlew', '.git', 'mvnw', '.vscode', '.idea'}, { upward = true })[1]),
  settings = {
      java = {
          project = {
              sourcePaths = { "src/main/java" }
          }
      }
  },
  capabilities = capabilities,
}

require("lspconfig").ts_ls.setup {
  capabilities = capabilities,
}

require("lspconfig").cssls.setup {
  capabilities = capabilities,
}

require("lspconfig").html.setup {
  capabilities = capabilities,
}
