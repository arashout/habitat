unamestr=`uname -s`

case "${unamestr}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    FreeBSD*)    machine=Mac;;
esac

cat ./bashrc.sh | cat - $HOME/.bashrc > temp && mv temp $HOME/.bashrc
cat bash_aliases.sh > $HOME/.bash_aliases