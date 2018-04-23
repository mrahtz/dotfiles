source "$HOME/google-cloud-sdk/path.fish.inc"

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
abbr gb 'git branch'

abbr f 'find . -iname'
abbr g grep
abbr gv 'grep -v'

abbr p8 'ping 8.8.8.8'

abbr uc pass\ \'ubs\ contract\'

abbr e 'ssh -L 7007:localhost:7007 mrahtz@euler.ethz.ch'
abbr gss 'gcloud compute instances start gpu-0'
abbr gsh 'gcloud compute ssh gpu-0 -- -L 8008:localhost:8008 -L 4000:localhost:4000'

abbr te 'open -a textedit'
abbr py python

abbr fl 'floyd logs -t'
abbr fs 'floyd status'
abbr fr 'floyd run --tensorboard --env tensorflow-1.5'

abbr n cd\ Music/The\\\ Naked\\\ Sessions/
abbr h1 mplayer\ 02\\\ -\\\ Hine\\\ e\\\ Hine.mp3\ \ -endpos\ 9\ -loop\ 0
abbr h1.5 mplayer\ 02\\\ -\\\ Hine\\\ e\\\ Hine.mp3\ -ss\ 4.5\ -endpos\ 4.5\ -loop\ 0
abbr h2 mplayer\ 02\\\ -\\\ Hine\\\ e\\\ Hine.mp3\ \ -ss\ 9\ -endpos\ 9\ -loop\ 0
abbr h3 mplayer\ 02\\\ -\\\ Hine\\\ e\\\ Hine.mp3\ \ -ss\ 18.5\ -endpos\ 9\ -loop\ 0
abbr h4 mplayer\ 02\\\ -\\\ Hine\\\ e\\\ Hine.mp3\ -ss\ 27.7\ -endpos\ 9.5\ -loop\ 0
abbr h4.5 mplayer\ 02\\\ -\\\ Hine\\\ e\\\ Hine.mp3\ -ss\ 27.5\ -endpos\ 4\ -loop\ 0
abbr h5 mplayer\ 02\\\ -\\\ Hine\\\ e\\\ Hine.mp3\ -endpos\ 37\ -loop\ 0
abbr h6 mplayer\ 02\\\ -\\\ Hine\\\ e\\\ Hine.mp3\ \ -ss\ 9\ -endpos\ 4.3\ -loop\ 0
abbr h7 mplayer\ 02\\\ -\\\ Hine\\\ e\\\ Hine.mp3\ -ss\ 37\ -endpos\ 7\ -loop\ 0
abbr h7.5 mplayer\ 02\\\ -\\\ Hine\\\ e\\\ Hine.mp3\ -ss\ 37\ -endpos\ 3\ -loop\ 0
abbr h8 mplayer\ 02\\\ -\\\ Hine\\\ e\\\ Hine.mp3\ -ss\ 46\ -endpos\ 7\ -loop\ 0
abbr h9 mplayer\ 02\\\ -\\\ Hine\\\ e\\\ Hine.mp3\ -ss\ 55\ -endpos\ 8.5\ -loop\ 0
abbr h10 mplayer\ \'02\ -\ Hine\ e\ Hine.mp3\'\ -ss\ 63.5\ -endpos\ 9\ -loop\ 0
abbr h11 mplayer\ 02\\\ -\\\ Hine\\\ e\\\ Hine.mp3\ -endpos\ 72\ -loop\ 0
abbr ho1 mplayer\ 03\\\ -\\\ Homai\\\ o\\\ Ringa.mp3\ -endpos\ 4.5\ -loop\ 0
abbr ho2 mplayer\ 03\\\ -\\\ Homai\\\ o\\\ Ringa.mp3\ -ss\ 6\ -endpos\ 5.5\ -loop\ 0
abbr ho3 mplayer\ 03\\\ -\\\ Homai\\\ o\\\ Ringa.mp3\ -ss\ 18\ -endpos\ 5\ -loop\ 0
abbr ho5 mplayer\ 03\\\ -\\\ Homai\\\ o\\\ Ringa.mp3\ -endpos\ 30\ -loop\ 0
abbr ho4 mplayer\ 03\\\ -\\\ Homai\\\ o\\\ Ringa.mp3\ -ss\ 12\ -endpos\ 5\ -loop\ 0
abbr h12 mplayer\ 02\\\ -\\\ Hine\\\ e\\\ Hine.mp3\ -ss\ 64\ -endpos\ 4\ -loop\ 0
abbr h13 mplayer\ 02\\\ -\\\ Hine\\\ e\\\ Hine.mp3\ -ss\ 68\ -endpos\ 4.5\ -loop\ 0

if not set -q -U fish_user_paths
  set -U fish_user_paths "$HOME/.local/bin"
  if test $_platform = "darwin"
    set -U fish_user_paths $fish_user_paths "$HOME/Library/Python/2.7/bin"
    set -U fish_user_paths $fish_user_paths "$HOME/Library/Python/3.6/bin"
  end
end
