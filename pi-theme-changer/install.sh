#!/bin/bash
# install Pi default apps

sudo cp ../pi-theme-changer/bin/pi-theme-script /usr/bin/pi-theme-script
sudo chmod 755 /usr/bin/pi-theme-script
sudo mkdir -p /usr/share/pi-apps/pi-theme-changer/
if [[ "$(uname -m)" == "x86_64" ]]; then
	sudo cp ../pi-theme-changer/bin/pi-theme-changer64 /usr/share/pi-apps/pi-theme-changer/pi-theme-changer
	sudo cp ../pi-theme-changer/pi-theme-changer64.desktop /usr/share/applications/pi-theme-changer.desktop
else
	sudo cp ../pi-theme-changer/bin/pi-theme-changer /usr/share/pi-apps/pi-theme-changer/pi-theme-changer 
	sudo cp ../pi-theme-changer/pi-theme-changer.desktop /usr/share/applications/pi-theme-changer.desktop
fi
sudo cp -r ../pi-theme-changer/img/ /usr/share/pi-apps/pi-theme-changer/
sudo chmod 755 -R /usr/share/pi-apps/pi-theme-changer/
