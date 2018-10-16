#!/usr/bin/env bash

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew upgrade

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names

# ZSH
brew install 'zsh'
brew install 'zsh-completions'
echo "fpath=(/usr/local/share/zsh-completions $fpath)" >> ~/.zshrc
rm -f ~/.zcompdump; compinit
chmod go-w '/usr/local/share'

brew install 'openssl'
brew install 'qt5'
brew install 'imagemagick'
brew install 'node'
brew install 'the_silver_searcher'
brew install 'fzf'
brew install 'nvm'
brew install 'rbenv'
brew install 'ruby-build'
brew install 'redis'
brew install 'postgres'
brew install 'sqlite'
brew install 'mysql@5.7'
brew install 'mongodb'
brew install 'pgcli'
brew install 'imagemagick'
brew install 'vim' --with-override-system-vim --with-lua --with-csope
brew install 'macvim' --custom-icons --env-std --with-override-system-vim --with-lua --with-csope
brew install 'neovim'
brew install 'tmux'
brew install 'reattach-to-user-namespace'
brew install 'tidy-html5'
brew install 'readline'
brew install 'postgresql'
brew install 'tig'
brew install 'yarn'
brew install 'puma-dev'
brew install 'mongodb'
brew install 'nginx'
# Facebook path picker (files list picker and command execution)
brew install 'fpp'
# Password manager
brew install 'lastpass-cli' --with-pinentry
# Better looking git diff
brew install 'diff-so-fancy'
# Better http client than curl
brew install 'httpie'


# Util
brew cask install 'alfred'
brew cask install 'amethyst'
brew cask install 'flux'
brew cask install 'the-unarchiver'

# Dev
brew cask install 'iterm2'
brew cask install 'atom'
brew cask install 'sequel-pro'
brew cask install 'kdiff3'
brew cask install 'android-studio'
brew cask install 'mysqlworkbench'
brew cask install 'react-native-debugger'
brew cask install 'reactotron'
brew cask install 'visual-studio-code'
brew cask install 'dash'
brew cask install 'gitup'
brew cask install 'postman'
brew cask install 'pgadmin4'

# Misc.
brew cask install 'google-chrome'
brew cask install 'firefox'
brew cask install 'evernote'
brew cask install 'dropbox'
brew cask install 'spotify'
brew cask install 'slack'
brew cask install 'vlc'
brew cask install 'dnscrypt'
brew cask install 'utorrent'
brew cask install 'sketch'

brew cask alfred link

brew linkapps

brew cleanup

