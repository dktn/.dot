# Prezto zsh config

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

[ -f ~/.zprezto.custom ] && source ~/.zprezto.custom

[ -f ~/.zshrc.common ] && source ~/.zshrc.common
