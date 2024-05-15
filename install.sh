#!/bin/bash

# Colors
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

INSTALL_HOME="/home/kali"

echo -e "${yellowColour}[!] Installing firsts packets...${endColour}"
sleep 1
sudo apt install build-essential git vim libxcb-util0-dev libxcb-ewmh-dev \
    libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev \
    libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev -y

sudo apt install libxcb-randr0-dev libxcb-xtest0-dev libxcb-xinerama0-dev \
    libxcb-shape0-dev libxcb-xkb-dev libpcre3-dev -y

echo -e "${yellowColour}[!] Installing bspwm...${endColour}"
sleep 1
sudo apt install bspwm -y
mkdir "$INSTALL_HOME/.config/bspwm"
cp ./bspwm/bspwmrc "$INSTALL_HOME/.config/bspwm/"
chmod +x $INSTALL_HOME/.config/bspwm/bspwmrc
mkdir "$INSTALL_HOME/.config/bspwm/scripts"
cp ./bspwm/bspwm_resize "$INSTALL_HOME/.config/bspwm/scripts"
chmod +x $INSTALL_HOME/.config/bspwm/scripts/bspwm_resize

echo -e "${yellowColour}[!]${endColour} Installing sxhkd..."
sleep 1
sudo apt install sxhkd -y
mkdir "$INSTALL_HOME/.config/sxhkd"
cp ./sxhkd/sxhkdrc "$INSTALL_HOME/.config/sxhkd/"

echo -e "${yellowColour}[!] Installing gnome-terminal...${endColour}"
sleep 1
sudo apt install gnome-terminal dconf-cli -y
gsettings set org.gnome.Terminal.Legacy.Settings default-show-menubar false

# <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Cargar perfil gnome-terminal >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

echo -e "${yellowColour}[!] Installing polybar...${endColour}"
sleep 1
sudo apt install polybar -y
mkdir $INSTALL_HOME/.config/polybar

# <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Cargar configuración de la polybar >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

echo -e "${yellowColour}[!] Installing picom...${endColour}"
sleep 1
sudo apt install libconfig-dev libdbus-1-dev libegl-dev libev-dev libgl-dev \
    libepoxy-dev libpcre2-dev libpixman-1-dev libx11-xcb-dev libxcb1-dev \
    libxcb-composite0-dev libxcb-damage0-dev libxcb-dpms0-dev libxcb-glx0-dev \
    libxcb-image0-dev libxcb-present-dev libxcb-randr0-dev libxcb-render0-dev \
    libxcb-render-util0-dev libxcb-shape0-dev libxcb-util-dev libxcb-xfixes0-dev \
    libxext-dev meson ninja-build uthash-dev -y

git clone https://github.com/yshui/picom
cd picom; meson setup --buildtype=release build
ninja -C build
ninja -C build install
cd ..

echo -e "${yellowColour}[!] Installing rofi...${endColour}"
sleep 1
sudo apt install rofi -y

echo -e "${yellowColour}[!] Installing Hack Nerd Fonts...${endColour}"
sleep 1
sudo cp ./fonts/* /usr/local/share/fonts/

echo -e "${yellowColour}[!] Installing zsh...${endColour}"
sleep 1
sudo apt install zsh -y
cp ./zsh/.zshrc "$INSTALL_HOME/"

echo -e "${yellowColour}[!] Installing feh...${endColour}"
sudo apt install feh -y
mkdir "$INSTALL_HOME/.config/wallpapers"
sudo mkdir "/usr/share/wallpapers/custom"
sudo cp "wallpaper.jpg" "/usr/share/wallpapers/custom/"

echo -e "${yellowColour}[!] Installing fonts...${endColour}"
sudo cp ./fonts/Hack* /usr/local/share/fonts/
sudo rm ./fonts/Hack*
sudo cp ./fonts/* /usr/local/share/fonts/truetype/
fc-cache -v

echo -e "${yellowColour}[!] Now, you have to log in with bspwm window manager${endColour}"
echo -e "${yellowColour}[!] Please press any key to logout: ${endColour}"
read -p ""
kill -9 -1





