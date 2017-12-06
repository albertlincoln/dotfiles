# Download all the files - run like 
# url "https://raw.githubusercontent.com/albertlincoln/dotfiles/master/scripts/dotfiles-install.sh" | bash

set -e
set -x

cd /home/${whoami}
for file in .gitconfig; do
    echo $file
    rm $file
    curl -O https://raw.githubusercontent.com/albertlincoln/dotfiles/master/home/.gitconfig

done
