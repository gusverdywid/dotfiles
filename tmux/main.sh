#!/usr/bin/env bash

# Terminal multiplexer
brew install 'tmux'
## Fix paste mechanism under tmux on mac
brew install 'reattach-to-user-namespace'

cp .tmux.conf ~/.tmux.conf

source ./plugins.sh
