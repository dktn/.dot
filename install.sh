rm -f ~/.gitconfig ~/.gitignore_global ~/.tmux.conf ~/.zshrc

ln -s ~/.dot/.gitconfig ~/.gitconfig
ln -s ~/.dot/.gitignore_global ~/.gitignore_global
ln -s ~/.dot/.tmux.conf ~/.tmux.conf
ln -s ~/.dot/.zshrc ~/.zshrc

rm -rf ~/.hammerspoon
ln -s ~/.dot/.hammerspoon ~/.hammerspoon

touch ~/.zshrc.local
