#!/bin/bash

set -o errexit

git clone --bare https://github.com/mrahtz/dotfiles ~/.dotfiles
function config { git --git-dir=$HOME/.dotfiles --work-tree=$HOME $@; }
config config status.showUntrackedFiles no
mv $HOME/.bashrc $HOME/.bashrc_old
checkout_output=$(config checkout 2>&1 || rc=$?)
if [[ $rc != 0 ]]; then
    mkdir ~/.confbackup
    egrep "\s+\." <<< "$checkout_output" | awk '{print $1}' | while read f; do
    mkdir -p ~/.confbackup/"$(dirname $f)"
        mv ~/"$f" ~/.confbackup/"$f"
    done
    echo "Existing configuration backed up to .confbackup."
    config checkout
fi
cat $HOME/.bashrc_old $HOME/.bashrc > $HOME/.bashrc_new
mv $HOME/.bashrc_new $HOME/.bashrc
rm $HOME/.bashrc_old

rm ~/README.md ~/install.sh
# Don't show these files in 'config status'
config update-index --assume-unchanged ~/README.md ~/install.sh
