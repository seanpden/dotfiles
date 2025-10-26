#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

# Starship
eval "$(starship init bash)"

DOTFILES_DIR=~/projects/dotfiles/

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
