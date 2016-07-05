#!/usr/bin/env bash

# Path to the bash it configuration
export BASH_IT="$HOME/.bash_it"

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='bakke'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Load Bash It
source $BASH_IT/bash_it.sh

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
PATH="$PATH:$HOME/bin"

export GOPATH="$HOME"
export TERM=xterm-256color

export EDITOR=nvim

alias ll='ls -l'
alias la='ls -la'
alias b='bundle exec'
alias bi='bundle install'

export POLTERGEIST=1

# todo.sh
alias t='todo.sh'
export TODOTXT_DIR="$HOME/bin"
source $TODOTXT_DIR/todo_completion
complete -F _todo t

# added by travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh
