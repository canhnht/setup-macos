#!/usr/bin/env bash

echo "BASH_SOURCE", ${BASH_SOURCE};
echo "dirname BASH_SOURCE", $(dirname "${BASH_SOURCE}");
cd "$(dirname "${BASH_SOURCE}")";

function doIt() {
    rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
        --exclude "README.md" --exclude "LICENSE" --exclude "CREDITS.md" \
        --exclude ".aws/" --exclude ".ssh/" \
        --exclude ".extra.*" -avh --no-perms . ~;
    source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    doIt;
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        doIt;
    fi;
fi;
unset doIt;

read -p "Which secret credentials do you want to copy? "
mkdir ~/.aws
mkdir ~/.ssh
cp .aws/aws-$REPLY/* ~/.aws/
cp .ssh/ssh-$REPLY/* ~/.ssh/
cp .extra.$REPLY ~/.extra

echo "------------------------------"
echo "TODO: Update .ssh/ with your SSH keys to match file .ssh/config."
osascript -e 'tell app "System Events" to display dialog "Script bootstrap.sh completed."'
echo "Script bootstrap.sh completed."
