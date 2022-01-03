sudo pacman -Syu wl-clipboard xsel git fisher fish neovim stow fzf

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

fisher install PatrickF1/fzf.fish
fisher install jethrokuan/z
fisher install jomik/fish-gruvbox
