
# Download all the files - run like 
# `curl -L https://git.io/fAxKl | bash`
if [ "$DOTFILES_VERBOSE" = "true" ]; then
    set -euxo pipefail
fi

# Requirements
sudo apt-get install -y git curl


ORIGIN_REPO=git@github.com:albertlincoln/dotfiles.git
LOCAL_REPO=$HOME/src/dotfiles
if [ ! -d $LOCAL_REPO/.git ]; then
    echo "Cloning repo"
    mkdir -p $HOME/src
    cd $HOME/src
    git clone $ORIGIN_REPO
else
    cd $LOCAL_REPO
    git pull
fi

BACKUPS="${LOCAL_REPO}/backups/$(whoami).$(hostname -s)"
CURTIME=$(date '+%Y-%m-%d.%H-%M-%S')
BACKUPDIR=${BACKUPS}/$CURTIME
BACKUPLOG=${BACKUPS}/logs/$CURTIME-cleanup.log
MY_REPO_DIR="https://raw.githubusercontent.com/albertlincoln/dotfiles/master"
mkdir -p ${BACKUPDIR}
mkdir -p ${BACKUPS}/logs


cd ${HOME}
FILES2PROC=$(curl -s ${MY_REPO_DIR}/manifests/home.txt | xargs)
for file in ${DOTFILE2PROC:-$FILES2PROC}; do
    echo $file
    mkdir -p ${BACKUPDIR}/$(dirname $file)
    mkdir -p $(dirname $file)
    touch -a $file
    cp $file $BACKUPDIR/$file
    # this saves the file
    curl -s -o ${HOME}/$file $MY_REPO_DIR/home/${file}

    diff -q $BACKUPDIR/$file $HOME/$file
    if [ "$?" = "0" ]; then
        rm $BACKUPDIR/$file
    fi
    if [ "$DOTFILES_VERBOSE" = "true" ]; then
        sleep ${DOTFILES_SLEEP:=1}
        echo ""
        echo ""
    fi
done

find $BACKUPDIR -empty -delete


