if [ -f $HOME/.bashrc ]; then
  source $HOME/.bashrc
fi

# load all files from .shell/login.d directory
if [ -d $HOME/.shell/login.d ]; then
  for file in $HOME/.shell/login.d/*.sh; do
    source $file
  done
fi

# set PATH so it includes user's private bin directories
PATH="$HOME/bin:$HOME/.local/bin:$PATH"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CONFIG_DIRS="/etc/xdg"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_DATA_DIRS="/usr/local/share/:/usr/share"
export XDG_CACHE_HOME="$HOME/.cache"

