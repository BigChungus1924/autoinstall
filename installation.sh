# !bin/bash
sudo_check(){
	if ["$EUID" -ne 0]; then
		echo "please run this script as root"
		sleep 3
		exit
	fi
}
#check for root

#Check for packages
dir_check(){
	if [ -d $HOME/.config]; then
		echo "config dir found, beggining installation"
	else
		echo "config dir not found, creating"
		mkdir home/$USER/.config
	fi
}
#check for .config directory
#check for picom directory
dir_check2(){
	if [ -d $HOME/.config/picom]; then
		echo "picom dir found"
	else
		echo "picom dir not found, creating one"
		mkdir home/$USER/.config/picom
	fi
}

pkg_install(){
	apt -y update
	apt -y install bspwm nnn kitty rofi picom polybar pulseaudio xorg feh
}
#install packages and programs
dotfiles_setup(){
	mkdir ~/.config/bspwm
	cp bspwm/bspwmrc ~/.config/bspwm
	mkdir ~/.config/sxhkd
	cp sxhkd/sxhkdrc ~/.config/sxhkd
	mkdir ~/.config/polybar
	cp polybar/config.ini ~/.config/polybar
	cp kitty/kitty.conf ~/.config/kitty
	#rofi
	cp picom/picom ~/.config/picom
	cp xorg/.xinitrc/ ~/
	cp bash/.bashrc ~/
}
#copy dotfiles over to .config

#chmod 774 some files
chmod_bspwm(){
	chmod 774 /home/$USER/.config/sxhkd/sxhkdrc
	chmod 774 /home/$USER/.config/bspwm/bspwmrc
}


#run all the functions
read -p "Proceed with installation?" 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
	echo "Installing..."
	sudo_check
	dir_check
	dir_check2
	pkg_install
	dotfiles_setup
	chmod_bspwm
	echo "Installation finished. Do you wish to reboot?"
	read reboot
	if [[ $reboot == y*]]; then
		echo "rebooting..."
		sleep 3
		reboot
	else
		echo "OK"
		exit
	fi
else
	echo "aborted"
	sleep 3
	exit
fi

#finish up and tidy up

