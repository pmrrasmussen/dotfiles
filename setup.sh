rm .zsh*
rm .zcompdump
git clone https://github.com/pmrrasmussen/dotfiles.git
mkdir -p .config
ln -s $HOME/dotfiles/zsh/.zshenv .zshenv
ln -s $HOME/dotfiles/.tmux.conf .tmux.conf
ln -s $HOME/dotfiles/nvim .config/nvim
