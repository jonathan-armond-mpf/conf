#!/bin/bash

# Config file directory
confdir=~/conf
targetdir=~

# List of files/dirs to symlink with a dot prefix
dotfiles=`ls -d $confdir/dot*`
for i in $dotfiles
do
    f=`basename $i`
    fdot=${f:3}
    echo $fdot
    echo $f
    ln -fsnv $confdir/$f $targetdir/.$fdot
done

# List of files/dirs to symlink without name changes
#trees=""
#for i in $trees
#do
#    ln -Ffsv $confdir/$i $targetdir/$i
#done
