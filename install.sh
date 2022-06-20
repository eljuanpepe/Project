#!/usr/bin/env bash

install() {
	editor=$1
	background=$2
	mkdir $HOME/.local/share/project/
	touch $HOME/.local/share/project/projects-locations
	sed "s/nvim/$editor $background/g" project.sh >> project
	chmod 744 project
	exec sudo mv project /usr/local/bin/project
}

if [[ $(id -u) != 0 ]]; then
	read -p "What Text Editor are you gonna use? (nvim) " text_editor 
	if [[ $text_editor != "" ]]; then
		read -p "Is it a Terminal Text Editor? (y/N) " yn
	fi

	if [[ $text_editor != "" ]]; then
		case $yn in
			["Y""y"]*)
				install $text_editor "\& disown"
				;;
			["N""n"]*)
				install $text_editor 
				;;
			"")
				install $text_editor
				;;
			*)
				echo "Please only anwere with Yy or Nn"
				;;
		esac
	else
		install nvim
	fi
else 
	echo "Please don't execute this script as sudo."
	echo "The proper permisions will be requested once needed."
fi
