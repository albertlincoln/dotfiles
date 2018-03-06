# Download all the files - run like 
# curl "https://raw.githubusercontent.com/albertlincoln/dotfiles/master/scripts/dotfiles-install.sh" | bash
HOME=/home/$(whoami)
BACKUPS=${HOME}/.dotfile_backups
BACKUPDIR=${BACKUPS}/$(date +%s)
MY_REPO_DIR="https://raw.githubusercontent.com/albertlincoln/dotfiles/master"
mkdir -p ${BACKUPDIR}

which fdupes > /dev/null
if [ "$?" == "0" ]; then
	fdupes -r -N -d ${BACKUPS}  > ${BACKUPDIR}/cleanup.log 2>&1
	find ${BACKUPS} -type d -empty -delete
fi

set +x
which curl > /dev/null
if [ "$?" != "0" ]; then
    echo "Please install curl."
fi

for file in $(curl -s ${MY_REPO_DIR}/manifests/home.txt | xargs); do
    cd ${HOME}
    echo $file
    mkdir -p ${BACKUPDIR} $(dirname ${HOME}/$file)
    touch $file
    mv $file $BACKUPDIR/
    curl -s -o $file $MY_REPO_DIR/home/${file}
done
set -x


