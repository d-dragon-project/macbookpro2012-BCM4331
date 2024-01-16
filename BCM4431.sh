#!/bin/bash


clear 
echo "################################################################################"
echo " __________                          .___                    For MacbookPro2012 "
echo " \______   \_______  _________     __| _/____  ____   _____         A1278       "
echo "  |    |  _/\_  __ \/  _ \__  \   / __ |/ ___\/  _ \ /     \                    "
echo "  |    |   \ |  | \(  <_> ) __ \_/ /_/ \  \__(  <_> )  Y Y  \                   "
echo "  |______  / |__|   \____(____  /\____ |\___  >____/|__|_|  /                   "
echo "         \/                   \/      \/    \/            \/  by Eduardo Justo  "                                      
echo "  CHIPSET: BCM4331 802.11 a/b/g/n (rev02)                                       "	
echo "                           Firmware version : b43_019-4                         " 
echo "                         Driver version : 6.30.223.271-23                       "
echo "################################################################################"
sleep 2

PS3='Please enter your choice: '
options=("Install Wifi Driver" "Show Commands" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Install Wifi Driver")
            echo "Installing Packages and Drivers To Your Machine"
apt-get update
apt-get install -y linux-image-$(uname -r|sed 's,[^-]*-[^-]*-,,') linux-headers-$(uname -r|sed 's,[^-]*-[^-]*-,,')
dpkg -i dkms_3.0.12-1_all.deb
dpkg -i b43-fwcutter_019-4_amd64.deb
dpkg -i firmware-b43-installer_019-4_all.deb
dpkg -i firmware-b43legacy-installer_019-4_all.deb
dpkg -i broadcom-sta-dkms_6.30.223.271-23_all.deb
modprobe -r b44 b43 b43legacy ssb brcmsmac bcma
modprobe wl
            ;;
        "Show Commands")
            echo "apt-get update"
            echo "apt-get install linux-image-$(uname -r|sed 's,[^-]*-[^-]*-,,') linux-headers-$(uname -r|sed 's,[^-]*-[^-]*-,,')"
            echo "dpkg -i dkms_3.0.12-1_all.deb"
            echo "dpkg -i b34-fwcutter_019-4_amd64.deb"
            echo "dpkg -i firmware-b43-installer_019-4_all.deb"
            echo "dpkg -i firmware-b43legacy-installer_019-4_all.deb"
            echo "dpkg -i broadcom-sta-dkms_6.30.223.271-23_all.deb "
            echo "modprobe -r b44 b43 b43legacy ssb brcmsmac bcma"
            echo "modprobe wl"
            ;;
        "Quit")
            break
            ;;
        *) echo invalid option;;
    esac
done
 
