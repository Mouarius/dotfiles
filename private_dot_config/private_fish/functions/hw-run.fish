function hw-run
    if test $argv
        set runfile ~/dev/hw-run/$argv.sh
        if test -f $runfile
          /bin/bash $runfile
        end
    else 
      echo "You need to provide a launch configuration name."
    end
end
