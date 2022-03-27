function cdd() {
  cd "$(ls -d -- */ | fzf)" || echo "Invalid directory"
}

function j() {
  fname=$(declare -f -F _z)

  [ -n "$fname" ] || source "$DOTLY_PATH/modules/z/z.sh"

  _z "$1"
}

function recent_dirs() {
  # This script depends on pushd. It works better with autopush enabled in ZSH
  escaped_home=$(echo $HOME | sed 's/\//\\\//g')
  selected=$(dirs -p | sort -u | fzf)

  cd "$(echo "$selected" | sed "s/\~/$escaped_home/")" || echo "Invalid directory"
}

clone_gitlab_repo() {
  repo_url=$(curl -s "https://gitlab.com/api/v4/projects?private_token=$GITLAB_TOKEN&visibility=private&simple=true&per_page=100" | jq --raw-output ".[].ssh_url_to_repo" | fzf)
  [ -z "$repo_url" ] && return 1
  git clone "$repo_url"
  echo "$repo_url"
}

clone_github_repo() {
  repo_url=$(curl -s -H "Authorization: token $GITHUB_TOKEN" "https://api.github.com/user/repos?per_page=200" | jq --raw-output ".[].ssh_url" | fzf)
  git clone "$repo_url"
  echo "$repo_url"
}

_docker_connect() {
  containerid=$(docker ps | tail -n +2 | fzf | awk '{print $1}')
  docker exec -it $containerid bash
}

# reverse-search() {
#   local selected num
#   setopt localoptions noglobsubst noposixbuiltins pipefail HIST_FIND_NO_DUPS 2> /dev/null

#   selected=( $(fc -rl 1 |
#     FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} $FZF_DEFAULT_OPTS -n2..,.. --tiebreak=index --bind=ctrl-r:toggle-sort $FZF_CTRL_R_OPTS --query=${(qqq)LBUFFER} +m" fzf) )
#   local ret=$?
#   if [ -n "$selected" ]; then
#     num=$selected[1]
#     if [ -n "$num" ]; then
#       zle vi-fetch-history -n $num
#     fi
#   fi
#   zle redisplay
#   typeset -f zle-line-init >/dev/null && zle zle-line-init
#   return $ret
# }
