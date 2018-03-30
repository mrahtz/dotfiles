function kj
	jobs -p | while read line; if echo $line | grep -q "^[0-9]"; set pid $line; kill $pid; end; end $argv;
end
