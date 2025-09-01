cd $HOME
rm -f .zshrc
rm -f .zshenv
rm -f .zcompdump
rm -f .tmux.conf
git clone https://github.com/pmrrasmussen/dotfiles.git
cd dotfiles
git submodule update --init --recursive
cd $HOME
mkdir -p .config
ln -s $HOME/dotfiles/zsh/zshenv .zshenv
ln -s $HOME/dotfiles/tmux/tmux.conf .tmux.conf
ln -s $HOME/dotfiles/nvim .config/nvim
