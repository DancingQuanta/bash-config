#!/usr/bin/env bash
## DancingQuanta/bash-config - https://github.com/DancingQuanta/bash-config
## $HOME/.bashrc
##
## Based on https://github.com/ek9/shell-config
## 
## this file is sourced by all *interactive* bash shells on startup,
## including some apparently interactive shells such as scp and rcp
## that can't tolerate any output. so make sure this doesn't display
## anything or bad things will happen !

# test for an interactive shell. there is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
  # shell is non-interactive. be done now!
  return
fi

# load shell agnostic config files from $HOME/.config/shell/config.d
if test -d "$HOME/.config/shell/config.d/"; then
	for shell_config in $HOME/.config/shell/config.d/*.sh; do
		test -r "$shell_config" && . "$shell_config"
	done
	unset shell_config
fi

# load bash specific config files from $HOME/.config/bash/config.d
if test -d "$HOME/.config/bash/config.d/"; then
	for bash_config in $HOME/.config/bash/config.d/*.bash; do
		test -r "$bash_config" && . "$bash_config"
	done
	unset bash_config
fi

# Local configuration

# load shell agnostic config files from $HOME/.config/shell/config-local.d
if test -d "$HOME/.config/shell/config-local.d/"; then
	for shell_config_local in $HOME/.config/shell/config-local.d/*.sh; do
		test -r "$shell_config_local" && . "$shell_config_local"
	done
	unset shell_config_local
fi

# load bash specific config files from $HOME/.config/bash/config.d
if test -d "$HOME/.config/bash/config-local.d/"; then
	for bash_config_local in $HOME/.config/bash/config-local.d/*.bash; do
		test -r "$bash_config_local" && . "$bash_config_local"
	done
	unset bash_config_local
fi

