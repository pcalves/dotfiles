#!/bin/sh

# From: http://wiki.qiaoanran.com/vimwiki.html

GIT=`command -v git`
COMMIT_TIMESTAMP=`date +'%Y-%m-%d %H:%M:%S %Z'`
NVIM=`command -v nvim`

# convert wiki files to html files
$NVIM +VimwikiTabIndex +VimwikiAll2HTML +qall > /dev/null

cd $HOME/vimwiki
$GIT add --all .
$GIT commit -am "Automated update on $COMMIT_TIMESTAMP"
$GIT push origin master
