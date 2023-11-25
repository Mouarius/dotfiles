set -g fish_greeting ""

if status is-interactive
  set -gx PATH "/home/linuxbrew/.linuxbrew/bin" $PATH
  oh-my-posh init fish --config "$HOME/.config/fish/themes/custom-mouarius.omp.json" | source
end

alias dc cd

# chezmoi
alias cm chezmoi
alias cme "chezmoi edit"

# utility
alias cl clear
alias mv "mv -i"
alias py python3
alias vi nvim
alias .. "cd .."
alias .... "cd ../.."

# config, see : https://www.atlassian.com/git/tutorials/dotfiles
alias config "git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"


# git
alias g  'git'
alias gs "g status"
alias gc "g commit"
alias gcm "g commit -m"
alias ga "g add"
alias gal "g add ."
alias gps "g push"
alias gpl "g pull"
alias gk "g checkout" 
alias gkb "g checkout -b"
alias glog "g log --graph --oneline --decorate"
alias gm "g merge"

# django
alias pm "python manage.py"

# pre-commit
alias pcr "pre-commit run"


command -qv nvim && alias vim nvim
set -gx EDITOR nvim