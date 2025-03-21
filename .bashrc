#! /usr/bin/env bash

# ~/.bashrc
# Kraken's bashrc

# if not running interactively, don't do anything
case $- in
	*i*) ;;
	  *) return;;
esac

# don't put duplicate lines or lines starting with space in history
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# alias definitions
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# fetch
fastfetch

# prompt
eval "$(starship init bash)"
