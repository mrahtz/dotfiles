abbr gwd 'git diff --word-diff=color'
abbr gwdc 'git diff --word-diff=color --cached'
abbr gpl 'git pull'
abbr gps 'git push'
abbr gc 'git commit'
abbr gco 'git checkout'
abbr gcm 'git commit -m'
abbr gca 'git commit --amend'
abbr ga 'git add'
abbr gs 'git status'
abbr gr 'git rev-parse --short HEAD'

abbr f 'find . -iname'
abbr g grep
abbr gv 'grep -v'
abbr p8 'ping 8.8.8.8'

abbr e 'ssh -L 7007:localhost:7007 mrahtz@euler.ethz.ch'
abbr gss 'gcloud compute instances start gpu-0'
abbr gsh 'gcloud compute ssh gpu-0 -- -L 8008:localhost:8008 -L 4000:localhost:4000'

abbr te 'open -a textedit'
abbr py python

abbr fl 'floyd logs -t'
abbr fs 'floyd status'
abbr fr 'floyd run --tensorboard --env tensorflow-1.5'

if not set -q -U fish_user_paths
  set -U fish_user_paths "$HOME/.local/bin"
  if test $_platform = "darwin"
    set -U fish_user_paths $fish_user_paths "$HOME/Library/Python/2.7/bin"
    set -U fish_user_paths $fish_user_paths "$HOME/Library/Python/3.6/bin"
  end
end
