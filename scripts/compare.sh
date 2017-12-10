# Download all the files - run like 
# url "https://raw.githubusercontent.com/albertlincoln/dotfiles/master/scripts/dotfiles-install.sh" | bash
HOME=/home/$(whoami)

set +x
#for file in .bashrc .profile .vimrc .gitconfig .ssh/config ; do
for file in $(find home -type f | sed "s/^home\///" | xargs); do
    if [ -e ${HOME}/$file ]; then
        ls ${HOME}/$file
        diff home/$file ${HOME}/$file
    fi
done
set -x


