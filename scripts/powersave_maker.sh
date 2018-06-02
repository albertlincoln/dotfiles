cat powertop_commands.sh | awk '{ print "if [ -e " $4 " ]; then\n
" $NC "\n  echo \""$NC"\"\nfi"}' > root/usr/local/bin/powersave.sh
