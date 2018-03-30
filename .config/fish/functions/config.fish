# Defined in - @ line 0
function config --description 'alias config=git --git-dir=/Users/matthew/.dotfiles --work-tree=/Users/matthew'
	git --git-dir=$HOME/.dotfiles --work-tree=$HOME $argv;
end
