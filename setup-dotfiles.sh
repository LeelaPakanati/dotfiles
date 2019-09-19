#!/bin/bash
mv ~/.bashrc ~/.bashrc.old
mv ~/.vimrc ~/.vimrc.old
mv ~/.vim ~/.vim.old
mv ~/.tmux.conf ~/.tmux.conf.old
dir=`dirname $0`
echo $dir
ln -s $dir/.bashrc ~/.bashrc 
ln -s $dir/.vimrc ~/.vimrc 
ln -s $dir/.vim ~/.vim 
ln -s $dir/.tmux.conf ~/.tmux.conf 
