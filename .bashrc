#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

DOTFILES_DIR=~/dotfiles

# env file
GLOBAL_ENV_FILE=$DOTFILES_DIR/.env
if [ -f $GLOBAL_ENV_FILE ]; then
  source $GLOBAL_ENV_FILE
else
  echo "$GLOBAL_ENV_FILE does not exist!"
fi

# bash_aliases file
GLOBAL_ALIAS_FILE=$DOTFILES_DIR/.bash_aliases
if [ -f $GLOBAL_ALIAS_FILE ]; then
  source $GLOBAL_ALIAS_FILE
else
  echo "$GLOBAL_ALIAS_FILE does not exist!"
fi

# Starship
eval "$(starship init bash)"
eval "$PROMPT_COMMAND"

if [[ -z "$SSH_CONNECTION" ]] && [[ -z "$ZELLIJ" ]]; then
  eval "$(zellij setup --generate-auto-start bash)"
fi

. "$HOME/.cargo/env"

PATH=/usr/local/texlive/2025/bin/x86_64-linux/:$PATH
export ELECTRON_OZONE_PLATFORM_HINT=auto
export PATH="$HOME/.local/bin:$PATH"

export PATH=$PATH:/home/seanpden/.spicetify
