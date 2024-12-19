# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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

# Heroku autocomplete
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

###############################################################################
# zplug section
###############################################################################
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# Interactive cd
zplug "b4b4r07/enhancd", use:init.sh

zplug "fdw/ranger-zoxide", as:command, use:"ranger-zoxide.plugin.zsh"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
# zplug load --verbose
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

#
# Base16 Shell
# BASE16_SHELL="$HOME/.config/base16-shell/base16-material.dark.sh"
# [[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"

export PATH="/Users/gus/Library/Python/2.7/bin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# source ~/.bin/tmuxinator.zsh

# Load chruby
if [[ -e /usr/local/opt/chruby/share/chruby ]]; then
  source /usr/local/opt/chruby/share/chruby/chruby.sh
  source /usr/local/opt/chruby/share/chruby/auto.sh
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/gus/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/gus/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/gus/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/gus/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# zprof

export PATH="$(brew --prefix qt@5)/bin:$PATH"

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
alias ngrok='/Users/verdy/.bin/ngrok'


eval "$(direnv hook zsh)"

. /usr/local/opt/asdf/libexec/asdf.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
