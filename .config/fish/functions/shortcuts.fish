function ga
	git add $argv;
end
function gb
	git branch $argv;
end
function gc
	git commit $argv;
end
function gca
	git commit --amend $argv;
end
function gcm
	git commit -m $argv;
end
function gco
	git checkout $argv;
end
function gcp
	git cherry-pick $argv;
end
function gpl
	git pull $argv;
end
function gps
	git push $argv;
end
function gr
	git rev-parse --short HEAD $argv;
end
function gs
	git status $argv;
end
function gwd
	git diff --word-diff=color $argv;
end
function gwdc
	git diff --word-diff=color --cached $argv;
end
function f
	find . -iname $argv;
end
function g
	grep  $argv;
end
function gv
	grep -v $argv;
end
function p8
	ping 8.8.8.8 $argv;
end
function py
	python  $argv;
end
function fl
	floyd logs -t $argv;
end
function fs
	floyd status $argv;
end
