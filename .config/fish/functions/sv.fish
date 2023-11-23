function sv
    if test $argv
        source ~/dev/venv/$argv/bin/activate.fish
        if test $status != 0
            echo "Unable to find the virtual environment $argv"
        end
    end
end
