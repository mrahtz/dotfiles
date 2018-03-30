# number of commands to remember
export HISTSIZE=10000
# save history after every command
# (in case I want history from a running shell, or the shell crashes)
export PROMPT_COMMAND='history -a'
# log timestamps of commands
export HISTTIMEFORMAT='%Y-%m-%d %H:%M.%S | '

function diffe() { diff --width=$COLUMNS --side-by-side <(sed 's///g' "$1") <(sed 's///g' "$2") | less --prompt="${1//./\\.} vs ${2//./\\.}"; }
function kj() { jobs -p | while read pid; do echo $pid; kill -9 $pid; done; }
function hg() { history | grep $*; }

alias gwd='git diff --word-diff=color'
alias gs='git status'
alias gpl='git pull'
alias gps='git push'
alias gr='git rev-parse --short HEAD'
alias gco='git checkout'
alias gc='git commit'
