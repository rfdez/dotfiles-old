# Enable aliases to be sudo’ed
alias sudo='sudo '

alias ..="cd .."
alias ...="cd ../.."
alias ll="exa -l --icons"
alias la="exa -la --icons"
alias ls="exa --icons"
alias ~="cd ~"
alias dotfiles='cd $DOTFILES_PATH'

# Jumps
alias gtwp="cd $PROJECTS_HOME/flexiwatt"
alias gtpp="cd $PROJECTS_HOME/rfdez"
alias tmp="cd ~/Desktop/tmp"

# Git
alias gaa="git add -A"
alias gc='$DOTLY_PATH/bin/dot git commit'
alias gca="git add --all && git commit --amend --no-edit"
alias gco="git checkout"
alias gd='$DOTLY_PATH/bin/dot git pretty-diff'
alias gs="git status -sb"
alias gf="git fetch --all -p"
alias gps="git push"
alias gpsf="git push --force"
alias gpl="git pull --rebase --autostash"
alias gb="git branch"
alias gl='$DOTLY_PATH/bin/dot git pretty-log'
alias ghcl="dot github clone_repo"
alias glcl="dot gitlab clone_repo"

# Docker
alias dpa="dot docker prune"
alias dlc="docker container ls"
alias dli="docker image ls"
alias dlvo="docker volume ls"
alias dln="docker network ls"

# Utils
alias k='kill -9'
alias i.='(idea $PWD &>/dev/null &)'
alias c.='(code $PWD &>/dev/null &)'
alias o.='(open . &>/dev/null &)'

alias up="dot package update_all"
alias copy='pbcopy'
alias dc='dot docker connect'
alias htop='btm'

# Package managers
alias pn='pnpm'
