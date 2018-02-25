unamestr=`uname -s`

case "${unamestr}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    FreeBSD*)    machine=Mac;;
esac

# MAC Setup
if [[ $machine == 'Mac' ]]; then
    # Append .bashrc
    cat ../base/bashrc.sh >> $HOME/.bashrc
fi