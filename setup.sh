#!/bin/fish
sudo pacman -Syu stow

stow homedir --target=$HOME --adopt

sudo pacman -Syu ttf-liberation ttf-opensans xdg-desktop-portal-wlr slurp grim brightnessctl bluez bluez-utils pavucontrol easyeffects polkit-gnome fcitx5-rime fcitx5-gtk swaybg fprintd cliphist wl-clipboard git fisher fish neovim stow fzf ripgrep wofi otf-monaspace otf-font-awesome pamixer pipewire pipewire-pulse alacritty playerctl fastfetch

fisher install PatrickF1/fzf.fish
fisher install jethrokuan/z
fisher install jomik/fish-gruvbox
