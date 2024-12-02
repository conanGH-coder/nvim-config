vim.g.mapleader = " "

local keymap = vim.keymap

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- java idea

-- 跳转到声明
keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
-- 跳转到定义
-- keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>")
-- 跳转到实现
keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
-- 跳转到类型定义
-- keymap.set("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
keymap.set("n", "<space>D", "<cmd>Lspsaga peek_type_definition<CR>")
-- 重命名
keymap.set("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
-- 查找引用
keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
-- 显示行诊断信息
keymap.set("n", "<space>sd", "<cmd>lua vim.diagnostic.setloclist()<CR>")
keymap.set("n", "<space>sj", "<cmd>Lspsaga diagnostic_jump_next<CR>")
keymap.set("n", "<space>sk", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
-- 跳转到下一个诊断
-- keymap.set("n", "<S-C-j>", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>")
-- 格式化文档
keymap.set("n", "<leader>f", "<cmd>lua vim.lsp.buf.format()<CR>")
-- 建议操作
-- keymap.set("n", "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<CR>")
-- keymap.set("n", "<leader>a", "<cmd>Lspsaga code_action<CR>")
keymap.set("n", "<leader>ql", "<cmd>Lspsaga code_action<CR>")

-- 切换bufferline
keymap.set("n", "<C-L>", ":bnext<CR>")
keymap.set("n", "<C-H>", ":bprevious<CR>")
