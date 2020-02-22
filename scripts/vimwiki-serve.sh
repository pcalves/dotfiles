#!/bin/sh

NODE=`command -v node`
FOREVER=`command -v forever`

cd $HOME/vimwiki
SERVE=true $FOREVER start -c $NODE index.js
