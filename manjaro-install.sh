#!/bin/bash

# Escolhe melhores mirrors
sudo pacman-mirrors --fasttrack 5

# Atualiza os repositórios
sudo pacman -Syuu --noconfirm

# Instala o yay (AUR helper)
sudo pacman -S yay --noconfirm

# Lista de pacotes a serem instalados
APPSYAY=(
    "amarok"
    "asdf-vm"
    "audacity"
    "base-devel"
    "bitwarden"
    "docker"
    "docker-compose"
    "gimp"
    "git"
    "google-chrome"
    "guiscrcpy"
    "handbrake"
    "inkscape"
    "kdenlive"
    "mysql-workbench"
    "podman-desktop"
    "postman-bin"
    "qbittorrent"
    "sublime-merge"
    "sublime-text-dev"
    "tar"
    "tilix"
    "unzip"
    "visual-studio-code-bin"
    "vlc"
    "obs-studio"
)

# Instalando APPSYAY
for app in "${APPSYAY[@]}"; do
    yay -S $app --noconfirm
done

# Lista de flatpacks a serem instalados
APPSFLATPACK=(
    "com.github.tchx84.Flatseal"
    "flathub md.obsidian.Obsidian"
    "io.github.flattool.Warehouse"
    "it.mijorus.gearlever "
    "com.github.jkotra.unlockr"
)

# Instalando APPSFLATPACK
for app in "${APPSFLATPACK[@]}"; do
    flatpak install -y flathub $app
done

# Gerando ssh-keygen
# echo "Gerando chave ssh..."
# ssh-keygen -t ed25519 -C "dienaylima@gmail.com"
# eval "$(ssh-agent -s)"
# ssh-add ~/.ssh/id_ed25519
# cat .ssh/id_ed25519.pub

# # Instalar e configurar asdf
# echo "Instalando asdf..."
# echo '. /opt/asdf-vm/asdf.sh' >> ~/.zshrc
# source ~/.zshrc

asdf plugin-add java https://github.com/halcyon/asdf-java.git
asdf plugin add kotlin https://github.com/asdf-community/asdf-kotlin.git

asdf install java latest
asdf install kotlin latest

asdf global java latest
asdf global kotlin latest

echo "Instalação concluída."
