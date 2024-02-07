#!/bin/bash

# Escolhe melhores mirrors
sudo pacman-mirrors --fasttrack 5

# Atualiza os repositórios
sudo pacman -Syuu --noconfirm

# Instala o yay (AUR helper)
sudo pacman -S yay --noconfirm

# Lista de pacotes a serem instalados
APPS=(
    "--needed base-devel git"
    "google-chrome"
    "visual-studio-code-bin sublime-text-dev sublime-merge intellij-idea-community-edition"
    "blender inkscape gimp freecad krita"
    "discord telegram-desktop slack-desktop"
    "vlc audacity"
    "pyenv python-pip"
    "docker docker-compose"
    "1password"
)
 
# Instalando APPS
for app in "${APPS[@]}"; do
  yay -S $app --noconfirm
done

# Instala o Docker Desktop
cd /tmp
wget -O docker-desktop.pkg.tar.zst https://desktop.docker.com/linux/main/amd64/136059/docker-desktop-4.27.1-x86_64.pkg.tar.zst
sudo pacman -U ./docker-desktop.pkg.tar.zst
systemctl --user start docker-desktop
cd ~

echo "Instalação concluída."