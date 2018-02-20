# Useful functions from habitat

export GOPATH=/Users/arashoutadi/go
export PATH=$PATH:$GOPATH/bin

# Git autocomplete
if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi

send_todays_log(){
    now=`date +"%Y-%m-%d"`
    filepath=~/Documents/Logs/$now-log.md
    markdown_string=`cat ${filepath}`

    export TODAYS_LOG_MD=$markdown_string
    # TODO: Write custom Python script that parses Github Markdown to Slack markdown
    # TODO: Send at 6pm everyday
    curl --trace-ascii dump.txt -X POST -H "Authorization: Bearer ${SLACK_API_TOKEN}" \
    -H 'Content-type: application/json' \
    --data "$(python -c 'import json, os, sys; print json.dumps({
        "channel": os.getenv("SLACK_RAVELIN_ME"),
        "text": os.getenv("TODAYS_LOG_MD"),
    })')" \
    https://slack.com/api/chat.postMessage
    unset TODAYS_LOG_MD

    echo # To create a new line after curl
    
}

generate_log(){
    now=`date +"%Y-%m-%d"`
    filepath=~/Documents/Logs/$now-log.md
    
    touch $filepath || exit

    log_string="##${now}\n### TODO:\n\n### Stand-Up:\n\n### Questions:\n### Notes:\n"
    echo -e $log_string > $filepath
    macdown $filepath

    send_todays_log() | at 18:00
}



# check if git name and email is set, if not set it to default
if [[ ! $(git config --global user.email) ]]; then
    echo "Git name and email conf not set, set them automatically"
    git config --global user.email "arash.out@gmail.com"
    git config --global user.name "Arash Outadi"
    git config --global core.editor "code"
fi

###########################################################################
# Utilities
###

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