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
[[ ! -e "$ZCACHE" ]] && mkdir "$ZCACHE"
HISTFILE="$ZCACHE/history"
HISTSIZE=20000
SAVEHIST=20000

# Do not display duplicates when searching for history
setopt HIST_FIND_NO_DUPS

# Do not put duplicated command into history list
setopt HIST_IGNORE_ALL_DUPS

# Do not save duplicated command
setopt HIST_SAVE_NO_DUPS

# Append command to history file immediately after execution
setopt INC_APPEND_HISTORY_TIME

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

# -- Fzf config --
# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git . $HOME'

# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Change to a directory below home.
export FZF_ALT_C_COMMAND="fd --type d --hidden --exclude .git . $HOME "

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# Search and install Pacman and AUR packages with fzf.
# For this to work properly you need to run "sudo pacman -Fy" at least once.
pacfind() {
  pacman -Sl |
  sd '^\w+ ' '' |       # Remove the repository name.
  sort -u |     # Remove duplicates.
  awk '{print $1($3=="" ? "" : " *")}' |
  fzf -q "$1" -m -e \
  --header='Search packages' \
  --preview='bat -n --color=always <(pacman -Si {1}) <(pacman -Fl {1} | awk "{print \$2}")' \
  --preview-window right,65%,wrap \
  --info=hidden \
  --layout=reverse-list \
  --ansi |
  xargs -ro sudo pacman -S
}

aurfind() {
  yay -Sl |
  sd '^\w+ ' '' |
  sort -u |
  awk '{print $1($3=="" ? "" : " *")}' |
  fzf -q "$1" -m -e \
  --header='Search packages' \
  --preview='bat -n --color=always <(yay -Si {1})' \
  --preview-window right,65%,wrap \
  --info=hidden \
  --bind=ctrl-p:preview:'bat -n --color=always <(curl -s https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD\?h={1})' \
  --bind=ctrl-x:preview:'bat -n --color=always <(yay -Si {1})' \
  --layout=reverse-list \
  --ansi |
  xargs -ro yay -S
}

# Browse installed packages.
pacview() {
  pacman -Qqe |
  fzf -q "$1" -m -e \
  --header='Search packages' \
  --preview='bat -n --color=always <(yay -Si {1})' \
  --preview-window right,65%,wrap \
  --info=hidden \
  --ansi \
  --layout=reverse-list |
  xargs -ro sudo pacman -S
}

# Plugins
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# A better way to navigate directories
source /home/lucas/.config/broot/launcher/bash/br

