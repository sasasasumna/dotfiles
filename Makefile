#!/bin/bash
ZSH_PATH = "/usr/local/bin/zsh"

all: copy_configs git oh-my-zsh zsh
	

copy_configs: gemrc zshrc zshrc
	

brew:
	if [[ -e /usr/local/bin/brew ]]
	then ""
	else ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	fi

zsh: brew
	if [ ! `brew list | grep ^zsh$` = "zsh" ]; then
	brew install zsh
	fi

shell: zsh
	if [ ! `cat /etc/shells | grep ^${ZSH_PATH}$` = "${ZSH_PATH}" ]; then
	echo ${ZSH_PATH} | sudo tee --append /etc/shells > /dev/null
	fi
	chsh -s ${ZSH_PATH}

gemrc:
	rm -f ~/.gemrc
	ln -s `pwd`/.gemrc ~/.gemrc

gitconfig:
	rm -f ~/.gitconfig
	ln -s `pwd`/.gitconfig ~/.gitconfig

zshrc:
	rm -f ~/.zshrc
	ln -s `pwd`/.zshrc ~/.zshrc


git: brew
	if [ ! `brew list | grep ^git$` = "git" ]; then
	brew install git
	fi

oh-my-zsh:
	rm -rf ~/.oh-my-zsh
	git clone git@github.com:robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

