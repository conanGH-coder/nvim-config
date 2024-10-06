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
wget https://github.com/neovim/neovim/releases/download/v0.8.2/nvim-linux64.tar.gz
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
