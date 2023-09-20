#!/bin/zsh

# The script loads the configuration files from the repository to the user's home directory.
CURRENT_PATH=$(pwd)
SCRIPT_PATH=$(dirname "$0")
echo "Move to ${SCRIPT_PATH}"
cd $SCRIPT_PATH
REPOSITORY_PATH=$(git rev-parse --show-toplevel) 
OH_MY_ZSH_LOCATION_IN_PROJECT="${REPOSITORY_PATH}/shell/oh-my-zsh"

cp -f $OH_MY_ZSH_LOCATION_IN_PROJECT/.zshrc ~/.zshrc

# Karabiner-Elements
ln -snf "${REPOSITORY_PATH}/Karabiner/karabiner" ~/.config/karabiner
launchctl kickstart -k gui/`id -u`/org.pqrs.karabiner.karabiner_console_user_server

echo "Back to ${CURRENT_PATH}"
cd $CURRENT_PATH