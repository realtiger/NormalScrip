#!/bin/bash
echo "安装将花费一定时间，请耐心等待直到安装完成^_^"
if which apt-get >/dev/null; then
	sudo apt-get install -y vim vim-gnome ctags xclip astyle git
elif which yum >/dev/null; then
	sudo yum install -y gcc vim git ctags xclip astyle	
fi

##Add HomeBrew support on  Mac OS
if which brew >/dev/null;then
    echo "You are using HomeBrew tool"
    brew install vim ctags git astyle
fi

sudo easy_install -ZU autopep8
sudo ln -s /usr/bin/ctags /usr/local/bin/ctags
mv -f ~/vim ~/vim_old
mv -f ~/.vim ~/.vim_old
mv -f ../vim ~/.vim
mv -f ~/.vimrc ~/.vimrc_old
mv -f ~/.vim/.vimrc ~/
echo "ma6174正在努力为您安装bundle程序" > ~/vim_install.log
echo "安装完毕将自动退出" >> ~/vim_install.log
echo "请耐心等待" >> ~/vim_install.log
vim ~/vim_install.log -c "BundleInstall" -c "q" -c "q"
rm ~/vim_install.log
echo "安装完成"
