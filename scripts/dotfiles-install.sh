## Download all the files - run like curl "https://raw.githubusercontent.com/albertlincoln/dotfiles/master/scripts/dotfiles-install.sh?token=${TOKEN}"

set -e
set -x

cd /home/${whoami}

curl -O https://github.com/albertlincoln/dotfiles/raw/master/home/.gitconfig?token=${TOKEN}
