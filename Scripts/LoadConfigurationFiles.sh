#!/bin/zsh

# The script loads the configuration files from the repository to the user's home directory.

REPOSITORY_PATH=$(git rev-parse --show-toplevel) 
OH_MY_ZSH_LOCATION_IN_PROJECT="${REPOSITORY_PATH}/shell/oh-my-zsh"

cp -f $OH_MY_ZSH_LOCATION_IN_PROJECT ~/.zshrc