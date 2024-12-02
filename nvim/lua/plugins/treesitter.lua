require'nvim-treesitter.configs'.setup {
  -- 添加不同语言
  ensure_installed = { "vim", "vimdoc", "bash", "c", "cpp", "javascript", "json", "lua", "python", "typescript", "tsx", "css", "rust", "markdown", "markdown_inline", "java" }, -- one of "all" or a list of languages

  highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
  },
  indent = { enable = true },

}
