rm -f ~/.gitconfig ~/.gitignore_global ~/.tmux.conf ~/.zshrc
ln -s ~/.dot/.gitconfig ~/.gitconfig
ln -s ~/.dot/.gitignore_global ~/.gitignore_global
ln -s ~/.dot/.tmux.conf ~/.tmux.conf
mkdir -p ~/.hammerspoon
rm -f ~/.hammerspoon/init.lua
ln -s ~/.dot/.hammerspoon/init.lua ~/.hammerspoon/init.lua
touch ~/.zshrc.local
