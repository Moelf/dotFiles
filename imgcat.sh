#!/bin/bash
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
dir="$HOME/imgdump"
rm -f $dir/*.png
scp -q -r jling@uaf-8.t2.ucsd.edu:~/public_html/imgcat/. $dir
# feh -y 300 -E 300 --thumbnails -d -S filename "$dir"
feh -S filename -x -g 1000x750 --zoom fill "$dir"
# feh -B black -Z --scale-down "$dir"
