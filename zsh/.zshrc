# zmodload zsh/zprof
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

###############################################################################
# zplug section
###############################################################################
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# Interactive cd
zplug "b4b4r07/enhancd", use:init.sh

# zplug check returns true if all packages are installed
# Therefore, when it returns false, run zplug install
if ! zplug check; then
    zplug install
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose
# End of zplug


# include locally installed Cassandra in PATH
if [ -d "$HOME/services" ]; then
  PATH="$PATH:$HOME/services/cassandra/bin"
fi

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

export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"

export PATH="/Users/gus/Library/Python/2.7/bin:$PATH"

export PATH="$(brew --prefix qt@5.5)/bin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

source ~/.bin/tmuxinator.zsh


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/gus/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/gus/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/gus/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/gus/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# zprof
