local opt = vim.opt

-- 行号
opt.relativenumber = true
opt.number = true

-- 缩进
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- 防止包裹
opt.wrap = false

-- 光标行
opt.cursorline = true

-- 启用鼠标
opt.mouse:append("a")

-- 系统剪贴板
opt.clipboard:append("unnamedplus")

-- 默认新窗口右和下
opt.splitright = true
opt.splitbelow = true

-- 搜索
opt.ignorecase = true
opt.smartcase = true

-- 外观
opt.termguicolors = true
opt.signcolumn = "yes"
vim.cmd[[colorscheme tokyonight-moon]]


-- 自动写入文件头
-- 定义函数 SetTitle
local function SetTitle()
    local filetype = vim.bo.filetype
    local current_line = vim.fn.line(".")
    local filename = vim.fn.expand("%")
    
    -- 如果文件类型为 .sh 文件
    if filetype == "sh" then
        vim.fn.setline(1, "#!/bin/bash")
        vim.fn.append(current_line, "")
    elseif filename:match("%.py$") then
        vim.fn.setline(1, "#!/usr/bin/env python3")
        vim.fn.append(current_line, "# coding=utf-8")
        vim.fn.append(current_line + 1, '"""')
        vim.fn.append(current_line + 2, "    @Author: ")
        vim.fn.append(current_line + 3, "    @Date: " .. os.date("%Y-%m-%d %H:%M"))
        vim.fn.append(current_line + 4, "    @Email: ")
        vim.fn.append(current_line + 5, "")
        vim.fn.append(current_line + 6, '"""')
        vim.fn.append(current_line + 7, "")
    elseif filetype == "ruby" then
        vim.fn.setline(1, "#!/usr/bin/env ruby")
        vim.fn.append(current_line, "# encoding: utf-8")
        vim.fn.append(current_line + 1, "")
    else
        -- 默认文件头
        vim.fn.setline(1, "/*************************************************************************")
        vim.fn.append(current_line, "      > File Name: " .. filename)
        vim.fn.append(current_line + 1, "      > Author: ")
        vim.fn.append(current_line + 2, "      > Mail: ")
        vim.fn.append(current_line + 3, "      > Created Time: " .. os.date())
        vim.fn.append(current_line + 4, " ************************************************************************/")
        vim.fn.append(current_line + 5, "")
    end

    -- C++ 文件特定头
    if filename:match("%.cpp$") then
        vim.fn.append(current_line + 6, "#include <iostream>")
        vim.fn.append(current_line + 7, "using namespace std;")
        vim.fn.append(current_line + 8, "")
    end

    -- C 文件特定头
    if filename:match("%.c$") then
        vim.fn.append(current_line + 6, "#include <stdio.h>")
        vim.fn.append(current_line + 7, "")
    end

    -- 头文件特定头
    if filename:match("%.h$") then
        vim.fn.append(current_line + 6, "#ifndef _" .. filename:match("([^/]+)%.h$"):upper() .. "_H")
        vim.fn.append(current_line + 7, "#define _" .. filename:match("([^/]+)%.h$"):upper() .. "_H")
        vim.fn.append(current_line + 8, "#endif")
    end

    -- Java 文件特定头
    if filename:match("%.java$") then
        vim.fn.append(current_line + 6, "public class " .. filename:match("([^/]+)%.java$"))
        vim.fn.append(current_line + 7, "")
    end
end

-- 自动命令配置
vim.api.nvim_create_autocmd("BufNewFile", {
    pattern = { "*.cpp", "*.c", "*.h", "*.sh", "*.rb", "*.java", "*.py" },
    callback = SetTitle,
})

-- 新建文件后，自动定位到文件末尾
vim.api.nvim_create_autocmd("BufNewFile", {
    pattern = "*",
    command = "normal! G",
})
