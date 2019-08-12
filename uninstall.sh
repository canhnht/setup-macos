#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

brew uninstall lynx
brew uninstall p7zip
brew uninstall pigz
brew uninstall pv
brew uninstall rename
brew uninstall rhino
brew uninstall zopfli
brew cask uninstall alfred
brew cask uninstall xquartz
brew cask uninstall sublime-text
brew cask uninstall virtualbox
brew cask uninstall vagrant
brew cask uninstall macdown
brew cask uninstall evernote
brew cask uninstall inkscape
brew cask uninstall qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzip qlimagesize webpquicklook suspicious-package quicklookase qlvideo

# Remove outdated versions from the cellar.
brew cleanup

echo "------------------------------"
osascript -e 'tell app "System Events" to display dialog "Script uninstall.sh completed."'
echo "Script uninstall.sh completed."
