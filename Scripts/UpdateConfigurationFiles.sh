#!/bin/zsh

# The script updated the configuration files in the repository with the configuration files in the user's home directory.

REPOSITORY_PATH=$(git rev-parse --show-toplevel) 

OH_MY_ZSH_LOCATION_IN_PROJECT="${REPOSITORY_PATH}/shell/oh-my-zsh"

echo $REPOSITORY_PATH
echo $OH_MY_ZSH_LOCATION_IN_PROJECT
cp -f ~/.zshrc $OH_MY_ZSH_LOCATION_IN_PROJECT