# quanTLC_Installation

Download the code as zip and copy the installation script to your raspberry pi.

In the terminal, change to the directory of the installation script, and start the installation with:

```
sudo bash quanTLC_install.sh |& tee quanTLC-install.txt
```

In case of problems (missing dependencies), you can consult the log file quanTLC-install.txt.

Starting quanTLC:

Start R:
```
R
```

Then in R, run this command to launch the application
```
quanTLC::run.quanTLC()
```
Last tested May 2023: Raspberry Pi 4, Raspberry Pi OS 64 bit, Debian 11 (bullseye).
