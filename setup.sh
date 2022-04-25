#!/bin/fish
sudo pacman -Syu wl-clipboard xsel git fisher fish neovim stow fzf ripgrep wofi otf-font-awesome pamixer pipewire pipewire-pulse

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

fisher install PatrickF1/fzf.fish
fisher install jethrokuan/z
fisher install jomik/fish-gruvbox
