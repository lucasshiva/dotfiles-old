# ZSH cache directory
export ZCACHE="$XDG_CACHE_HOME/zsh"

export EDITOR="nvim"
export VISUAL="nvim"
export TERM="kitty"

# Colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Cargo binaries.
export PATH="$HOME/.cargo/bin:$PATH"

# Poetry - A package manager for Python
export PATH="$HOME/.poetry/bin:$PATH"

# Change GOPATH and add /bin to the PATH
export GOPATH="$HOME/Programming/go"
export PATH="$PATH:$HOME/Programming/go/bin"