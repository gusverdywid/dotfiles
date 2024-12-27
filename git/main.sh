#!/usr/bin/env bash

brew install 'git'

read -p "Enter the name (to be used for git commit): " name
read -p "Enter the email (to be used for git commit): " email
git config --global user.name $name
git config --global user.email $email
git config --global core.whitespace trailing-space,space-before-tab
git config --global apply.whitespace fix
git config --global pull.rebase true
git config --global push.default simple

./diff-so-fancy.sh
