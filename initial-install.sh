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
    "visual-studio-code-bin sublime-text-dev"
    "blender inkscape gimp"
    "discord telegram-desktop slack-desktop"
    "vlc audacity"
    "pyenv"
    "python-pip"
    "docker"
    "docker-compose"
)

# Instalando APPS
for app in "${APPS[@]}"; do
  yay -S $app --noconfirm
done

echo "Instalação concluída."

