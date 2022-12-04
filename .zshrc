# configure zsh
unsetopt autocd
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=1000
setopt SHARE_HISTORY

PS1="%B%(?.%F{green}.%F{red})➜  %F{cyan}%1~ %b%F{white}"

# vim plugin (https://github.com/softmoth/zsh-vim-mode)
source /home/$USER/Projects/zsh-vim-mode/zsh-vim-mode.plugin.zsh
bindkey -M viins ',c' vi-cmd-mode

# lf cd
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

# others
nsgetip() {
    nslookup $1 | tail -n 2 | grep --color=never -oP 'Address: \K.+'
}

export PATH="$PATH:/home/$USER/.local/bin:/home/$USER/.cargo/bin"
export EDITOR=/bin/vim
export MAKEFLAGS="-j24"

ipinfo() {
    curl http://ip-api.com/$1
}
alias ls="ls --color=auto"

# custom config
local zshrc_local_path="/home/$USER/.zshrc.local"
[ -f "$zshrc_local_path" ] && source "$zshrc_local_path"
