echo -e "${yellowColour}[!] Configuring Burpsuite...${endColour}"
sleep 1
cat /home/$USER/.BurpSuite/UserConfigCommunity.json | sed 's/Light/Dark/; s/11/13/g' > tmp.tmp
cat tmp.tmp > /home/$USER/.BurpSuite/UserConfigCommunity.json
rm tmp.tmp