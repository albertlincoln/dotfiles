alias duh='du -h --max-depth=1'
alias netmap='sudo nmap -p22,80 -oA /tmp/nmap_results 192.168.1.0/24 && \
    cat /tmp/nmap_results.gnmap &'

alias netmap2='sudo nmap -sP -oA /tmp/nmap_results 10.42.0.0/24 && \
    cat /tmp/nmap_results.gnmap &'

alias tailsys='tail /var/log/syslog -f -n 100'

alias gitinfo='git annex info --fast *'

alias dpkgpurge="dpkg -l | grep ^rc | awk '{print $2}' | xargs sudo dpkg -P"

alias dmesg="sudo dmesg"
