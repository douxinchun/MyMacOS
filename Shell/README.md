# Shell  

shell是命令解析器. 我目前用的组合是 iTerm2 + zsh + oh-my-zsh

* iTerm2 是一个终端模拟器，用来代替 Mac OS 的原生 Terminal。
* zsh 和 bash 一样，是命令解释器（shell）的一种。这两种 shell 在 Mac OS 上都有默认安装。
* oh-my-zsh 是 用于管理 zsh 配置的一个工具，内置了非常丰富的 zsh plugins。

## Basic

### 查看与切换
```
echo $SHELL        # 查看当前使用shell
chsh -s /bin/bash  # 切换为bash (Catalina(version 10.15) 之前 Mac OS 的默认 shell)
chsh -s /bin/zsh   # 切换为zsh （Catalina(version 10.15) 之后 Mac OS 的默认 shell）
```
### 配置文件位置  

| Shell | Configuration File (Read Command) |
| --- | --- |
| bash | ~/.bash_profile |
| zsh | ~/.zshrc |

当从bash切换为zsh时，如果不想重新配置一遍.zshrc文件，可以__在.zshrc文件中加上source ~/.bash_profile，从而直接从.bash_profile文件读取配置。

### 脚本生效
当配置文件发生改动后，需要执行 `source ~/.zshrc`, 这样 shell 才能读取到最新的配置。
`source`是一个内置的 shell 命令，用于从当前的 shell 会话中的文件读取和执行命令，刷新当前 shell 环境。

### 配置文件解释
1. `/etc/profile`: (系统级的环境变量) 此文件为系统的每个用户设置环境信息，当用户第一次登录时，该文件被执行. 并从 `/etc/profile.d` 目录的配置文件中搜集shell的设置。
2. `/etc/bashrc`: (系统级 bash 配置文件) 当 bash shell 被打开时,该文件被读取（即每次新开一个终端，都会执行 bashrc ）。
3. `~/.bash_profile`:（当前用户环境变量） 每个用户都可使用该文件输入专用于自己使用的 shell 信息，当用户登录时，该文件仅仅执行一次。默认情况下，设置一些环境变量，执行用户的 `.bashrc` 文件。
4. `~/.bashrc`: （当前用户 bash 配置文件），当登录时以及每次打开新的 shell 时，该该文件被读取。
5. `~/.bash_logout`: 当前用户每次退出 bash shell 时，执行该文件. 

profile 文件会导入 rc 文件中的内容，所以，常用的设置放在 rc 文件中即可。  
profile 文件和 rc 文件是都是用于保存用户的环境信息。要搞懂它们的区别，需要弄清楚 interactive shell，non-interactive shell，login shell 和 non-login shell 的概念。此处直接上结论(暂未验证, From: [理解 bashrc profile 优先级及区别](https://www.seafog.cn/archives/775719042))：
1. interactive login shell  
依次读取的文件为：/etc/profile–>/etc/profile.d/*–>(~/.bash_profile | ~/.bash_login | /.profile)–>/.bashrc–>/etc/bashrc–>~/.bash_logout  
2. non-interactive login shell  
依次读取的文件为： ~/.bashrc–>/etc/bashrc–>/etc/profile.d/*
3. interactive non-login shell  
只读取 ~/.bashrc 和 /etc/bashrc 文件
4. non-interactive non-login shell  
不会执行 profile ，也不会执行 rc  

如何确定是不是 login shell `echo $0`
```
➜  ~ echo $0
-zsh # "-" is the first character. Therefore, this is a login shell.
➜  ~ /bin/bash

The default interactive shell is now zsh.
To update your account to use zsh, please run `chsh -s /bin/zsh`.
For more details, please visit https://support.apple.com/kb/HT208050.
bash-3.2$ echo $0
/bin/bash #  "-" is NOT the first character. This is NOT a login shell.
```  

以上是 bash 的例子，如果是 zsh 则对应的是 `~/.zprofile` 和 `~/.zshrc`。  
总结：使用 zsh，我们自己的 alias 或者其它的 shell 配置只要放在'~/.zshrc'中就可以的，其它的配置文件，非必要不动。  

## Installation

[iTerm2](https://iterm2.com/index.html) 官网下载安装  
[Oh my zsh](https://github.com/ohmyzsh/ohmyzsh) github 仓库中提供了 `install.sh`，可以一键自动下载执行安装。示例是通过`curl`来下载安装，需要通过`wget`或`fetch`可以在 oh-my-zsh github 主页中查找对应的命令。
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Install Plugins
Oh my zsh 内置了非常多的插件。[Oh my zsh 内置插件清单](https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins).  
清单中的插件，如果需要启动的话，有一些直接将插件名添加在 .zshrc 中的 plugins 数组中即可，例如 git z；还有一些需要先安装，再将插件名称添加进 plugins 数组中。`oh-my-zsh/plugins/{plugin name}/README.md`，例如 autojump。  
注意：plugins 数组中插件名可以用空格(spaces)制表符(tabs)换行符(newlines)来分隔，但是不用使用逗号（commas）。

插件安装完，更改 .zshrc 文件后需要刷新 shell 环境，或直接重启 iTerm2，才能使插件生效。
```
source ~/.zshrc
```  
### 自动跳转（autojump）
autojump可以快速地进行文件目录导航。它会记录命令行中常用的目录，然后根据权重（访问频次）进行快速跳转。这个和 z 插件的功能类似。

1. 安装
```
brew install autojump
```
2. 在 .zshrc plugins 数组中添加 autojump
```
plugins=(
    ...
    autojump
)
```

### 语法高亮（zsh-syntax-highlighting）
常见命令高亮，输入正确为绿色，错误为红色。

1. 安装
```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting

```
2. 在 .zshrc plugins 数组中添加 zsh-syntax-highlighting
```
plugins=(
    ...
    zsh-syntax-highlighting
)
```  
3. 在 .zshrc 文件末尾添加 source 命令  
```
# zsh-syntax-highlighting.zsh must be sourced at the end
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
```

### 命令提示 (zsh-autosuggestions)
命令提示，输入时会根据之前的历史记录，灰字提示推荐命令，直接按右方向键 ➡️ 补全

1. 安装
```
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
```
2. 在 .zshrc plugins 数组中添加 zsh-autosuggestions
```
plugins=(
    ...
    zsh-autosuggestions
)
```  