#!/usr/bin/env bash

brew install zsh
chsh -s $(which zsh)
cat .zshrc >> ~/.zshrc
cat .zshenv >> ~/.zshenv
cat .zlogin >> ~/.zlogin
cat .zlogout >> ~/.zlogout
cat .zprofile >> ~/.zprofile

source ~/.zshrc

# Configure homebrew for zsh assuming homebrew is already installed
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile

# zinit formerly zplugin: zsh plugin manager
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
zinit self-update
cat zinit.conf >> ~/.zshrc

# Prezto zsh framework
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
cat prezto.conf >> ~/.zshrc
## Commented out to configure manually
# cp ~/dotfiles/zsh/.zpreztorc ~/
