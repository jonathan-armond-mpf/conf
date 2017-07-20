#!/bin/bash

targetdir=~

# Config file directories
declare -a confdir=("$HOME/conf" "$HOME/conf/private")
for d in "${confdir[@]}"
do
    echo "Processing directory $d"
    # List of files/dirs to symlink with a dot prefix
    dotfiles=`ls -d $d/dot*`
    for i in $dotfiles
    do
        f=`basename $i`
        fdot=${f:3}
        ln -fsnv $d/$f $targetdir/.$fdot
    done
done

