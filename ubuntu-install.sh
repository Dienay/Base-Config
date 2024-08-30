#!/bin/bash

# Atualiza os repositórios
sudo apt dist-upgrade -y
sudo apt get upgrade

# Lista de pacotes a serem instalados
APPS=(
    "ubuntu-restricted-extras"
    "gdebi"
    "synaptic"
    "flatpak"
    "gnome-software"
    "chrome-gnome-shell"
    "gnome-shell-extensions"
    "gnome-software-plugin-flatpak"
    "gnome-tweaks"
    "tlp"
    "tlp-rdw"
    "audacious"
    "vlc"
    "kodi"
    "audacity"
    "handbrake"
    "inkscape"
    "stacer"
    "nautilus-megasync"
    "uget"
    "qbittorrent"
    "gparted"
    "git"
    "tilix"
    "mysql-server"
    "gnupg"
    "curl"
    "zsh"
)

# Instala os pacotes
for app in "${APPS[@]}"; do
    sudo apt install -y $app
done

# ativa mysql server
systemctl is-active mysql

# habilita tlp
systemctl enable tlp && tlp start

# habilita flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo


# instala megasync
cd /tmp && wget -O megasync.deb 'https://mega.nz/linux/repo/xUbuntu_22.04/amd64/megasync-xUbuntu_22.04_amd64.deb'
sudo apt install ./megasync.deb && cd ..

FLATPACK=(
    "flathub org.chromium.Chromium"
    "flathub org.ferdium.Ferdium"
    "flathub com.visualstudio.code"
    "flathub com.sublimetext.three"
    "flathub com.sublimemerge.App"
    "flathub org.gimp.GIMP"
    "flathub org.freecadweb.FreeCAD"
    "flathub org.kde.krita"
    "flathub org.kde.kdenlive"
    "flathub com.getpostman.Postman"
    "flathub in.srev.guiscrcpy"
    "flathub com.github.tchx84.Flatseal"
    "flathub io.github.flattool.Warehouse"
    "flathub it.mijorus.gearlever"
    "flathub me.iepure.devtoolbox"
    "flathub md.obsidian.Obsidian"
    "flathub com.obsproject.Studio"   
)

# Instala os pacotes
for app in "${FLATPACK[@]}"; do
    flatpak install -y $app
done

# instala mongo compass
cd /tmp && wget -O mongodb-compass.deb https://downloads.mongodb.com/compass/mongodb-compass_1.43.0_amd64.deb
sudo dpkg -i mongodb-compass.deb

# instala mysql workbench
sudo snap install mysql-workbench-community

# instala nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | zsh

# habilita minimizar janela com click no incone do aplicativo na dock
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'

echo "Instalação concluída."
