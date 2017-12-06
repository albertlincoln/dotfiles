# Download all the files - run like 
# url "https://raw.githubusercontent.com/albertlincoln/dotfiles/master/scripts/dotfiles-install.sh" | bash

set -e
set -x

cd /home/$(whoami)
for file in .bashrc .profile .vimrc .gitconfig .ssh/config; do
    echo $file
    mkdir -p $(basename /home/$(whoami)/$file)
    rm -f $file
    curl -O https://raw.githubusercontent.com/albertlincoln/dotfiles/master/home/${file}
done


