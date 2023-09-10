#!/bin/bash
echo dtparam=i2c_arm=on,i2c_arm_baudrate=400000 >> /boot/config.txt
echo dtoverlay=gpio-shutdown,gpio_pin=4,active_low=1,gpio_pull=up >> /boot/config.txt
echo " "
echo " "
echo " "
# Clone SKU_RM0004 library
echo "----------------------------------------------------------------"
echo "Commence SKU_RM0004 Library"
echo "----------------------------------------------------------------"
git clone https://github.com/UCTRONICS/SKU_RM0004.git
echo "----------------------------------------------------------------"
echo " "
echo " "
echo " "
echo "----------------------------------------------------------------"
# Compile
cd SKU_RM0004
make
echo "----------------------------------------------------------------"
echo " "
echo " "
echo " "
echo "----------------------------------------------------------------"
# Run
#./display
echo "----------------------------------------------------------------"
echo " "
echo " "
echo " "
echo "----------------------------------------------------------------"
# Add Automatic Start Script
echo "----------------------------------------------------------------"
sed -i 's/0/ /g' /etc/rc.local
sed -i 's/exit //g' /etc/rc.local
echo cd /home/pi/SKU_RM0004 >> /etc/rc.local
echo make clean >> /etc/rc.local
echo make >> /etc/rc.local
echo ./display & >> /etc/rc.local
echo "exit 0" >> /etc/rc.local
echo "----------------------------------------------------------------"
echo " "
echo " "
echo " "
echo "----------------------------------------------------------------"
sudo reboot
