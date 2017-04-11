# Zgen

zstyle ':prezto:*:*' color 'yes'

source "${HOME}/.zgen/zgen.zsh"

# if the init scipt doesn't exist
if ! zgen saved; then

    # Prezto
    zgen prezto
    zgen prezto prompt theme 'sorinx'
    zgen prezto git

    # Warn you when you run a command that you've got an alias for
    zgen load djui/alias-tips

    zgen load rimraf/k

    # Automatically run zgen update and zgen selfupdate every 7 days
    zgen load unixorn/autoupdate-zgen

    # OS X helpers
    zgen load unixorn/tumult.plugin.zsh

    # Load more completion files for zsh from the zsh-lovers github repo
    zgen load zsh-users/zsh-completions src

    # generate the init script from plugins above
    zgen save
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
