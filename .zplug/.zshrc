# Minimal configuration

source ~/.zplug/init.zsh

# # Make sure to use double quotes
# zplug "zsh-users/zsh-history-substring-search"

zplug "rimraf/k"

zplug "sorin-ionescu/prezto", as:plugin, use:init.zsh, hook-build:"ln -s $ZPLUG_ROOT/repos/sorin-ionescu/prezto ${ZDOTDIR:-$HOME}/.zprezto"

zstyle ':prezto:*:*' color 'yes'

zstyle ':prezto:load' pmodule \
  'environment' \
  'terminal' \
  'editor' \
  'history' \
  'directory' \
  'spectrum' \
  'utility' \
  'completion' \
  'fasd' \
  'git' \
  'archive' \
  'syntax-highlighting' \
  'history-substring-search' \
  'prompt'

zstyle ':prezto:module:prompt' theme 'sorinx'

# zplug load --verbose
zplug load

[ -f ~/.zprezto.custom ] && source ~/.zprezto.custom

[ -f ~/.zshrc.common ] && source ~/.zshrc.common
