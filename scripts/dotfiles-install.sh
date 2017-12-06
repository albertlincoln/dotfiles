# Download all the files - run like 
# url "https://raw.githubusercontent.com/albertlincoln/dotfiles/master/scripts/dotfiles-install.sh" | bash

set -e
set -x

cd /home/$(whoami)
for file in .bashrc .profile .vimrc .gitconfig .ssh/config; do
    echo $file
    BACKUPDIR=.dotfile_backups/$(date +%s)
    mkdir -p ${BACKUPDIR}
    mkdir -p $(dirname /home/$(whoami)/$file)
    touch $file
    mv $file $BACKUPDIR/
    curl -O https://raw.githubusercontent.com/albertlincoln/dotfiles/master/home/${file}
done


