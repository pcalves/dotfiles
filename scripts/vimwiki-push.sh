#!/bin/sh

# From: http://wiki.qiaoanran.com/vimwiki.html

GIT=`which git`
COMMIT_TIMESTAMP=`date +'%Y-%m-%d %H:%M:%S %Z'`

# convert wiki files to html files
nvim +VimwikiTabIndex +VimwikiAll2HTML +qall > /dev/null

cd $HOME
${GIT} add --all .
${GIT} commit -am "Automated update on ${COMMIT_TIMESTAMP}"
${GIT} push origin master
