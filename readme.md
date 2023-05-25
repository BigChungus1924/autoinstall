# Autoinstall
This script makes installing and configuring my window manager setup extremely straightforward. 
The aim of this bash script is to save time lost setting up all the dotfiles and toying with the settings. Instead, in a few seconds, you get a functional graphical environnement that's also minimal.

## Installation
The process is quite straightforward, you have to install git with:
```
sudo apt install git
```
Then, you can clone the repo and launch the script:
```
git clone https://github.com/BigChungus1924/autoinstall
cd autoinstall
bash installation.sh
```
Make sure to run with bash instead of sh
### About
As stated earlier, this scripts leaves you with a minimal graphical environnement that is perfectly functionnal. This script is made for Debian bases distributions as it uses the apt package manager. After instalation, you are left with around ~800 packages.
It comes with a default wallpaper set using **feh** trough **bspwmrc**. Feel free to change it.
