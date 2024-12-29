#!/usr/bin/env bash

source ./git/main.sh

source ./zsh/main.sh

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install 'coreutils'
echo 'export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"' >> ~/.zshrc
source ~/.zshrc

# Install some other useful utilities like `sponge`.
brew install 'moreutils'

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install 'findutils'

# Install GNU `sed`, overwriting the built-in `sed`.
brew install 'gnu-sed' --with-default-names

# Better support for utf8 for mac
brew install 'utf8proc'

brew install 'readline'
brew install 'qt5'
brew install 'imagemagick'

# Fuzzy finder
# brew install 'fzy'
# Fuzzy finder (integrated with zoxide)
brew install 'fzf'
# Set up fzf key bindings and fuzzy completion
echo "source <(fzf --zsh)" >> ~/.zshrc

# Jump to most-visited directory
brew install 'zoxide'
echo 'eval "$(zoxide init zsh)"' >> ~/.zshrc

# Code search
brew install 'the_silver_searcher'

source ./tmux/main.sh

# Facebook path picker: pick files path from command output then pipe the files
# into any command
brew install 'fpp'

# Better http client than curl
brew install 'httpie'

# Persistent ssh
brew install 'autossh'

# Mise: version-manager, envs manager, tasks runner
brew install mise
## Brew auto activate mise, so not required for brew
# echo 'eval "$(/opt/homebrew/bin/mise activate zsh)"' >> ~/.zshrc
## Autocompletion for mise
mise use -g usage
mkdir -p /usr/local/share/zsh/site-functions
mise completion zsh  > /usr/local/share/zsh/site-functions/_mise

# Util
## Unpack archive file
brew install --cask 'the-unarchiver'
## Prevent computer going to sleep or start screen saver
brew install --cask 'caffeine'
## Enable routing of audio, for instance for screen recording
brew install --cask 'blackhole-2ch'

# Security
## Monitor webcam and mic
brew install --cask 'oversight'
## Uncover persistenly install programm
brew install --cask 'knockknock'

# Dev
brew install 'vim' --with-override-system-vim --with-lua --with-csope
## Better vim
brew install 'neovim'
## CLI MySQL client with auto-completion
brew install 'mycli'
## Posgre cli
brew install 'pgcli'
## Text-mode interface for git
brew install jesseduffield/lazygit/lazygit
## Correct and clean-up html and xml
brew install 'tidy-html5'
## Terminal
brew install --cask 'iterm2'
## Code editor
brew install --cask 'visual-studio-code'
## Diff tools
brew install --cask 'beyond-compare'
## Android IDE
brew install --cask 'android-studio'
## Debugger of react-native
brew install --cask 'reactotron'
## API docs browser and code snippet
brew install --cask 'dash'
## Git client
brew install --cask 'gitup'
## API client, API dev tools
brew install --cask 'postman'
## Postgresql GUI client
brew install --cask 'pgadmin4'
# A git client
brew install --cask 'fork'

# Misc.
brew install --cask 'firefox'
brew install --cask 'notion'
brew install --cask 'spotify'
brew install --cask 'vlc'
brew install --cask 'bitwarden'
# Show key bind of any apps
brew install --cask 'cheatsheet'
# Renaming movie, fetching artwork and subtitle
brew install --cask 'filebot'
# Screencapture into GIF
brew install --cask 'licecap'

brew linkapps

brew cleanup
