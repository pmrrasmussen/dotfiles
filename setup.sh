cd $HOME
# Remove old dotfiles
rm -f .zshrc
rm -f .zshenv
rm -rf .config/nvim
rm -rf .config/hypr
rm -rf .config/git
rm -rf .config/alacritty
rm -f .tmux.conf

# Remove nvim cache
rm -rf .local/share/nvim
rm -rf .local/state/nvim
rm -rf .cache/nvim
rm -rf dotfiles

git clone https://github.com/pmrrasmussen/dotfiles.git
cd dotfiles
git submodule update --init --recursive
cd $HOME
mkdir -p .config
ln -s $HOME/dotfiles/zsh/.zshenv .zshenv
ln -s $HOME/dotfiles/tmux/tmux.conf .tmux.conf
ln -s $HOME/dotfiles/nvim .config/nvim
ln -s $HOME/dotfiles/git .config/git
ln -s $HOME/dotfiles/hypr .config/hypr
ln -s $HOME/dotfiles/hypr .config/alacritty
