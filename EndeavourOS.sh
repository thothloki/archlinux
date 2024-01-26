#!/bin/bash

#check if yay is installed
if ! command -v yay &> /dev/null
then
    echo "yay not installed. Installing"
    #Check if git is installed
    if ! command -c git &> /dev/null
    then
        echo "git not installed. Installing"
        sudo pacman -Sy git
    git clone https://aur.archlinux.org/yay.git
    cd /yay
    makepkg -si
    cd
fi

#Install apps from arch repo and AUR
yay -S --noconfirm appimagelauncher-git
yay -S --noconfirm audacity
yay -S --noconfirm avahi
yay -S --noconfirm bottles
yay -S --noconfirm brave-bin
yay -S --noconfirm btrfs-assistant
yay -S --noconfirm discord
yay -S --noconfirm flatpak
#yay -S --noconfirm freecad
yay -S --noconfirm freecad-weekly-appimage
yay -S --noconfirm gimp
yay -S --noconfirm gnome-boxes
yay -S --noconfirm go
yay -S --noconfirm handbrake
yay -S --noconfirm htop
yay -S --noconfirm inkscape
yay -S --noconfirm ivpn-ui
yay -S --noconfirm kde-gtk-config
yay -S --noconfirm kicad
yay -S --noconfirm --asdeps kicad-library
yay -S --noconfirm --asdeps kicad-library-3d
yay -S --noconfirm librecad
yay -S --noconfirm libreoffice-fresh
yay -S --noconfirm librewolf-bin
yay -S --noconfirm lightburn
yay -S --noconfirm megasync
yay -S --noconfirm micro
yay -S --noconfirm neofetch
yay -S --noconfirm notable
yay -S --noconfirm obs-studio
yay -S --noconfirm obsidian
yay -S --noconfirm peek
yay -S --noconfirm prusa-slicer
#yay -S --noconfirm qbittorrent
yay -S --noconfirm qcad
yay -S --noconfirm remmina
yay -S --noconfirm rustdesk
yay -S --noconfirm schildichat-desktop
yay -S --noconfirm snapper
#yay -S --noconfirm shutter
yay -S --nofonfirm thonny
yay -S --noconfirm vscodium
ysy -S --noconfirm watchmate
yay -S --noconfirm xonotic
yay -S --noconfirm yt-dlp

#Appimages
#wget https://github.com/FreeCAD/FreeCAD/releases/download/0.21.2/FreeCAD-0.21.2-Linux-x86_64.AppImage
#chmod u+x FreeCAD_0.21.2-Linux-x86_64.AppImage
#./FreeCAD_0.21.2-Linux-x86_64.AppImage
wget https://downloads.arduino.cc/arduino-ide/arduino-ide_2.2.1_Linux_64bit.AppImage
chmod u+x arduino-ide_2.2.1_Linux_64bit.AppImage
./arduino-ide_2.2.1_Linux_64bit.AppImage

#Flatpaks
#flatpak install -y flathub io.gitlab.librewolf-community
flatpak install -y flathub io.github.vikdevelop.SaveDesktop

#KDE Plasma Specific Apps
yay -S --noconfirm kbreakout
yay -S --noconfirm kdevelop
yay -S --noconfirm kiriki
yay -S --noconfirm kmymoney
#yay -S --noconfirm krita
yay -S --noconfirm ktorrent
yay -S --noconfirm smb4k 

#GNOME Specific Apps
yay -S --noconfirm dialect
yay -S --noconfirm junction
yay -S --noconfirm wike

#Edit Python and add modules
sudo rm /usr/lib/python3.11/EXTERNALLY-MANAGED
yay -S --noconfirm python3-pip
pip3 install lxml
pip3 install pyusb
pip3 install appjar
pip3 install pillow
pip3 install pyclipper
#pip3 install konsave
#echo 'export PATH="$PATH:/home/thothloki/.local/bin"' >> ~/.bashrc
#source ~/.bashrc

#Inkscape - Install inkscape-silhouette extension
git clone https://github.com/fablabnbg/inkscape-silhouette.git
cd inkscape-silhouette
make install-local
cd
sudo rm -rf inkscape-silhouette

#K40 Whisperer partial setup
wget https://www.scorchworks.com/K40whisperer/K40_Whisperer-0.68_src.zip
sudo groupadd lasercutter
sudo usermod -a -G lasercutter thothloki

#Install MU Editor
wget https://github.com/mu-editor/mu/releases/download/v1.2.0/MuEditor-Linux-1.2.0-x86_64.tar -P /Downloads


#Copy settings files from github and move them to where they need to go
#Download all files
git clone https://github.com/thothloki/archlinux.git
cd archlinux/

#Set Freecad up
mkdir -p /home/thothloki/.config/FreeCAD/
cp FreeCAD/user.cfg /home/thothloki/.config/FreeCAD/
mkdir -p /home/thothloki/.local/share/FreeCAD/Mod/
git clone https://github.com/shaise/FreeCAD_FastenersWB.git /home/thothloki/.local/share/FreeCAD/Mod/
git clone https://github.com/looooo/freecad.gears.git /home/thothloki/.local/share/FreeCAD/Mod/
git clone https://github.com/JMG1/ExplodedAssembly.git /home/thothloki/.local/share/FreeCAD/Mod/
git clone https://github.com/triplus/IconThemes.git /home/thothloki/.local/share/FreeCAD/Mod/
git clone https://github.com/execuc/LCInterlocking/blob/master/README.md.git /home/thothloki/.local/share/FreeCAD/Mod/
git clone https://github.com/obelisk79/OpenDark.git /home/thothloki/.local/share/FreeCAD/Mod/
git clone https://github.com/shaise/FreeCAD_SheetMetal.git /home/thothloki/.local/share/FreeCAD/Mod/

#Set up KDE Plasma
echo 'export GTK_THEME=Breeze' >> /etc/environment

#Enable Bluetooth
sudo systemctl start bluetooth
sudo systemctl enable bluetooth

#Reboot system 
sudo reboot -h now
