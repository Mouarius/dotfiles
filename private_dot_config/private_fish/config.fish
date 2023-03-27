set -g fish_greeting " "
set -gx PATH /home/linuxbrew/.linuxbrew/bin $PATH

if status is-interactive
	eval "$(oh-my-posh init fish --config $(brew --prefix oh-my-posh)/themes/bubblesextra.omp.json) | source"
        fish_vi_key_bindings
        oh-my-posh init fish | source
end

# Setting PATH for Python 3.11
# The original version is saved in /Users/mariusmenault/.config/fish/config.fish.pysave
set -x PATH "/Library/Frameworks/Python.framework/Versions/3.11/bin" "$PATH"

alias dc cd
alias cm chezmoi
alias cl clear
alias gs "git status"
alias mv "mv -i"
alias py python3
alias vi nvim
command -qv nvim && alias vim nvim
set -gx EDITOR nvim

# Setting PATH for Python 3.9
# The original version is saved in /Users/mariusmenault/.config/fish/config.fish.pysave
# set -x PATH "/Library/Frameworks/Python.framework/Versions/3.9/bin" "$PATH"
