#!/bin/bash

# Atualiza os repositórios
echo "Atualizando o sistema..."
sudo apt update && sudo apt upgrade -y

# Instala o Nala
echo "Instalando Nala..."
sudo apt install nala -y

# Lista de pacotes a serem instalados
APPS=(
    "ubuntu-restricted-extras"
    "mint-meta-codecs"
    "gdebi"
    "synaptic"
    "flatpak"
    "audacious"
    "vlc"
    "audacity"
    "handbrake"
    "inkscape"
    "stacer"
    "qbittorrent"
    "gparted"
    "git"
    "tilix"
    "curl"
    "zsh"
    "cpu-x"
    "gimp"
    "goverlay"
)

# Instala os pacotes
for app in "${APPS[@]}"; do
    sudo nala install -y $app
    echo "Instalando " + $app + "..."
done

# Baixar e instalar pacotes .deb
echo "Baixando e instalando pacotes .deb..."
cd /tmp

wget -O code-stable_current_amd64.deb https://update.code.visualstudio.com/latest/linux-deb-x64/stable
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

# Instalar os pacotes .deb baixados
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo dpkg -i code-stable_current_amd64.deb

# Corrigir dependências, caso necessário
sudo apt install -f -y

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
    flatpak install $app
done

# echo "Instalação concluída."
