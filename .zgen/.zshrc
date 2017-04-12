# Zgen

# If autocompletion is broken comment these line and 'zgen reset' once
autoload -Uz compinit && \
   compinit -C

source "${HOME}/.zgen/zgen.zsh"

# if the init scipt doesn't exist
if ! zgen saved; then
    echo "Creating a zgen save"
    # ZGEN_LOADED=()
    # ZGEN_COMPLETIONS=()

    # Prezto
    zgen prezto
    zgen prezto '*:*' color 'yes'
    zgen prezto prompt theme 'sorinx'
    zgen prezto git
    zgen prezto syntax-highlighting
    # zgen prezto history-substring-search # Using FZF instead

    # Warn you when you run a command that you've got an alias for
    zgen load djui/alias-tips

    # # Automatically run zgen update and zgen selfupdate every 7 days
    # zgen load unixorn/autoupdate-zgen

    # some aliases
    # zgen load unixorn/jpb.zshplugin

    # # OS X helpers
    # zgen load unixorn/tumult.plugin.zsh

    # # Load more completion files for zsh from the zsh-lovers github repo
    zgen load zsh-users/zsh-completions src

    # Docker completion
    zgen load srijanshetty/docker-zsh
    # zgen load felixr/docker-zsh-completion

    # zgen load vasyharan/zsh-brew-services

    # GENCOMPL_FPATH=$HOME/.zsh/complete

    # Add Fish-like autosuggestions to your ZSH
    zgen load zsh-users/zsh-autosuggestions

    # Adds aliases to open your current repo & branch on github.
    zgen load peterhurford/git-it-on.zsh

    zgen load adolfoabegg/browse-commit

    zgen load horosgrisa/autoenv

    # k is a zsh script / plugin to make directory listings more readable,
    # adding a bit of color and some git status information on files and directories
    zgen load rimraf/k

    # generate the init script from plugins above
    zgen save
fi

[ -f ~/.zprezto.custom ] && source ~/.zprezto.custom

[ -f ~/.zshrc.common ] && source ~/.zshrc.common
