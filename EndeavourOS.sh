#!/bin/bash

#check if yay is installed
if ! command -v yay &> /dev/null
then
    echo "yay could not be found. Installing"
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
yay -S --noconfirm discord
yay -S --noconfirm flatpak
#yay -S --noconfirm freecad
yay -S --noconfirm gimp
yay -S --noconfirm gnome-boxes
yay -S --noconfirm go
yay -S --noconfirm handbrake
yay -S --noconfirm htop
yay -S --noconfirm inkscape
yay -S --noconfirm ivpn-ui
yay -S --noconfirm kicad
yay -S --noconfirm librecad
yay -S --noconfirm libreoffice-fresh
yay -S --noconfirm megasync
yay -S --noconfirm micro
yay -S --noconfirm neofetch
yay -S --noconfirm notable
yay -S --noconfirm obs-studio
yay -S --noconfirm obsidian
yay -S --noconfirm peek
yay -S --noconfirm prusa-slicer
yay -S --noconfirm qbittorrent
yay -S --noconfirm qcad
yay -S --noconfirm remmina
yay -S --noconfirm rustdesk
yay -S --noconfirm schildichat-desktop
yay -S --noconfirm shutter
yay -S --noconfirm vscodium
yay -S --noconfirm xonotic
yay -S --noconfirm yt-dlp

#Appimages
wget https://github.com/FreeCAD/FreeCAD/releases/download/0.21.1/FreeCAD_0.21.1-Linux-x86_64.AppImage
chmod u+x FreeCAD_0.21.1-Linux-x86_64.AppImage
./FreeCAD_0.21.1-Linux-x86_64.AppImage

#Flatpaks
flatpak install flathub io.gitlab.librewolf-community

#KDE Plasma Specific Apps
yay -S --noconfirm calligra
yay -S --noconfirm ghostrider
yay -S --noconfirm kbreakout
yay -S --noconfirm kdevelop
yay -S --noconfirm kiriki
yay -S --noconfirm kmymoney
yay -S --noconfirm krita
yay -S --noconfirm ktorrent
yay -S --noconfirm neochat

#GNOME Specific Apps
yay -S --noconfirm dialect
yay -S --noconfirm junction
yay -S --noconfirm wike

#Edit Python and add modules
sudo rm /usr/lib/python3.11/EXTERNALLY-MANAGED
pip3 install appjar
pip3 install konsave
echo 'export PATH=""$PATH:/home/thothloki/.local/bin"' >> ~/.bashrc
source ~/.bashrc

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
konsave -i /KDE_Settings/thothloki.knsv

#Reboot system 
sudo reboot -h now
