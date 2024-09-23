#!/bin/bash

apt -y install nala net-tools gedit nala git wget vim neovim htop i3 dmenu i3blocks rofi feh compton terminator \
               pulseaudio alsa-tools materia-gtk-theme papirus-icon-theme lxappearance fonts-font-awesome polybar \
               yad xdotool scrot openssh-server bashtop npm arandr espeak imagemagick pdftk libreoffice \
	       transmission-gtk vlc light gnome-screenshot

git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

snap install slack dbeaver-ce postman


