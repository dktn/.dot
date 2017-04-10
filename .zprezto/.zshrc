# Prezto zsh config

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize Prezto

# turn off command corrections
unsetopt CORRECT

# restore normal behaviour
unalias cp    2>/dev/null
unalias ln    2>/dev/null
unalias mkdir 2>/dev/null
unalias mv    2>/dev/null
unalias rm    2>/dev/null

[ -f ~/.zshrc.common ] && source ~/.zshrc.common
