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

PATH="$PATH:$HOME/bin"

export PATH

export TERM=screen-256color

export EDITOR=vim

alias b='bundle exec'

export POLTERGEIST=1

# added by travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh

[ -f $HOME/.bashrc.local ] && source $HOME/.bashrc.local

export TZ='Europe/Samara'

[ -f $HOME/.asdf/asdf.sh ] && source $HOME/.asdf/asdf.sh

[ -f $HOME/.asdf/completions/asdf.bash ] && source $HOME/.asdf/completions/asdf.bash
