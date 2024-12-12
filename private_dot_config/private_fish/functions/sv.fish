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
        echo "You need to provide the name of a virtual env in arguments"
    end
end
