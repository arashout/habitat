# Nightlight
night_light(){
    gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
    gsettings set org.gnome.settings-daemon.plugins.color night-light-schedule-from 18.0
    gsettings set org.gnome.settings-daemon.plugins.color night-light-schedule-to 8.0
    gsettings set org.gnome.settings-daemon.plugins.color night-light-temperature uint32 1700
}

generate_log(){
    now=`date +"%Y-%m-%d"`
    filepath=~/Documents/Logs/$now-log.md
    
    touch $filepath || exit

    log_string="##${now}\n### TODO:\n\n### Stand-Up:\n\n### Questions:\n### Notes:\n"
    echo -e $log_string > $filepath
    macdown $filepath
}

#####
# GIT
#####

if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi

function gchb() {
    git checkout -b "$@"
    git branch -u origin/"$@" # So I can avoid the set upstream stuff
}


# check if git name and email is set, if not set it to default
if [[ ! $(git config --global user.email) ]]; then
    echo "Git name and email conf not set, set them automatically"
    git config --global user.email "arash.out@gmail.com"
    git config --global user.name "Arash Outadi"
    git config --global core.editor "code"
fi

###########
# Utilities
###########

function extract {
    if [ -z "$1" ]; then
        # display usage if no parameters given
        echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    else
        if [ -f $1 ] ; then
            # NAME=${1%.*}
            # echo $NAME
            # mkdir $NAME && cd $NAME
            case $1 in
                *.tar.bz2)   tar xvjf ./$1    ;;
                *.tar.gz)    tar xvzf ./$1    ;;
                *.tar.xz)    tar xvJf ./$1    ;;
                *.lzma)      unlzma ./$1      ;;
                *.bz2)       bunzip2 ./$1     ;;
                *.rar)       unrar x -ad ./$1 ;;
                *.gz)        gunzip ./$1      ;;
                *.tar)       tar xvf ./$1     ;;
                *.tbz2)      tar xvjf ./$1    ;;
                *.tgz)       tar xvzf ./$1    ;;
                *.zip)       unzip ./$1       ;;
                *.Z)         uncompress ./$1  ;;
                *.7z)        7z x ./$1        ;;
                *.xz)        unxz ./$1        ;;
                *.exe)       cabextract ./$1  ;;
                *)           echo "extract: '$1' - unknown archive method" ;;
            esac
        else
            echo "$1 - file does not exist"
        fi
    fi
}
