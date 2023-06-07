#install script for Shiny-Server and quanTLC
#!/bin/bash
echo""
echo "***********************************************************"
echo ""
echo "You are going to install quanTLC and shiny-server."
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
  echo "Installing R packages"
  echo ""
  yes | sudo su - -c "R -e \"install.packages('remotes', repos='https://cran.rstudio.com/')\""
  yes | sudo su - -c "R -e \"library(remotes)\""
  yes | sudo su - -c "R -e \"remotes::install_github('OfficeChromatography/quanTLC', lib='/usr/lib/R/site-library/')\""
  yes | sudo su - -c "R -e \"tinytex::install_tinytex()\""
  yes | sudo chmod 777 -R /usr/lib/R/site-library/quanTLC
  echo "Installing Shiny Server"
  echo ""
  yes | sudo apt install gdebi-core
  yes | wget https://download3.rstudio.org/ubuntu-18.04/x86_64/shiny-server-1.5.20.1002-amd64.deb
  yes | sudo gdebi shiny-server-1.5.20.1002-amd64.deb
  echo ""
  echo "Copying quanTLC to Shiny Server."
  yes | sudo cp -R /usr/lib/R/site-library/quanTLC /srv/shiny-server
  echo "Performing reboot"
  sudo reboot
else
  echo "The installation was skipped"
fi
