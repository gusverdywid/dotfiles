#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# Use Homebrew directories to manage ruby rather than the ~/.rbenv
export RBENV_ROOT=/usr/local/var/rbenv

# Activate autoenv
source /usr/local/opt/autoenv/activate.sh

#
# Powerlevel9k
#
export DEFAULT_USER=gus
export KEYTIMEOUT=1

POWERLEVEL9K_MODE='awesome-patched'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(time context dir rbenv node_version status)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vcs vi_mode)
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M:%S \uE868 %d/%m/%Y}"
POWERLEVEL9K_SHOW_CHANGESET=true
POWERLEVEL9K_CHANGESET_HASH_LENGTH=6


#
# Zsh-autosuggestion
#

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=95"

# Enable autosuggestions automatically.
zle-line-init() {
 zle autosuggest-start
}
zle -N zle-line-init

