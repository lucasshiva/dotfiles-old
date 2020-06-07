# Default programs:
export EDITOR="vim"
export VISUAL="micro"
export TERMINAL="kitty"
export BROWSER="firefox"
export FILE="nemo"

# Python Poetry.
export PATH="$HOME/.poetry/bin:$PATH"

# Cargo binaries.
export PATH="$HOME/.cargo/bin:$PATH"

# Allow all files in bin and the subdirs to be in PATH
# Checks for the folder existence.
[ ! -e "$HOME/bin" ] && mkdir $HOME/bin
export PATH=$PATH$( find $HOME/bin/ -type d -printf ":%p" )
