#!/bin/sh

ln -sf .vim/vimrc ~/.vimrc
cd ~/.vim
git submodule update --init
