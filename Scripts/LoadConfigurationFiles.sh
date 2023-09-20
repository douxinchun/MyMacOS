#!/bin/zsh

# The script loads the configuration files from the repository to the user's home directory.
CURRENT_PATH=$(pwd)
SCRIPT_PATH=$(dirname "$0")
echo "Move to ${SCRIPT_PATH}"
cd $SCRIPT_PATH
REPOSITORY_PATH=$(git rev-parse --show-toplevel) 

# Shared functions
# Restart application function with its name
restart_app() {
  local app_name="$1"
  app_pid=$(pgrep "$app_name")

  if [ -n "$app_pid" ]; then
    kill "$app_pid"
    echo "Kill process $app_name (PID: $app_pid)"
  else
    echo "$app_name is not running"
  fi

  open -a "$app_name"
  echo "Start $app_name"
}

# Oh my zsh
OH_MY_ZSH_LOCATION_IN_PROJECT="${REPOSITORY_PATH}/shell/oh-my-zsh"
cp -f $OH_MY_ZSH_LOCATION_IN_PROJECT/.zshrc ~/.zshrc

# Karabiner-Elements
ln -snf "${REPOSITORY_PATH}/Karabiner/karabiner" ~/.config/karabiner
launchctl kickstart -k gui/`id -u`/org.pqrs.karabiner.karabiner_console_user_server

# Hammerspoon
ln -snf "${REPOSITORY_PATH}/Hammerspoon/.hammerspoon" ~/.hammerspoon
restart_app "Hammerspoon"

echo "Back to ${CURRENT_PATH}"
cd $CURRENT_PATH