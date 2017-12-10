# Download all the files - run like 
# url "https://raw.githubusercontent.com/albertlincoln/dotfiles/master/scripts/dotfiles-install.sh" | bash
HOME=/home/$(whoami)
BACKUPS=${HOME}/.dotfile_backups
BACKUPDIR=${BACKUPS}/$(date +%s)
mkdir -p ${BACKUPDIR}

set -ex
if [ -x $(which fdupes) ]; then
	fdupes -r -N -d ${BACKUPS}  > ${BACKUPDIR}/cleanup.log 2>&1
	find ${BACKUPS} -type d -empty -delete
fi

set +x
#for file in .bashrc .profile .vimrc .gitconfig .ssh/config ; do
for file in $(); do
    cd ${HOME}
    echo $file
    mkdir -p ${BACKUPDIR} $(dirname ${HOME}/$file)
    touch $file
    mv $file $BACKUPDIR/
    curl -s -o $file https://raw.githubusercontent.com/albertlincoln/dotfiles/master/home/${file}
done
set -x


