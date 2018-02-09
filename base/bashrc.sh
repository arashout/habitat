export GOPATH=/Users/arashoutadi/go
export PATH=$PATH:$GOPATH/bin

# Git autocomplete
 if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
 fi
 
 generate_log(){
          now=`date +"%Y-%m-%d"`
          filepath=~/Documents/Logs/$now-log.md
          touch $filepath
          log_string="##${now}\n### TODO:\n\n### Stand-Up:\n\n### Questions:\n### Notes:\n"
          echo -e $log_string > $filepath
          macdown $filepath
}