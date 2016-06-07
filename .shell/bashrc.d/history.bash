shopt -s histappend                # enable history appending instead of overwriting
HISTSIZE=100                       # remember up to 100 entries
HISTFILESIZE=$HISTSIZE             # store as many entries in file as in memory
HISTFILE=$HOME/.history            # share history file with zsh
HISTCONTROL=ignoredups:ignorespace # ignore lines starting with a whitespace, as well as duplicates
