# number of commands to remember
export HISTSIZE=10000
# save history after every command
# (in case I want history from a running shell, or the shell crashes)
export PROMPT_COMMAND='history -a'
# log timestamps of commands
export HISTTIMEFORMAT='%Y-%m-%d %H:%M.%S | '
# set SIGHUP to jobs on exit
shopt -s huponexit

export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

function diffe() { diff --width=$COLUMNS --side-by-side "$1" "$2" | less --prompt="${1//./\\.} vs ${2//./\\.}"; }
function kj() { jobs -p | while read pid; do echo $pid; kill -9 $pid; done; }
function hg() { history | grep $*; }
function ts() {
    tb $1
    sleep 15
    node ~/tensorboard_screenshot/tensorboard_screenshot.js http://localhost:6006
}
function al() {
    ts $1
    mv screenshot.png _screenshot.png
    t $(echo _screenshot.png; ls -1rt $1/experience/*.mp4 | tail -n 4 | head -n 3)
}
function tka() {
    pattern=$1
    tmux ls | cut -d : -f 1 | while read job; do
        if grep -q "$pattern" <<< $job; then
            tk $job
        fi
    done
}

alias config='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

alias gwd='git diff --word-diff=color'
alias gs='git status'
alias gpl='git pull'
alias gps='git push'
alias gr='git rev-parse --short HEAD'
alias gco='git checkout'
alias gc='git commit'
alias gb='git branch'
alias ga='git add'
alias gca='git commit --amend'
alias mr='ls -1rt | tail -n 1'
alias mrd='ls -1rtd */ | tail -n 1'
alias ta='tmux a -t'
alias tls='tmux ls'
alias p='pgrep -af'

export PATH="~/.local/bin:$PATH"
