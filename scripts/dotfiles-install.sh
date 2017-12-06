# Download all the files - run like 
# url "https://raw.githubusercontent.com/albertlincoln/dotfiles/master/scripts/dotfiles-install.sh" | bash
BACKUPDIR=.dotfile_backups/$(date +%s)

set -e
set -x
if [ -x fdupes ]; then
	cd ~/.BACKUPDIR
	fdupes -r -N -d ~/.dotfile_backups/ && find ~/.dotfile_backups -empty -delete
fi

cd /home/$(whoami)
for file in .bashrc .profile .vimrc .gitconfig .ssh/config; do
    mkdir -p ${BACKUPDIR} $(dirname /home/$(whoami)/$file)
    touch $file
    mv $file $BACKUPDIR/
    curl -q -O https://raw.githubusercontent.com/albertlincoln/dotfiles/master/home/${file}
done


