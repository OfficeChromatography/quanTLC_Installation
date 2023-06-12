#install script for Shiny-Server: quanTLC and rTLC _ Part 1
#!/bin/bash
echo""
echo "***********************************************************"
echo ""
echo "You are going to install quanTLC."
echo ""
echo "Don't worry, this will take some time!"
echo ""
echo "Are you ready to start? (y/n)"
read userinput
if [ "$userinput" == "y" ]
then
  echo "Installing git"
  yes | sudo apt install git
  echo "Installing r-base"
  yes | sudo apt install r-base r-base-dev     #--version=4.1.2??
  echo ""
  echo "Installing libraries"
  yes | sudo apt install libssl-dev libcurl4-openssl-dev r-cran-rgl libtiff5-dev 
  yes | sudo apt install libssh2-1-dev libxml2-dev libgit2-dev libnlopt-dev
  echo ""
  echo "Installing Java"
  yes | sudo apt install default-jdk
  echo "Installing LaTex"
  yes | sudo apt install texlive-latex-extra
  echo ""
  echo "Installing R packages"
  echo ""
  yes | sudo su - -c "R -e \"install.packages(c('chemometrics', 'klaR', 'evtree', 'threejs', 'shinyAce'))\""
  yes | sudo su - -c "R -e \"install.packages('devtools')\""
  yes | sudo su - -c "R -e \"install.packages('rJava',,'http://rforge.net', type='source')\""
  yes | sudo su - -c "R -e \"library(devtools)\""
  yes | sudo su - -c "R -e \"devtools::install_github('colearendt/xlsx')\""
  yes | sudo su - -c "R -e \"devtools::install_github('cran/DiscriMiner')\""
  yes | sudo su - -c "R -e \"devtools::install_github('cran/randomForest')\""     #benötigt R > 4.1.0 
  yes | sudo su - -c "R -e \"devtools::install_github('cran/extraTrees')\""
  yes | sudo su - -c "R -e \"devtools::install_github('rstudio/d3heatmap')\""
  yes | sudo su - -c "R -e \"devtools::install_github('rwehrens/ChemometricsWithR')\""
  yes | sudo su - -c "R -e \"install.packages('shiny', repos='https://cran.rstudio.com/')\""
  yes | sudo su - -c "R -e \"tinytex::install_tinytex()\""
  yes | sudo su - -c "R -e \"install.packages('remotes', repos='https://cran.rstudio.com/')\""
  yes | sudo su - -c "R -e \"library(remotes)\""
  yes | sudo su - -c "R -e \"remotes::install_github('OfficeChromatography/quanTLC', lib='/usr/local/lib/R/site-library/')\""
  yes | sudo chmod 777 -R /usr/local/lib/R/site-library/quanTLC/shinyapps/quanTLC
  echo ""
  echo "Performing reboot"
  sudo reboot
else
  echo "The installation was skipped"
fi
