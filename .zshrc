export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(zsh-vim-mode) # https://github.com/softmoth/zsh-vim-mode
source $ZSH/oh-my-zsh.sh

zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' frequency 30
export DISABLE_UPDATE_PROMPT=off

bindkey -M viins ',c' vi-cmd-mode

unsetopt autocd
export PATH="$PATH:/home/arian/.local/bin"
export EDITOR=/bin/vim

alias ipinfo="curl http://ip-api.com/"

export MAKEFLAGS="-j24"

lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}

bindkey -s '^o' 'lfcd\n'

