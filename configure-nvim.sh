#!/bin/bash
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

USER=$(whoami)

echo -e "${yellowColour}[!] Configuring nvim...${endColour}"
sleep 2

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