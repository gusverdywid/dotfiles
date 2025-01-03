#!/usr/bin/env bash

# Install Xcode Command Line Tools
echo 'Installing Xcode Command Line Tools'
xcode-select --install

echo 'Configuring mac'
source ./osx/osx.sh

# Install homebrew
echo 'Installing and configuring homebrew'
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"
brew update
brew upgrade
