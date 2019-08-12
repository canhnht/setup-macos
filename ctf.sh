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

# Upgrade any already-installed formulae.
brew upgrade --all

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install aircrack-ng
brew install bfg
brew install binutils
brew install binwalk
brew install cifer
brew install dex2jar
brew install dns2tcp
brew install fcrackzip
brew install foremost
brew install hashpump
brew install hydra
brew install john
brew install knock
brew install netpbm
brew install nmap
brew install pngcheck
brew install socat
brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install ucspi-tcp # `tcpserver` etc.
brew install homebrew/x11/xpdf
brew install xz

# Remove outdated versions from the cellar.
brew cleanup

echo "------------------------------"
osascript -e 'tell app "System Events" to display dialog "Open file ctf.sh and follow instructions at the end of the file."'
echo "TODO: Clone the repositories from Code Commit."
echo "TODO: Config Sequel Pro with DB credentials in file `ac-rest-service/.env.production`."
echo "TODO: Install Settings Sync in VS Code and sync settings 6facf968e2488961bc77999b3193ad4c."
echo "TODO: Go to Chrome and create new user profile, then install extension Switchy Omega."
osascript -e 'tell app "System Events" to display dialog "Script brew.sh completed."'
echo "Script brew.sh completed."
