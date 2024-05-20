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

echo -e "${yellowColour}[!] Updating system...${endColour}"
sleep 1
sudo apt-get update -y
sudo apt-get upgrade

echo -e "${yellowColour}[!] Installing firsts packets...${endColour}"
sleep 1
sudo apt install build-essential git vim libxcb-util0-dev libxcb-ewmh-dev \
    libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev \
    libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev xclip locate i3lock-fancy \
    open-vm-tools-desktop open-vm-tools libxcb-randr0-dev libxcb-xtest0-dev libxcb-xinerama0-dev \
    libxcb-shape0-dev libxcb-xkb-dev libpcre3-dev libglib2.0-bin -y

echo -e "${yellowColour}[!] Installing i3lock-fancy...${endColour}"
sleep 1
git clone https://github.com/meskarune/i3lock-fancy.git
cd i3lock-fancy
sudo make install
cd ..

USER=$(whoami)
echo -e "${yellowColour}[!] Installing bspwm...${endColour}"
sleep 1
sudo apt install bspwm -y
mkdir "/home/$USER/.config"
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

echo -e "${yellowColour}[!]${endColour} Installing sxhkd..."
sleep 1
sudo apt install sxhkd -y
mkdir "/home/$USER/.config/sxhkd"
cp ./sxhkd/sxhkdrc "/home/$USER/.config/sxhkd/"

echo -e "${yellowColour}[!] Installing gnome-terminal...${endColour}"
sleep 1
sudo apt install gnome-terminal dconf-cli -y
sudo git clone --depth 1 https://github.com/junegunn/fzf.git /root/.fzf
sudo /root/.fzf/install
git clone --depth 1 https://github.com/junegunn/fzf.git /home/$USER/.fzf
/home/$USER/.fzf/install

gsettings set org.gnome.Terminal.Legacy.Settings default-show-menubar false
cp gnome-terminal/gtk.css /home/$USER/.config/gtk-3.0/
dconf load /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/ < gnome-terminal/profile.dconf
gsettings set org.gnome.Terminal.ProfilesList default 'b1dcc9dd-5262-4d8d-a863-c897e6d979b9'

echo -e "${yellowColour}[!] Installing polybar...${endColour}"
sleep 1
sudo apt install polybar -y
mkdir /home/$USER/.config/polybar
cp -r ./polybar/* /home/$USER/.config/polybar/


echo -e "${yellowColour}[!] Configuring lightdm...${endColour}"
sleep 1
sudo cat /etc/lightdm/lightdm-gtk-greeter.conf | sed 's/Kali-Light/Kali-Dark/; s/\/usr\/share\/desktop-base\/kali-theme\/login\/background/\/usr\/share\/wallpapers\/custom\/wallpaper.jpg/' > tmp.tmp
sudo cp tmp.tmp /etc/lightdm/lightdm-gtk-greeter.conf
rm tmp.tmp


echo -e "${yellowColour}[!] Installing picom...${endColour}"
sleep 1
sudo apt install libconfig-dev libdbus-1-dev libegl-dev libev-dev libgl-dev \
    libepoxy-dev libpcre2-dev libpixman-1-dev libx11-xcb-dev libxcb1-dev \
    libxcb-composite0-dev libxcb-damage0-dev libxcb-dpms0-dev libxcb-glx0-dev \
    libxcb-image0-dev libxcb-present-dev libxcb-randr0-dev libxcb-render0-dev \
    libxcb-render-util0-dev libxcb-shape0-dev libxcb-util-dev libxcb-xfixes0-dev \
    libxext-dev meson ninja-build uthash-dev cmake -y

git clone https://github.com/yshui/picom ./picom-installer
cd picom-installer/; meson setup --buildtype=release build
ninja -C build
ninja -C build install
cd ..
mkdir "/home/$USER/.config/picom"
cp ./picom/picom.conf /home/$USER/.config/picom/

echo -e "${yellowColour}[!] Installing rofi...${endColour}"
sleep 1
sudo apt install rofi -y
mkdir /home/$USER/.config/rofi
mkdir /home/$USER/.config/rofi/themes
cp ./rofi/rounded-common.rasi /home/$USER/.config/rofi/themes/
cp ./rofi/rounded-custom.rasi /home/$USER/.config/rofi/themes/


echo -e "${yellowColour}[!] Installing Hack Nerd Fonts...${endColour}"
sleep 1
sudo cp ./fonts/* /usr/local/share/fonts/

echo -e "${yellowColour}[!] Installing zsh & powerlevel10k...${endColour}"
sleep 1
sudo apt install zsh zsh-autosuggestions zsh-syntax-highlighting -y
cp ./zsh/.zshrc "/home/$USER/"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /home/$USER/powerlevel10k
cp ./zsh/.p10k.zsh "/home/$USER/"
sudo rm /root/.zshrc
USER=$(whoami)
sudo ln /home/$USER/.zshrc /root/.zshrc
sudo ln /home/$USER/.p10k.zsh /root/.p10k.zsh 
sudo cp -r /home/$USER/powerlevel10k /root/
sudo usermod -s /bin/zsh root
usermod -s /bin/zsh $USER
sudo usermod -s /bin/zsh root
sudo cp ./zsh/main-highlighter.zsh /usr/share/zsh-syntax-highlighting/highlighters/main/main-highlighter.zsh
sudo mkdir /usr/share/zsh-sudo
sudo wget -P /usr/share/zsh-sudo https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh
sudo apt install bat lsd
cp ./zsh/.inputrc /home/$USER/

echo -e "${yellowColour}[!] Installing feh...${endColour}"
sleep 1
sudo apt install feh -y
mkdir "/home/$USER/.config/wallpapers"
sudo mkdir "/usr/share/wallpapers/custom"
sudo cp "wallpaper.jpeg" "/usr/share/wallpapers/custom/wallpaper.jpg"

echo -e "${yellowColour}[!] Installing fonts...${endColour}"
sleep 1
sudo cp ./fonts/Hack* /usr/local/share/fonts/
sudo rm ./fonts/Hack*
sudo cp ./fonts/* /usr/local/share/fonts/truetype/
fc-cache -v

echo -e "${yellowColour}[!] Configuring Burpsuite...${endColour}"
sleep 1
cat /home/$USER/.BurpSuite/UserConfigCommunity.json | sed 's/Light/Dark/; s/11/13/g' > tmp.tmp
cat tmp.tmp > /home/$USER/.BurpSuite/UserConfigCommunity.json
rm tmp.tmp

echo -e "${yellowColour}[!] Installing Nvim with Nvchad...${endColour}"
sleep 1
git clone https://github.com/NvChad/starter /home/$USER/.config/nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
rm nvim-linux64.tar.gz
echo '-- Configuración de transparencia
vim.cmd([[
  hi Normal guibg=NONE ctermbg=NONE
  hi LineNr guibg=NONE ctermbg=NONE
  hi SignColumn guibg=NONE ctermbg=NONE
  hi NormalNC guibg=NONE ctermbg=NONE
  hi EndOfBuffer guibg=NONE ctermbg=NONE
]])' >> /home/$USER/.config/nvim/init.lua
cp ./nvim/chadrc.lua /home/$USER/.config/nvim/lua/chadrc.lua
cp ./nvim/init.lua /home/$USER/.local/share/nvim/lazy/NvChad/lua/nvchad/plugins/init.lua

sudo cp -r /home/$USER/.config/nvim /root/.config/
sudo cp ./nvim/chadrc.lua /root/.config/nvim/lua/chadrc.lua
sudo cp ./nvim/init.lua /root/.local/share/nvim/lazy/NvChad/lua/nvchad/plugins/init.lua

echo -e "${yellowColour}[!] Configurating some features...${endColour}"
sleep 1
sudo updatedb

echo -e "${yellowColour}[!] Now, you have to log in with bspwm window manager${endColour}"
echo -e "${yellowColour}[!] Please press any key to logout: ${endColour}"
read -p ""
kill -9 -1