#!/bin/sh

what=-
test "$@" && what="$@"
PLUGIN_DIR="$HOME/psql-pager/pgcli/plugin"
exec vim --not-a-term -u NONE -S $PLUGIN_DIR/pgcli.vim -c "set clipboard+=unnamed" -c "let &runtimepath='$PLUGIN_DIR,' . &runtimepath" -c Less $what
