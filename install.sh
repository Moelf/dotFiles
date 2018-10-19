read -p "This script only works on Arch and should be manually inspected before using. Continue(y/n)?" choice
case "$choice" in 
  y|Y ) echo "Proceeding....";;
  n|N ) exit;;
  * ) echo "invalid";exit;
esac
git init
git remote add origin git@github.com:Moelf/dotFiles.git
git pull origin master
read -p "In order for all the configs to work, this script can also install everything for you given you're using Arch, do you want to proceed(y/n)?" choice
case "$choice" in 
  y|Y ) echo "Proceeding....";;
  n|N ) exit;;
  * ) echo "invalid";exit;
esac
sudo pacman -Syu
sudo pacman -S - < ./pkglist.txt
