# configure zsh
unsetopt autocd
export FPATH="$FPATH:$HOME/.local/share/zsh/site-functions"
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1

# don't save history when command starts with space
setopt HIST_IGNORE_SPACE

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^o" up-line-or-beginning-search
bindkey "^p" down-line-or-beginning-search

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt SHARE_HISTORY

netns=$(ip netns identify)
if [ -n "$netns" ]; then
    netns="%F{yellow}($netns) "
fi
PS1="%B$netns%(?.%F{green}.%F{red})➜  %F{cyan}%1~ %b%F{white}"

export WORDCHARS='*?_[]~=&;!#$%^(){}<>'
export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=00:tw=30;42:ow=30;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.avif=01;35:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:*~=00;90:*#=00;90:*.bak=00;90:*.old=00;90:*.orig=00;90:*.part=00;90:*.rej=00;90:*.swp=00;90:*.tmp=00;90:*.dpkg-dist=00;90:*.dpkg-old=00;90:*.ucf-dist=00;90:*.ucf-new=00;90:*.ucf-old=00;90:*.rpmnew=00;90:*.rpmorig=00;90:*.rpmsave=00;90:'

# vim plugin (https://github.com/softmoth/zsh-vim-mode)
source /home/$USER/Repos/zsh-vim-mode/zsh-vim-mode.plugin.zsh
bindkey -M viins ',c' vi-cmd-mode

# lf cd
lfcd () {
    local last_dir=$(lf -print-last-dir "$@")
    cd "$last_dir"
}

bindkey -s '^o' 'lfcd\n'

# others
export PATH="$PATH:/home/$USER/.local/bin:/home/$USER/.cargo/bin"
export EDITOR=/bin/vim
export MAKEFLAGS="-j24"
export npm_config_prefix="$HOME/.local"

ipinfo() {
    curl http://ip-api.com/$1
}
alias ls="ls --color=auto"

# custom config
local zshrc_local_path="/home/$USER/.zshrc.local"
[ -f "$zshrc_local_path" ] && source "$zshrc_local_path"

# add temporary route to exclude ip from vpn route
vpn_exclude() {
    ip="$1"
    sudo ip route add "$ip" via 192.168.1.1
}

# add permanent route to exclude ip from vpn route
vpn_exclude_permanent() {
    ip="$1"
    vpn_exclude "$ip"
    nmcli connection modify Wired\ connection\ 1 +ipv4.routes "$ip 192.168.1.1"
}

# not use vpn for specific url
add_url_route() {
    domain=$(echo "$1" | grep -Po "http(s?)://(\\K).*?(?=/)")
    ip=$(dig +short $domain | tail -n 1)
    echo -e "\033[0;34madding route for '$domain' '$ip'\033[0m"
    vpn_exclude "$ip"
}

# compress video
video_compress() {
    input="$1"
    output=$(echo "$input" | cut -d'.' -f1)
    # bigger value will compress more
    compress_level=${2:-32}
    ffmpeg -i "$input" -vcodec libx265 -crf "$compress_level" "$output-compressed.mp4"
}

# put delay in audio of video
audio_delay() {
    input="$1"
    delay=${2:-2}
    ffmpeg -i "$input" -itsoffset "$delay" -i "$input" -c:a copy -c:v copy -map 0:v:0 -map 1:a:0 test.mp4
}

dns() {
    case $1 in
        electro)
            echo -e 'nameserver 78.157.42.100\nnameserver 78.157.42.101' | sudo tee /etc/resolv.conf
            ;;
        cloudflare)
            echo -e 'nameserver 1.0.0.1\nnameserver 1.1.1.1' | sudo tee /etc/resolv.conf
        ;;
        *)
            echo "There is no DNS $1, choose between either electro/cloudflare" ; return
            ;;
    esac

    echo "DNS Updated successfully"
}

alias tofarsi="trans en:fa"
alias wvpn="sudo -E wvpn"
alias qr="qrencode -t utf8"
alias grep="grep --color=auto"

# disable gdb debuginfod
unset DEBUGINFOD_URLS

export GOPATH=/home/$USER/.go
export PATH=$PATH:/home/$USER/.local/share/gem/ruby/3.0.0/bin
