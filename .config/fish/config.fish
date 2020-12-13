alias f='find . -iname'
alias g=grep
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gca='git commit --amend'
alias gcm='git commit -m'
alias gco='git checkout --recurse-submodules'
alias gcp='git cherry-pick'
alias gpl='git pull'
alias gps='git push'
alias gr='git rev-parse --short HEAD'
alias gs='git status'
alias gv='grep -v'
alias gwd='git diff --word-diff=color'
alias gwdc='git diff --word-diff=color --cached'
alias kj='jobs -p | while read line; if echo $line | grep -q "^[0-9]"; set pid $line; kill -9 $pid; end; end'
alias p8='ping 8.8.8.8'

if not set -q -U fish_user_paths
  set -U fish_user_paths "$HOME/.local/bin"
  if test $_platform = "darwin"
    set -U fish_user_paths $fish_user_paths "$HOME/Library/Python/2.7/bin"
    set -U fish_user_paths $fish_user_paths "$HOME/Library/Python/3.6/bin"
  end
end
