read -p "This script only works on Arch and should be manually inspected before using. Continue(y/n)?" choice
case "$choice" in 
  y|Y ) echo "Proceeding....";;
  n|N ) exit;;
  * ) echo "invalid";exit;
esac
sudo pacman -Syu
sudo pacman -S - < ./pkglist.txt
git init
git remote add origin git@github.com:Moelf/dotFiles.git
git pull origin master
