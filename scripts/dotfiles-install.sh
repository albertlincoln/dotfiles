# Download all the files - run like 
# `curl https://git.io/fAxKl | bash`
if [ "$DOTFILES_VERBOSE" = "true" ]; then
    set -ex
fi

if [ ! "$DOTFILES_DECISION" = "GO" ]; then
    echo "If you really want to do this, set DOTFILES_DECISION=GO"
    exit
fi

HOMEDIR=/home/$(whoami)
LOCAL_REPO=$HOMEDIR/src/dotfiles
BACKUPS="${LOCAL_REPO}/backups/$(whoami).$(hostname -s)"
CURTIME=$(date ${DATE} '+%Y-%m-%d.%H-%M-%S')
BACKUPDIR=${BACKUPS}/$CURTIME
BACKUPLOG=${BACKUPS}/logs/$CURTIME-cleanup.log
MY_REPO_DIR="https://raw.githubusercontent.com/albertlincoln/dotfiles/master"
mkdir -p ${BACKUPDIR}
mkdir -p ${BACKUPS}/logs

which curl > /dev/null
if [ "$?" != "0" ]; then
    echo "Please install curl."
    exit 1
fi

cd ${HOME}
for file in $(curl -s ${MY_REPO_DIR}/manifests/home.txt | xargs); do
    mkdir -p ${BACKUPDIR}/$(dirname $file)
    touch -a $file
    cp $file $BACKUPDIR/$file
    curl -s -o $file $MY_REPO_DIR/home/${file}
    diff $BACKUPDIR/$file $file 2>&1 > /dev/null
    if [ "$?" = "0" ]; then
        rm $BACKUPDIR/$file
    fi
    if [ "$DOTFILES_VERBOSE" = "true" ]; then
        sleep ${DOTFILES_SLEEP:=2}
        echo ""
        echo ""
    fi
done


