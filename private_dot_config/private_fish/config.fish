set -g fish_greeting ""

if status is-interactive
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
alias z zoxide

#tmux
alias thw "~/dev/script/tmux_greenday.sh"

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
alias lg "lazygit"

# AWS
alias sveb "source /Users/mariusmenault/.ebcli-virtual-env/bin/activate.fish"
alias ebweb "cd ~/dev/eb/France-Staging-web/ && eb ssh --profile=prod"
alias ebwor "cd ~/dev/eb/France-Staging-worker/ && eb ssh --profile=prod"

# django
alias pm "python manage.py"
alias mm "python manage.py makemigrations --name"
alias mmm "python manage.py makemigrations --merge"


# pre-commit
alias pcr "pre-commit run"

# npm build
alias build "npm run build:production"



command -qv nvim && alias vim nvim
set -gx EDITOR nvim
# only for greenday
set -gx UV_INDEX_GITLAB_REGISTRY_PASSWORD gldt-r-7GyKzpCcmmK9p8tMME

# test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
# if command -v ngrok &>/dev/null
#     eval "$(ngrok completion)"
# end

fzf --fish | source
zoxide init fish | source
uv generate-shell-completion fish | source
