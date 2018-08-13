alias gwd='git diff --word-diff=color'
alias gwdc='git diff --word-diff=color --cached'
alias gpl='git pull'
alias gps='git push'
alias gc='git commit'
alias gco='git checkout'
alias gcm='git commit -m'
alias gca='git commit --amend'
alias ga='git add'
alias gs='git status'
alias gr='git rev-parse --short HEAD'
alias gb='git branch'
alias gcp='git cherry-pick'

alias f='find . -iname'
alias g=grep
alias gv='grep -v'
alias kj='jobs -p | while read line; if echo $line | grep -q "^[0-9]"; set pid $line; kill -9 $pid; end; end'

alias p8='ping 8.8.8.8'

alias py=python

alias fl='floyd logs -t'
alias fs='floyd status'

if not set -q -U fish_user_paths
  set -U fish_user_paths "$HOME/.local/bin"
  if test $_platform = "darwin"
    set -U fish_user_paths $fish_user_paths "$HOME/Library/Python/2.7/bin"
    set -U fish_user_paths $fish_user_paths "$HOME/Library/Python/3.6/bin"
  end
end
