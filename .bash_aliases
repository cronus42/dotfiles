
alias v='vim'
alias xclip="xclip -selection c"

#packet tracing
alias pkt_trace='sudo tcpflow -i wlan0 -c'
alias ip_trace='pkt_trace ip'
alias http_trace='pkt_trace port 80'

#for puppet
alias pparse='puppet parser validate'

# some more ls aliases
alias ls='ls -ltrh --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


#stupid touchpad
alias disable-touchpad='xinput set-prop `xinput list | grep -i touchpad | cut -f 2 | grep -oE '[[:digit:]]+'` "Device Enabled" 0'
alias enable-touchpad='xinput set-prop `xinput list | grep -i touchpad | cut -f 2 | grep -oE '[[:digit:]]+'` "Device Enabled" 1'

