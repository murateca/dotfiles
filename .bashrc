## ~/.bashrc

# if not running interactively, don't do anything
[ -z "$PS1" ] && return

# source bash_git
source ~/.bash.d/.bash_git

# prompt
export PS1='\[\e[1m\]\u\[\e[m\]\[\e[1;31m\]@\h\[\e[m\] \[\e[36m\]\w\[\e[m\]\[\e[35m\]$(__git_ps1)\[\e[m\]\n\[\e[1;36m\]>\[\e[m\] '

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

# change the window title of X terminals
case ${TERM} in
	xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
		;;
	screen*)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
		;;
esac

# aliases
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# functions
if [ -f ~/.functions ]; then
	. ~/.functions
fi


# bash completion
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi
