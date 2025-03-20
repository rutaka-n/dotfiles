#!/bin/bash

what=-
test "$@" && what="$@"
PLUGIN_DIR="$HOME/psql-pager/psql/plugin"
exec vim --not-a-term -u NONE -S $PLUGIN_DIR/psql.vim -c "set clipboard+=unnamed" -c "let &runtimepath='$PLUGIN_DIR,' . &runtimepath" -c Less $what
