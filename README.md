# quanTLC_Installation

Download the code as zip and copy the installation script to your raspberry pi.

In the terminal, start the installation with:

```
sudo bash quanTLC_install.sh |& tee quanTLC-install.txt
```

In case of problems, you can consult the log file quanTLC-install.txt.

Change to the quantTLC directory
```
cd /usr/local/lib/R/site-library/quanTLC/shinyapps/quanTLC
```
and start R
```
R
```
Then in R, run this command to launch the application
```
quanTLC::run.quanTLC()
```
