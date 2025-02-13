function sv
    if test $argv
        if test $VIRTUAL_ENV
            eval "deactivate"
        end
        source ~/dev/venv/$argv/bin/activate.fish
        if test $status != 0
            echo "Unable to find the virtual environment $argv"
        end
    else
        if test $VIRTUAL_ENV
            eval "deactivate"
        end
        source .venv/bin/activate.fish
        if test $status != 0
            echo "Unable to find the virtual environment $argv"
        end
    end
end
