#!/bin/sh

ln -sf .vim/vimrc ~/.vimrc
cd ~/.vimrc
git submodule update --init
