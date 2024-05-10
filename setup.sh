#!/bin/fish
sudo pacman -Syu stow

stow homedir --target=$HOME --adopt

sudo pacman -Syu openssh polkit wl-clipboard git fisher fish neovim stow fzf ripgrep wofi otf-monaspace otf-font-awesome pamixer pipewire pipewire-pulse alacritty playerctl fastfetch

fisher install PatrickF1/fzf.fish
fisher install jethrokuan/z
fisher install jomik/fish-gruvbox
