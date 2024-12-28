#!/usr/bin/env bash

invoker_dir=$(pwd)
cd "$(dirname $0)"

# Terminal multiplexer
brew install 'tmux'
## Fix paste mechanism under tmux on mac
brew install 'reattach-to-user-namespace'

cp .tmux.conf ~/.tmux.conf

source plugins.sh

cd $invoker_dir
