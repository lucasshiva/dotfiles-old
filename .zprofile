# Default programs:
export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="kitty"
export BROWSER="firefox"
export FILE="pcmanfm"
 
# Poetry - A package manager for Python
export PATH="$HOME/.poetry/bin:$PATH"
 
# Pyenv - A Python version manager
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
 
# Cargo binaries.
export PATH="$HOME/.cargo/bin:$PATH"
 
# Allow all files in bin and the subdirs to be in PATH
# Create the folder if it doesn't exist.
[ ! -e "$HOME/bin" ] && mkdir $HOME/bin
export PATH=$PATH$( find $HOME/bin/ -type d -printf ":%p" )
 
# Local binaries
export PATH="$HOME/.local/bin:$PATH"
