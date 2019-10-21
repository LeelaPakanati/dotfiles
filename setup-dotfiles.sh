#!/bin/bash
cd dotfiles
git pull
git submodule update --init --recursive
cd ..

mv ~/.bashrc ~/.bashrc.old
mv ~/.vimrc ~/.vimrc.old
mv ~/.vim ~/.vim.old
mv ~/.tmux.conf ~/.tmux.conf.old
mv ~/.config/ranger/rc.conf ~/.config/ranger/rc.conf.old

dir="$( cd "$(dirname "$0")" ; pwd -P )"
echo $dir
ln -s $dir/.bashrc ~/.bashrc 
ln -s $dir/.vimrc ~/.vimrc 
ln -s $dir/.vim ~/.vim 
ln -s $dir/.tmux.conf ~/.tmux.conf 
ln -s $dir/rc.conf ~/.config/ranger/rc.conf

if [ "$1" == "-d" ] 
then
    rm ~/.bashrc.old ~/.vimrc.old ~/.vim.old ~/.tmux.conf.old ~/.config/ranger/rc.conf.old -rf
fi
