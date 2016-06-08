# bash won't get SIGWINCH if another process is in the foreground.
# enable checkwinsize so that bash will check the terminal size when
# it regains control. #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

## why would you type 'cd dir' if you could just type 'dir'?
shopt -s autocd
shopt -s cdspell
shopt -s cdable_vars
#shopt -s failglob

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar