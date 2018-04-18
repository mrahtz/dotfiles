#!/bin/bash

git clone --bare https://github.com/mrahtz/dotfiles ~/.dotfiles
function config { git --git-dir=$HOME/.dotfiles --work-tree=$HOME $@; }
config config status.showUntrackedFiles no
checkout_output=$(config checkout 2>&1)
if [[ $? != 0 ]]; then
    mkdir ~/.confbackup
    egrep "\s+\." <<< "$checkout_output" | awk '{print $1}' | xargs -I{} mv "{}" ~/.confbackup/"{}"
    echo "Existing configuration backed up to .confbackup."
    config checkout
fi
