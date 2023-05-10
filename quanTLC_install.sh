#install script for OC_manager2
#!/bin/bash
echo""
echo "***********************************************************"
echo ""
echo "You are going to install quanTLC on your Raspberry Pi."
echo ""
echo "Don't worry, this will take some time!"
echo ""
echo "Are you ready to start? (y/n)"
read userinput
if [ "$userinput" == "y" ]
then
  echo "Installing r-base"
  yes | sudo apt install r-base
  echo ""
  echo "Installing libraries"
  yes | sudo apt install libssl-dev libcurl4-openssl-dev r-cran-rgl libtiff5-dev 
  yes | sudo apt install libssh2-1-dev libxml2-dev libgit2-dev libnlopt-dev
  echo ""
  echo "Installing quanTLC"
  echo ""
  yes | sudo su - -c "R -e \"library(remotes)\""
  yes | sudo su - -c "R -e \"remotes::install_github('OfficeChromatography/quanTLC', lib='/usr/lib/R/site-library/')\""
  yes | sudo su - -c "R -e \"tinytex::install_tinytex()\""
  yes | sudo chmod 777 -R /usr/lib/R/site-library/quanTLC 
  echo "Performing reboot"
  sudo reboot
else
  echo "The installation was skipped"
fi
