## Debian - raspberry pi

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
  PS1_DEBIAN_CHROOT='${debian_chroot:+($debian_chroot)}'
else
  PS1_DEBIAN_CHROOT=
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
  xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  # We have color support; assume it's compliant with Ecma-48
  # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
  # a case would tend to support setf rather than setaf.)    
    SH_WHITE="\[\033[1;37m\]"
    SH_BLUE="\[\033[1;34m\]"
    SH_RED="\[\033[1;31m\]"
    SH_GREEN="\[\033[1;32m\]"
    SH_YELLOW="\[\033[1;33m\]"
    SH_END="\[\033[00m\]"
  else
    SH_WHITE=
    SH_BLUE=
    SH_RED=
    SH_GREEN=
    SH_YELLOW=
    SH_END=
  fi
fi
PS1_USERNAME=${SH_GREEN}"\u@\h"
PS1_TIME=${SH_RED}"\t"
PS1_LOCATION=${SH_BLUE}"\w"
END=${SH_END}
# Activate git prompt
GITPROMPT="$HOME/.shell/source.d/git-prompt.sh"
if [ -f $GITPROMPT ]; then
  source $GITPROMPT
  PS1_GIT=${SH_YELLOW}'$(__git_ps1 "\n(%s)")'
  #parse_git_branch () { git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'; }
  #PS1_GIT=$(parse_git_branch)
else
  PS1_GIT=
fi

PS1=$PS1_DEBIAN_CHROOT$PS1_TIME" "$PS1_USERNAME':'$PS1_LOCATION$PS1_GIT$END'\n\$ '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac
