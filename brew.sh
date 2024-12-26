#!/usr/bin/env bash

# Install Xcode Command Line Tools
xcode-select --install

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew update
brew upgrade

brew install git

# ZSH
brew install zsh
chsh -s $(which zsh)
cat ~/dotfiles/zsh/.zshrc >> ~/.zshrc
cat ~/dotfiles/zsh/.zshenv >> ~/.zshenv
cat ~/dotfiles/zsh/.zlogin >> ~/.zlogin
cat ~/dotfiles/zsh/.zlogout >> ~/.zlogout
cat ~/dotfiles/zsh/.zprofile >> ~/.zprofile

source ~/.zshrc

# Configure homebrew for zsh assuming homebrew is already installed
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
echo 'export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"' >> ~/.zshrc
source ~/.zshrc

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names

# zinit formerly zplugin: zsh plugin manager
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
zinit self-update
## zsh-completions autocompletion package
echo "zinit ice blockf" >> ~/.zshrc
echo "zinit light zsh-users/zsh-completions" >> ~/.zshrc
## enhanced: interactive cd
echo 'zinit ice svn pick"init.sh"' >> ~/.zshrc
echo "zinit light babarot/enhancd" >> ~/.zshrc
# Ranger zoxide
echo 'zinit ice svn pick"ranger-zoxide.plugin.zsh"' >> ~/.zshrc
echo "zinit light fdw/ranger-zoxide" >> ~/.zshrc

# Prezto zsh framework
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
cat zsh/prezto.sh >> ~/.zshrc
## Commented out to configure manually
# cp ~/dotfiles/zsh/.zpreztorc ~/

# Mise: version-manager, envs manager, tasks runner
brew install mise
## Brew auto activate mise, so not required for brew
# echo 'eval "$(/opt/homebrew/bin/mise activate zsh)"' >> ~/.zshrc
## Autocompletion for mise
mise use -g usage
mkdir -p /usr/local/share/zsh/site-functions
mise completion zsh  > /usr/local/share/zsh/site-functions/_mise

# Fuzzy finder
# brew install 'fzy'
# Fuzzy finder (integrated with zoxide)
brew install 'fzf'
brew install 'zoxide'

brew install 'qt5'
brew install 'imagemagick'
brew install 'the_silver_searcher'
brew install 'pgcli'
brew install 'vim' --with-override-system-vim --with-lua --with-csope

# Install neovim with python3 client
brew install 'neovim'
pip3 install --user neovim

# Terminal multiplexer
brew install 'tmux'
## Fix paste mechanism under tmux on mac
brew install 'reattach-to-user-namespace'

brew install 'tidy-html5'
brew install 'readline'
brew install 'tig'

# Facebook path picker (files list picker and command execution)
brew install 'fpp'

# Better looking git diff
brew install 'diff-so-fancy'

# Better http client than curl
brew install 'httpie'

# Persistent ssh
brew install 'autossh'

# Env switcher for the shell
# brew install 'direnv'
# echo '' >> ~/.zshrc
# echo '# Initialize direnv for shell env switcher' >> ~/.zshrc
# echo 'eval "$(direnv hook zsh)"' >> ~/.zshrc

# CLI MySQL client with auto-completion
brew install 'mycli'

# Jump around to frequently use directory
brew install 'z'
echo '. /usr/local/etc/profile.d/z.sh' >> ~/.bashrc
echo '. /usr/local/etc/profile.d/z.sh' >> ~/.zshrc

# Util
## Unpack archive file
brew cask install 'the-unarchiver'
## Prevent computer going to sleep or start screen saver
brew cask install 'caffeine'
## Enable routing of audio, for instance for screen recording
brew cask install 'blackhole-2ch'

# Security
## Monitor webcam and mic
brew cask install 'oversight'
## Uncover persistenly install programm
brew cask install 'knockknock'

# Dev
## Terminal
brew cask install 'iterm2'
## Code editor
brew cask install 'visual-studio-code'
## Diff tools
brew cask install 'beyond-compare'
## Android IDE
brew cask install 'android-studio'
## Debugger of react-native
brew cask install 'reactotron'
## API docs browser and code snippet
brew cask install 'dash'
## Git client
brew cask install 'gitup'
## API client, API dev tools
brew cask install 'postman'
## Postgresql GUI client
brew cask install 'pgadmin4'
# A git client
brew cask install 'fork'

# Misc.
brew cask install 'firefox'
brew cask install 'notion'
brew cask install 'spotify'
brew cask install 'vlc'
brew cask install 'bitwarden'
# Show key bind of any apps
brew cask install 'cheatsheet'
# Renaming movie, fetching artwork and subtitle
brew cask install 'filebot'
# Screencapture into GIF
brew cask install 'licecap'

brew linkapps

brew cleanup
