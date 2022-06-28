## ~/.zshrc

# omz config
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="${HOME}/.zsh.d/.oh-my-zsh"

ZSH_THEME="robbyrussell"
ZSH_DISABLE_COMPFIX="true"

plugins=(git)

if [[ -d $ZSH ]]; then source $ZSH/oh-my-zsh.sh; else PROMPT="%n@%m %~ "; fi

# aliases
source $HOME/.aliases

# functions
source $HOME/.functions

