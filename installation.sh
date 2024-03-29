#!bin/bash
sudo_check(){
	if ["$EUID" == 0]; then
		echo "please run this script as normal user"
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
		mkdir /home/$USER/.config
	fi
}
#check for .config directory
#check for picom directory
dir_check2(){
	if [ -d $HOME/.config/picom]; then
		echo "picom dir found"
	else
		echo "picom dir not found, creating one"
		mkdir /home/$USER/.config/picom
	fi
}

pkg_install(){
	sudo pacman -S -y update
	sudo pacman -S -y install bspwm nnn kitty rofi picom polybar pulseaudio xorg feh
}
#install packages and programs
dotfiles_setup(){
	mkdir ~/.config/bspwm
	mkdir ~/.config/sxhkd
	mkdir ~/.config/polybar
	mkdir ~/.config/rofi
	mkdir ~/.config/kitty
	cp bspwm/bspwmrc ~/.config/bspwm
	cp sxhkd/sxhkdrc ~/.config/sxhkd
	cp polybar/config.ini ~/.config/polybar
	cp kitty/kitty.conf ~/.config/kitty
	cp rofi/config.rasi ~/.config/rofi
	cp rofi/theme1.rasi ~/.config/rofi
	cp picom/picom.conf ~/.config/picom
	cp .xinitrc ~/
	cp .bashrc ~/
}
#copy dotfiles over to .config

#chmod 774 some files
chmod_bspwm(){
	chmod 774 /home/$USER/.config/sxhkd/sxhkdrc
	chmod 774 /home/$USER/.config/bspwm/bspwmrc
}


#run all the functions
read -p "Proceed with installation?" -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
	echo "Installing..."
	sudo_check
	dir_check
	dir_check2
	pkg_install
	dotfiles_setup
	chmod_bspwm
	read -p "Installation finished. Do you wish to reboot?" -r
	if [[ $REPLY =~ ^[Yy]$ ]]; then
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

