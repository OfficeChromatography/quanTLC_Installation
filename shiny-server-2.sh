#install script for Shiny-Server: quanTLC and rTLC _ Part 2
#!/bin/bash
echo""
echo "***********************************************************"
echo ""
echo "You are going to install shiny-server."
echo ""
echo "Don't worry, this will take some time!"
echo ""
echo "Are you ready to start? (y/n)"
read userinput
if [ "$userinput" == "y" ]
then
  echo "Installing Shiny Server"
  echo ""
  yes | sudo apt install gdebi-core
  yes | wget https://download3.rstudio.org/ubuntu-18.04/x86_64/shiny-server-1.5.20.1002-amd64.deb
  #yes | sudo gdebi shiny-server-1.5.20.1002-amd64.deb  #funktioniert nicht!! Manuell ausführen!!
  echo ""
  echo "Copying quanTLC to Shiny Server."
  yes | sudo cp -R /usr/local/lib/R/site-library/quanTLC/shinyapps/quanTLC /srv/shiny-server/quanTLC
  yes | sudo chmod 777 -R /srv/shiny-server/quanTLC
  echo ""
  echo "Downloading rTLC"
  yes | sudo git clone https://github.com/OfficeChromatography/rTLC-apps.git
  yes | sudo cp -R rTLC-apps /srv/shiny-server/rTLC-apps
  yes | sudo mv /srv/shiny-server/rTLC-apps /srv/shiny-server/rTLC
  echo ""
  #echo "Performing reboot"
  #sudo reboot
  echo "Shiny-Server manuell installieren!!"
else
  echo "The installation was skipped"
fi
