#!/usr/bin/env bash

# Will include npm
brew install 'node'
# Use n for node version management
npm install -g n
# Install the latest stable version
n stable

curl -o- -L https://yarnpkg.com/install.sh | bash

# Needed for react native
brew install 'watchman'
# Either using expo
npm install -g expo-cli
# Or react-native cli
npm install -g react-native-cli
