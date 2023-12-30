#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ll='exa -l -g --icons'
alias tree='exa --tree --icons'
alias vim='nvim'
alias pridefetch='python ~/.scripts/pridefetch/src/__main__.py -f trans'
PS1="\e[0;34m[\u@\h\e[m \e[0;35m\W\e[m \e[0;34m]\$ \e[m"
