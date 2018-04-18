#!/bin/bash

git clone --bare https://github.com/mrahtz/dotfiles ~/.dotfiles
function config { git --git-dir=$HOME/.dotfiles --work-tree=$HOME $@ }
config config status.showUntrackedFiles no
config checkout
