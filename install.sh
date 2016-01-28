rm -f ~/.tmux.conf
ln -s ~/.dot/.tmux.conf ~/.tmux.conf

rm -f ~/.zshrc
ln -s ~/.dot/.zshrc ~/.zshrc

rm -f ~/.ghci
ln -s ~/.dot/.ghci ~/.ghci

rm -f ~/zsh_custom/themes/agnoster-dktn.zsh-theme
mkdir -p ~/zsh_custom/themes
ln -s ~/.dot/agnoster-dktn.zsh-theme ~/zsh_custom/themes/agnoster-dktn.zsh-theme

rm -f ~/.gitconfig ~/.gitignore_global
ln -s ~/.dot/.gitconfig ~/.gitconfig
ln -s ~/.dot/.gitignore_global ~/.gitignore_global

rm -rf ~/.hammerspoon
ln -s ~/.dot/.hammerspoon ~/.hammerspoon

touch ~/.zshrc.local
