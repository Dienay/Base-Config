#!/bin/bash

# Atualiza os repositórios
sudo apt update
sudo apt dist-upgrade -y
sudo apt get upgrade

# Lista de pacotes a serem instalados
APPS=(
    "ubuntu-restricted-extras"
    "gdebi"
    "synaptic"
    "flatpak"
    "audacious"
    "vlc"
    "audacity"
    "handbrake"
    "inkscape"
    "stacer"
    "uget"
    "qbittorrent"
    "gparted"
    "git"
    "tilix"
    "curl"
    "zsh"
    "asdf"
    "nala"
)

# Instala os pacotes
for app in "${APPS[@]}"; do
    sudo apt install -y $app
done

# habilita flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

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

echo "Instalação concluída."
