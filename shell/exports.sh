# ------------------------------------------------------------------------------
# Codely theme config
# ------------------------------------------------------------------------------
export CODELY_THEME_MINIMAL=false
export CODELY_THEME_MODE="dark"
export CODELY_THEME_PROMPT_IN_NEW_LINE=false
export CODELY_THEME_PWD_MODE="short" # full, short, home_relative
export CODELY_THEME_STATUS_ICON_OK="👍"
export CODELY_THEME_STATUS_ICON_KO="👎"

if [[ $TERMINAL_EMULATOR == "JetBrains-JediTerm"* ]]; then
  export CODELY_THEME_MINIMAL=true
fi

if [[ $TERM_PROGRAM == "vscode"* ]]; then
  export CODELY_THEME_MINIMAL=true
fi

# ------------------------------------------------------------------------------
# Languages
# ------------------------------------------------------------------------------
export JAVA_HOME='/usr/lib/jvm/java-11-openjdk-amd64'
export GEM_HOME="$HOME/.gem"
export GOPATH="$HOME/.go"
export GOBIN="$HOME/.go/bin"
export BREW_HOME="/home/linuxbrew/.linuxbrew"
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# ------------------------------------------------------------------------------
# Apps
# ------------------------------------------------------------------------------
if [ "$CODELY_THEME_MODE" = "dark" ]; then
  fzf_colors="pointer:#ebdbb2,bg+:#3c3836,fg:#ebdbb2,fg+:#fbf1c7,hl:#8ec07c,info:#928374,header:#fb4934"
else
  fzf_colors="pointer:#db0f35,bg+:#d6d6d6,fg:#808080,fg+:#363636,hl:#8ec07c,info:#928374,header:#fffee3"
fi

export FZF_DEFAULT_OPTS="--color=$fzf_colors --reverse"
export FZF_CTRL_R_OPTS="$FZF_CTRL_R_OPTS
  --header='ctrl-e to query explainshell.com'
  --bind \"ctrl-e:execute(curl -sLG -o /dev/null -w '%{url_effective}' --data-urlencode cmd={} https://explainshell.com/explain | xargs open)\"
"

# ------------------------------------------------------------------------------
# Window management
# ------------------------------------------------------------------------------
export QT_QPA_PLATFORM=xcb

# ------------------------------------------------------------------------------
# User
# ------------------------------------------------------------------------------
export PROJECTS_HOME="$HOME/Code"

# ------------------------------------------------------------------------------
# Path - The higher it is, the more priority it has
# ------------------------------------------------------------------------------
export path=(
  "$HOME/bin"
  "$DOTLY_PATH/bin"
  "$DOTFILES_PATH/bin"
  "$JAVA_HOME/bin"
  "$GEM_HOME/bin"
  "$GOPATH/bin"
  "$HOME/.cargo/bin"
  "/usr/local/kubebuilder/bin"
  "/usr/local/opt/ruby/bin"
  "/usr/local/opt/python/libexec/bin"
  "/opt/homebrew/bin"
  "/usr/local/bin"
  "/usr/local/sbin"
  "/bin"
  "/usr/bin"
  "/usr/sbin"
  "/sbin"
  "/snap/bin"
  "/usr/bin/snap"
  "/snap"
  "/var/snap"
  "/var/lib/snapd"
  "$HOME/snap"
  "$HOME/.yarn/bin"
  "$HOME/.config/yarn/global/node_modules/.bin"
  "$HOME/.local/bin"
  "$HOME/.local/share/JetBrains/Toolbox/scripts"
  "$BREW_HOME/bin"
)
