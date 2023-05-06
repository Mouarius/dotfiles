function sv
    if $argv
        source ~/src/venv/$argv
        if test $status != 0
            echo "Unable to find the virtual environment $($argv)"
        end
    end
end
