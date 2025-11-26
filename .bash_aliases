alias grep='grep --color=auto'

alias ls='ls --color=auto'
alias ls='eza --icons --long -all --header'

alias weather='curl wttr.in/$WEATHER_LOCATION'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias open='xdg-open'
