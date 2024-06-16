#!/bin/bash

# Escolhe melhores mirrors
sudo pacman-mirrors --fasttrack 5

# Atualiza os repositórios
sudo pacman -Syuu --noconfirm

# Instala o yay (AUR helper)
sudo pacman -S yay --noconfirm

# Lista de pacotes a serem instalados
APPSYAY=(
    "--needed"
    "base-devel"
    "git"
    "google-chrome"
    "ferdium-bin"
    "visual-studio-code-bin"
    "sublime-text-dev"
    "sublime-merge"
    "tilix"
    "inkscape"
    "gimp"
    "freecad"
    "krita"
    "kdenlive"
    "mongodb-compass"
    "mysql-workbench"
    "postman-bin"
    "vlc"
    "audacity"
    "guiscrcpy"
    "pyenv"
    "python-pip"
    "docker"
    "docker-compose"
    "podman-desktop"
    "bitwarden"
    "nodejs"
    "npm"
    "nvm"
)

# Instalando APPSYAY
for app in "${APPSYAY[@]}"; do
    yay -S $app --noconfirm
done

# Lista de flatpacks a serem instalados
APPSFLATPACK=(
    "com.github.tchx84.Flatseal"
    "io.github.flattool.Warehouse"
    "it.mijorus.gearlever "
    "me.iepure.devtoolbox"
)

# Instalando APPSFLATPACK
for app in "${APPSFLATPACK[@]}"; do
    flatpak install flathub $app
done

# Instalar mongodb
sudo pacman -S mongodb --noconfirm
sudo systemctl start mongodb
sudo systemctl enable mongodb

sudo chsh -s $(which zsh) $(whoami)



echo "Instalação concluída."
