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
sudo bash -c 'echo /usr/local/bin/zsh >> /etc/shells'
chsh -s /usr/local/bin/zsh

# Zsh plugin manager
brew install 'zplug'

# Fuzzy finder
# brew install 'fzy'
# Fuzzy finder (integrated with zoxide)
brew install 'fzf'

brew install 'openssl'
brew install 'qt5'
brew install 'imagemagick'
brew install 'the_silver_searcher'
brew install 'nvm'
# brew install 'rbenv'
# brew install 'ruby-build'
brew install 'redis'
brew install 'postgres'
brew install 'sqlite'
brew install 'mysql@5.7'
brew install 'mongodb'
brew install 'pgcli'
brew install 'imagemagick'
brew install 'vim' --with-override-system-vim --with-lua --with-csope
brew install 'macvim' --custom-icons --env-std --with-override-system-vim --with-lua --with-csope

# Install neovim with python3 client
brew install 'neovim'
pip3 install --user neovim

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
# Persistent ssh
brew install 'autossh'
# Env switcher for the shell
brew install 'direnv'
echo '' >> ~/.zshrc
echo '# Initialize direnv for shell env switcher' >> ~/.zshrc
echo 'eval "$(direnv hook zsh)"' >> ~/.zshrc

# CLI MySQL client with auto-completion
brew install 'mycli'

# Ruby version manager
brew install 'chruby'
echo 'source /usr/local/opt/chruby/share/chruby/chruby.sh' >> /etc/bashrc
echo 'source /usr/local/opt/chruby/share/chruby/auto.sh' >> /etc/bashrc
echo 'source /usr/local/opt/chruby/share/chruby/chruby.sh' >> ~/.zshrc
echo 'source /usr/local/opt/chruby/share/chruby/auto.sh' >> ~/.zshrc
# Installer by creator of chruby
brew install 'ruby-install'

brew install 'asdf'

# Jump around to frequently use directory
brew install 'z'
echo '. /usr/local/etc/profile.d/z.sh' >> ~/.bashrc
echo '. /usr/local/etc/profile.d/z.sh' >> ~/.zshrc

# Util
brew cask install 'alfred'
brew cask install 'amethyst'
brew cask install 'flux'
brew cask install 'the-unarchiver'
# Switch to prevent computer going to sleep or start screen saver
brew cask install 'caffeine'
# Window manager
brew cask install 'spectacle'

# Security
# Monitor webcam and mic
brew cask install 'oversight'
# Uncover persistenly install programm
brew cask install 'knockknock'

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
# A git client
brew cask install 'fork'

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
# Better email client
brew cask install 'polymail'
# Show key bind of any apps
brew cask install 'cheatsheet'
# Renaming movie, fetching artwork and subtitle
brew cask install 'filebot'
# Screencapture into GIF
brew cask install 'licecap'
# Music tagger
brew cask install 'musicbrainz-picard'
# Google cloud sdk
brew cask install 'google-cloud-sdk'


brew cask alfred link

brew linkapps

brew cleanup
