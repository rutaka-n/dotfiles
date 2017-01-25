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

# shopt -p to details
shopt -s autocd cdspell checkjobs cmdhist dirspell globstar

[ -f $HOME/.rbenv/bin/rbenv ] && PATH="$HOME/.rbenv/bin:$PATH" && eval "$(rbenv init -)"

PATH="$PATH:$HOME/bin"

export PATH

export TERM=screen-256color

export EDITOR=vim

alias ll='ls -l'
alias la='ls -la'
alias b='bundle exec'
alias bi='bundle install'

export POLTERGEIST=1

# todo.sh
alias t='todo.sh'
export TODOTXT_DIR="$HOME/bin"
[ -f $TODOTXT_DIR/todo_completion ] && source $TODOTXT_DIR/todo_completion && complete -F _todo t

# added by travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh

[ -f $HOME/.bashrc.local ] && source $HOME/.bashrc.local
