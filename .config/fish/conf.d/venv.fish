function __venv_shell_activate --on-variable PWD
    if status --is-command-substitution
        return
    end
    if test -e "$PWD/.venv"
      . (cat $PWD/.venv)/bin/activate.fish
    end
end
