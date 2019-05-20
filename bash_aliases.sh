#!/bin/sh
alias bashrc="code ~/.bashrc"

unamestr=`uname -s`

case "${unamestr}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    FreeBSD*)    machine=Mac;;
esac

# Platform specific
# Linux
if [[ "$unamestr" == 'Linux' ]]; then
    alias rewifi='nmcli nm wifi off && nmcli nm wifi on'
    alias sourcebashrc='source ~/.bashrc'
    # Clipboard
    alias cb="xclip -selection c"
# Mac OS X
elif [[ "$unamestr" == 'FreeBSD' || "$unamestr" == 'Darwin' ]]; then
    alias timestamp='date +%s | pbcopy; echo "Timestamp copied to clipboard"; date +%s;'
    alias md='open -a MacDown'
    alias bashprofile='code ~/.bash_profile'
    alias sourceprofile='source ~/.bash_profile'
fi

# Personal aliases
alias cdhome='cd ~/'

# Very handy tweaks
alias chmox='chmod +x'
alias schmox='sudo chmod +x'

alias wget='wget -c' # resumes downloads by default

# git shortcuts
alias gs='git stash'
alias gsp='git stash pop'
alias gst='git status'
alias gc='git commit -m'
alias gca='git commit -a -m'
alias gp='git push'
# Git push the current branch
alias gpcb='git push origin $(git rev-parse --abbrev-ref HEAD)' 
alias ga.='git add .'
alias gd='git diff'
alias gch='git checkout'

alias bfg='java -jar ~/Downloads/bfg.jar'

# docker shortcuts
alias dp='docker ps'
alias dpa='docker ps -a'
alias dstatus='docker-compose exec dev supervisorctl status'
alias dlog='docker-compose logs dev'
alias dstopall='docker stop $(docker ps -aq)'
