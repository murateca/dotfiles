#bash aliases
#apps
alias svim='vim -u ~/.SpaceVim/vimrc'
alias spacevim='gvim -u ~/.SpaceVim/vimrc'
#ls
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
#package managers
alias pacup='sudo pacman -Syu' 
alias aup='yaourt -Syu --aur' 
#editing
alias bashrc='vim $HOME/.bashrc && source $HOME/.bashrc' 
alias aliases='vim $HOME/.bash_aliases && source $HOME/.bashrc' 
alias vimrc='vim $HOME/.vimrc'
alias gitconfig='vim $HOME/.gitconfig'
alias grub='sudo vim /etc/default/grub'
alias grubup='sudo update-grub'
#general
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias cp='cp -i'
