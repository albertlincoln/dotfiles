# Download all the files - run like 
# url "https://raw.githubusercontent.com/albertlincoln/dotfiles/master/scripts/dotfiles-install.sh" | bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
HOME=/home/$(whoami)

cd $DIR/../
DIFFERENT=0
#for file in .bashrc .profile .vimrc .gitconfig .ssh/config ; do
for file in $(find home -type f | sed "s/^home\///" | xargs); do
    if [ "${1}" == "-v" ] && [ -e ${HOME}/$file ]; then
        diff -q home/$file ${HOME}/$file
        diff home/$file ${HOME}/$file
        DIFFERENT=$(($DIFFERENT + $?))
    elif [ -e ${HOME}/$file ]; then
        diff -q home/$file ${HOME}/$file
        DIFFERENT=$(($DIFFERENT + $?))
    fi
done

if [ "${DIFFERENT}" == "0" ]; then
    echo "All dotfiles are in sync."
fi

