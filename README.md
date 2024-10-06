# nvim-config
基于B站up主技术蛋老师的neovim配置稍做修改的neovim配置

## 1.安装neovim
由于一些插件不适配低版本的neovim，且直接通过sudo apt install neovim可能安装的是低版本neovim，故采取手动安装方式安装neovim
### 1.1 卸载旧版本neovim
```bash
sudo apt remove neovim
```
### 1.2 安装指定版本的neovim
```bash
wget https://github.com/neovim/neovim/releases/download/v0.9.5/nvim-linux64.tar.gz
tar xzvf nvim-linux64.tar.gz
cd /usr/bin
ln -s ~/nvim-linux64/bin/nvim nvim
```
在ln那一步，若是显示权限不够，则在前面加上sudo。最后通过
```bash
nvim
```
验证是否安装成功

## 2.配置neovim

克隆代码
```bash
git clone https://github.com/conanGH-coder/nvim-config.git
```
将nvim-config文件夹中的nvim文件移动到~/.config/下
```bash
mv nvim-config/nvim/ ~/.config/
```
安装gcc、g++等编译器
```bash
sudo apt update
sudo apt install build-essential
```
安装clangd
```bash
sudo apt install clangd
```
加载配置文件
```bash
nvim ~/.config/nvim/lua/plugins/plugins-setup.lua
```
按下Esc键输入:w，等待下载插件即可（可能由于网络问题得多下载几次）

