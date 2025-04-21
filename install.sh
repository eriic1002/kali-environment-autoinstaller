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

# Check if the script is running as root
USER=$(whoami)
if [ "$USER" == "root" ]; then
    echo -e "${redColour}[!] You can't run this script as root${endColour}"
    exit 1
fi


# Install bspwm
clear
echo -e "${yellowColour}[!] Installing bspwm...${endColour}"
sleep 2
sudo apt install bspwm -y
mkdir "/home/$USER/.config" 2>/dev/null
mkdir "/home/$USER/.config/bspwm"
cp ./bspwm/bspwmrc "/home/$USER/.config/bspwm/"
chmod +x /home/$USER/.config/bspwm/bspwmrc
mkdir "/home/$USER/.config/bspwm/scripts"
cp ./bspwm/bspwm_resize "/home/$USER/.config/bspwm/scripts"
chmod +x /home/$USER/.config/bspwm/scripts/bspwm_resize
cp ./bspwm/ethernet_status.sh "/home/$USER/.config/bspwm/scripts"
chmod +x /home/$USER/.config/bspwm/scripts/ethernet_status.sh
cp ./bspwm/target_ip_status.sh "/home/$USER/.config/bspwm/scripts"
chmod +x /home/$USER/.config/bspwm/scripts/target_ip_status.sh
cp ./bspwm/vpn_status.sh "/home/$USER/.config/bspwm/scripts"
chmod +x /home/$USER/.config/bspwm/scripts/vpn_status.sh
touch "/home/$USER/.config/bspwm/scripts/target_ip"
sudo mkdir -p /root/.config/bspwm/scripts/
sudo ln -s /home/$USER/.config/bspwm/scripts/target_ip /root/.config/bspwm/scripts/target_ip

# Install sxhkd
clear
echo -e "${yellowColour}[!] Installing sxhkd...${endColour}"
sleep 2
sudo apt install sxhkd -y
mkdir "/home/$USER/.config/sxhkd"
cp ./sxhkd/sxhkdrc "/home/$USER/.config/sxhkd/"

clear
echo -e "${yellowColour}[!] Installing kitty${endColour}"
sleep 2
sudo apt install kitty -y
mkdir "/home/$USER/.config/kitty"
cp ./kitty/kitty.conf "/home/$USER/.config/kitty/"
cp ./kitty/color.ini "/home/$USER/.config/kitty/"
sudo ln -s /home/$USER/.config/kitty/ /root/.config/kitty

clear
echo -e "${yellowColour}[!] Installing polybar...${endColour}"
sleep 2
sudo apt install polybar -y
mkdir /home/$USER/.config/polybar
cp -r ./polybar/* /home/$USER/.config/polybar/
chmod +x /home/$USER/.config/polybar/launch.sh
chmod +x /home/$USER/.config/polybar/scripts/powermenu

clear
echo -e "${yellowColour}[!] Configuring lightdm...${endColour}"
sleep 2
sudo cat /etc/lightdm/lightdm-gtk-greeter.conf | sed 's/Kali-Light/Kali-Dark/; s/\/usr\/share\/desktop-base\/kali-theme\/login\/background/\/usr\/share\/wallpapers\/custom\/wallpaper.jpg/' > tmp.tmp
sudo cp tmp.tmp /etc/lightdm/lightdm-gtk-greeter.conf
rm tmp.tmp

clear
echo -e "${yellowColour}[!] Installing picom...${endColour}"
sleep 2
sudo apt install libconfig-dev libdbus-1-dev libegl-dev libev-dev \
      libgl-dev libepoxy-dev libpcre2-dev libpixman-1-dev libx11-xcb-dev \
      libxcb1-dev libxcb-composite0-dev libxcb-damage0-dev libxcb-glx0-dev \
      libxcb-image0-dev libxcb-present-dev libxcb-randr0-dev libxcb-render0-dev \
      libxcb-render-util0-dev libxcb-shape0-dev libxcb-util-dev libxcb-xfixes0-dev \
      meson ninja-build uthash-dev -y

git clone https://github.com/yshui/picom ./picom-installer
cd picom-installer/
meson setup --buildtype=release build
ninja -C build
sudo ninja -C build install
cd ..
mkdir "/home/$USER/.config/picom"
cp ./picom/picom.conf /home/$USER/.config/picom/

clear
echo -e "${yellowColour}[!] Installing rofi...${endColour}"
sleep 2
sudo apt install rofi -y
mkdir /home/$USER/.config/rofi
mkdir /home/$USER/.config/rofi/themes
cp ./rofi/rounded-common.rasi /home/$USER/.config/rofi/themes/
cp ./rofi/rounded-custom.rasi /home/$USER/.config/rofi/themes/


clear
echo -e "${yellowColour}[!] Installing zsh & powerlevel10k...${endColour}"
sleep 2
sudo apt install zsh zsh-autosuggestions zsh-syntax-highlighting -y
cp ./zsh/.zshrc "/home/$USER/"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /home/$USER/.config/powerlevel10k
cp ./zsh/.p10k.zsh "/home/$USER/"
sudo rm /root/.zshrc
sudo ln /home/$USER/.zshrc /root/.zshrc
sudo ln /home/$USER/.p10k.zsh /root/.p10k.zsh 
sudo mkdir /root/.config 2>/dev/null
sudo ln -s /home/$USER/.config/powerlevel10k /root/.config/powerlevel10k
sudo usermod -s /bin/zsh $USER
sudo usermod -s /bin/zsh root
sudo cp ./zsh/main-highlighter.zsh /usr/share/zsh-syntax-highlighting/highlighters/main/main-highlighter.zsh
sudo mkdir /usr/share/zsh-sudo
sudo wget -P /usr/share/zsh-sudo https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh

clear
echo -e "${yellowColour}[!] Installing feh...${endColour}"
sleep 2
sudo apt install feh -y
sudo mkdir "/usr/share/wallpapers/custom"
sudo cp "wallpaper.jpg" "/usr/share/wallpapers/custom/wallpaper.jpg"

clear
echo -e "${yellowColour}[!] Installing fonts...${endColour}"
sleep 2
sudo cp ./fonts/Hack* /usr/local/share/fonts/
sudo rm ./fonts/Hack*
sudo mkdir /usr/local/share/fonts/truetype/
sudo cp ./fonts/* /usr/local/share/fonts/truetype/
fc-cache -v

clear
echo -e "${yellowColour}[!] Installing Nvim with Nvchad...${endColour}"
sleep 2
sudo apt-get install ninja-build gettext cmake curl build-essential -y
git clone https://github.com/neovim/neovim
cd neovim
git checkout stable
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
cd ..
git clone https://github.com/NvChad/starter ~/.config/nvim
nvim --headless '+Lazy! sync' +qa
cp ./nvim/chadrc.lua "/home/$USER/.config/nvim/lua/chadrc.lua"
cp ./nvim/init.lua "/home/$USER/.local/share/nvim/lazy/NvChad/lua/nvchad/plugins/init.lua"
nvim --headless -c "lua require('base46').load_all_highlights()" -c "quit"
sudo nvim --headless '+Lazy! sync' +qa
sudo rm -rf /root/.config/nvim
sudo rm -rf /root/.local/share/nvim
sudo ln -s /home/$USER/.config/nvim /root/.config/nvim
sudo ln -s /home/$USER/.local/share/nvim /root/.local/share/nvim
sudo nvim --headless -c "lua require('base46').load_all_highlights()" -c "quit"

clear
echo -e "${yellowColour}[!] Installing some essential tools...${endColour}"
sleep 2
sudo apt install gobuster seclists vmname -y
sudo apt install bat lsd fzf -y

clear
echo -e "${yellowColour}[!] Configurating some features...${endColour}"
sleep 2
sudo updatedb

clear
echo -e "${yellowColour}[!] Now, you have to log in with bspwm window manager${endColour}"
echo -e "${yellowColour}[!] Please press any key to logout: ${endColour}"
read -p ""
kill -9 -1