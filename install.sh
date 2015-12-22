rm -f ~/.tmux.conf
ln -s ~/.dot/.tmux.conf ~/.tmux.conf

rm -f ~/.zshrc
ln -s ~/.dot/.zshrc ~/.zshrc

rm -f ~/.oh-my-zsh/themes/agnoster-dktn-zsh.theme
ln -s ~/.dot/agnoster-dktn-zsh.theme ~/.oh-my-zsh/themes/agnoster-dktn-zsh.theme

rm -f ~/.gitconfig ~/.gitignore_global
ln -s ~/.dot/.gitconfig ~/.gitconfig
ln -s ~/.dot/.gitignore_global ~/.gitignore_global

rm -rf ~/.hammerspoon
ln -s ~/.dot/.hammerspoon ~/.hammerspoon

touch ~/.zshrc.local
