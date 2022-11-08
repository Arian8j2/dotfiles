unsetopt autocd

PS1="%B%(?.%F{green}.%F{red})➜  %F{cyan}%1~ %b%F{white}"

alias ls="ls --color=auto"

# https://github.com/softmoth/zsh-vim-mode
source "/home/$USER/Projects/zsh-vim-mode/zsh-vim-mode.plugin.zsh"
bindkey -M viins ',c' vi-cmd-mode

export PATH="$PATH:/home/$USER/.local/bin:/home/$USER/.cargo/bin"
export EDITOR=/bin/vim
export MAKEFLAGS="-j24"

alias ipinfo="curl http://ip-api.com/"

nsgetip() {
    nslookup $1 | tail -n 2 | grep --color=never -oP 'Address: \K.+'
}

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

local zshrc_local_path="/home/$USER/.zshrc.local"
if [ -f "$zshrc_local_path" ]; then
    source "$zshrc_local_path"
fi
