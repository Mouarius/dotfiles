set -g fish_greeting ""
set fish_user_paths /home/linuxbrew/.linuxbrew/bin /home/mariusmenault/.local/bin $fish_user_paths
  if status is-interactive
    oh-my-posh init fish --config "$HOME/.config/fish/themes/amro-custom-mouarius.omp.json" | source
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
alias g git
alias gs "git status"
alias gc "git commit"
alias gcm "git commit -m"
alias ga "git add"
alias gal "git add ."
alias gps "git push"
alias gpl "git pull"
alias gk "git checkout" 
alias gkb "git checkout -b"
alias glog "git log --graph --oneline --decorate"
alias gm "git merge"

# django
alias pm "python manage.py"

# pre-commit
alias pcr "pre-commit run"

command -qv nvim && alias vim nvim
set -gx EDITOR nvim
