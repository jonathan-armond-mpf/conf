#!/bin/bash

# Config file directory
confdir=~/conf
targetdir=~

# List of files/dirs to symlink with a dot prefix
dotfiles=`ls $confdir/dot*`
for i in $dotfiles
do
    f=`basename $i`
    ln -Ffsv $confdir/$f $targetdir/.$f
done

# List of files/dirs to symlink without name changes
#trees=""
#for i in $trees
#do
#    ln -Ffsv $confdir/$i $targetdir/$i
#done
