eval "$(starship init zsh)"
. $HOME/.asdf/asdf.sh
GOPATH=$HOME/GO

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    ag
    ansible
    asdf
    brew
    cargo
    docker
    kubectl
    kubectx
    nmap
    pass
    rsync
    postgres
    rebar
    rust
    ripgrep
    screen
    ssh-agent
    tmux
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

alias k=kubectl
alias kns=kubens
alias ktx=kubectx

ctags=/opt/homebrew/bin/ctags
export GPG_TTY=$(tty)

export CFLAGS='-Wall -Werror -Wextra'
alias cc="cc ${CFLAGS}"

# setup some completions
fpath=(${HOME}/.asdf/completions $fpath)
autoload -Uz compinit && compinit

if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi
