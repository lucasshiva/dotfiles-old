# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Poetry completions.
[[ ! -e "$ZDOTDIR/.zfunc" ]] && mkdir "$ZDOTDIR/.zfunc"
fpath+="$ZDOTDIR/.zfunc"

# Pyenv
eval "$(pyenv init -)"

# Allows you to select in a menu
zstyle ':completion:*' menu select

# Auto complete with case insensivity.
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Display a description during completion
zstyle ':completion:*:*:*:*:descriptions' format '%F{green}-- %d --%f'

# Set descriptions order.
zstyle ':completion:*:*:-command-:*:*' group-order alias builtins functions commands

# Group different types of matches under their descriptions
zstyle ':completion:*' group-name ''

# Cache completions.
zstyle ':completion:*' use-cache on

# Enable completion
autoload -U compinit; compinit

# Lets files beginning with a . to be matched without specifying the dot.
setopt globdots

# Load aliases
source $ZDOTDIR/aliases

# History config
HISTFILE="$ZCACHE/history"
HISTSIZE=5000
SAVEHIST=5000

# Colored man pages
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

# Search and install Pacman and AUR packages with fzf.
# For this to work properly you need to run "sudo pacman -Fy" at least once.
pi() {
    pacman -Slq | fzf --header='Install packages' -m --preview 'cat <(pacman -Si {1}) \
        <(pacman -Fl {1} | awk "{print \$2}")' | xargs -ro sudo pacman -S
}

yi() {
    yay -Slq | fzf --header='Install packages' -m --preview 'yay -Si {1}' | xargs -ro  yay -S
}

# Plugins
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
