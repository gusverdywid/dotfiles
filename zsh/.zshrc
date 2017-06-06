#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# include locally installed Cassandra in PATH
if [ -d "$HOME/services" ]; then
  PATH="$PATH:$HOME/services/cassandra/bin"
fi

# Customize to your needs...
# Autocomplete directories
source ~/.zsh/enhancd/zsh/enhancd.zsh

#
# History substring search
bindkey '^[[A' history-substring-search-up # Up arrow
bindkey '^[[B' history-substring-search-down # Down arrow
bindkey -M vicmd 'k' history-substring-search-up # Vi k
bindkey -M vicmd 'j' history-substring-search-down # Vi j

# Navigate console in vim mode
set -o vi

# Command line fuzzy finder
[ -z "$ZSH_NAME" ] && [ -f ~/.fzf.bash ] && source ~/.fzf.bash

#
# Base16 Shell
# BASE16_SHELL="$HOME/.config/base16-shell/base16-material.dark.sh"
# [[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
