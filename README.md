# nvim-config

### 介绍

Neovim配置文件 v2.x

由于社区插件更新速度太快，导致配置文件过时的情况经常发生，维护起来比较费时费力。
因此由第一版全部定制化，改为基于NvChad进行二次配置。

可在Windows上正常运行。

### 截图

定制主题，基于dracula配色方案，有待改进

![image](screenshot.png)

修改了大部分快捷键

![image](keymaps.png)

### 安装教程

这里以Windows为例，其它系统安装更加简单，可以作为参考。

先安装neovim，由于用到了inlay-hints新特性，需要使用Pre-Release每夜构建版，下载地址：https://github.com/neovim/neovim/releases
选择`nvim-win64.zip`，解压/移动后添加到环境变量。

安装clipboard-tool，用于使用系统剪贴板。
```
winget install win32yank
```

安装ripgrep，用于快速搜索文件内容。
```
winget install BurntSushi.ripgrep.GNU
```
或者下载压缩包：https://github.com/BurntSushi/ripgrep/releases
选择`ripgrep-x.x.x-x86_64-pc-windows-gnu.zip`，解压/移动后添加到环境变量。

通过MinGW安装gcc等工具，地址：https://github.com/mstorsjo/llvm-mingw/releases
选择`llvm-mingw-yyyymmdd-ucrt-x86_64.zip`，解压/移动后添加到环境变量。

通过GnuWin32安装make等工具，地址：https://sourceforge.net/projects/getgnuwin32/files/
选择`GetGnuWin32_legacy_install_archive.zip`，解压/移动后添加到环境变量。

都安装好后，打开neovim，输入`:checkhealth`，确保除了缺少用户配置文件和各种语言providers的警告，没有其它错误。

