# Load prompt
autoload -U promptinit; promptinit
prompt pure

# Load aliases
[ -f ~/.config/aliasrc ] && source ~/.config/aliasrc

# History in cache directory
HISTFILE=~/.cache/zsh/zsh_history
HISTSIZE=1000
SAVEHIST=1000

# Automatically cd into directories by just typing the directory name
setopt autocd

# Setup poetry autocompletion
fpath+=~/.zfunc

# Basic auto/tab complete
autoload -U compinit
zstyle ':completion:*' menu select
# Auto complete with case insenstivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

zmodload zsh/complist
_comp_options+=(globdots)	
[ ! -d "$HOME/.cache/zsh" ] && mkdir "$HOME/.cache/zsh"
compinit -d "$HOME/.cache/zsh/zcompdump"

# Colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# This file has some important variables
source $HOME/.zprofile

# Load my ZSH plugins
for plugin in /usr/share/zsh/plugins/*; do
    plugin_name=${plugin##*/}
    source "${plugin}/${plugin_name}.plugin.zsh"
done

# Search and install Pacman and AUR packages with fzf.
# For this to work properly you need to run "sudo pacman -Fy" at least once.
pi() {
    pacman -Slq | fzf --header='Install packages' -m --preview 'cat <(pacman -Si {1}) \
        <(pacman -Fl {1} | awk "{print \$2}")' | xargs -ro sudo pacman -S
}

yi() {
    yay -Slq | fzf --header='Install packages' -m --preview 'yay -Si {1}' | xargs -ro  yay -S
}

# Colored man pages.
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

# Pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

