#!/bin/sh

NODE=`which node`
FOREVER=`which forever`

cd $HOME/vimwiki
SERVE=true ${FOREVER} start -c ${NODE} index.js
