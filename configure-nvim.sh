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