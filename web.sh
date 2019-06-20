#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# # Check for Homebrew,
# # Install if we don't have it
# if test ! $(which brew); then
#   echo "Installing homebrew..."
#   ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# fi

# # Make sure we’re using the latest Homebrew.
# brew update

# brew install node

# # Remove outdated versions from the cellar.
# brew cleanup

# npm install -g coffee-script
# npm install -g grunt-cli
# npm install -g jshint
# npm install -g less

# #gem install jekyll

# Install nvm (https://github.com/creationix/nvm)
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
source ~/.bashrc
source $NVM_DIR/nvm.sh # This loads nvm
command -v nvm

# Install latest version of node
nvm install lts/*

npm install -g redis-commander

echo "------------------------------"
osascript -e 'tell app "System Events" to display dialog "Script web.sh completed."'
echo "Script web.sh completed."
