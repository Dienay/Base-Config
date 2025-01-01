#!/bin/bash

# Atualiza os repositórios
echo "Atualizando o sistema..."
sudo apt update && sudo apt upgrade -y

# Instala o Nala
sudo apt install nala -y

# Lista de pacotes a serem instalados
APPS=(
    "ack-grep"
    "audacity"
    "build-essential"
    "chrome-gnome-shell"
    "cpu-x"
    "curl"
    "default-jdk"
    "exuberant-ctags"
    "flatpak"
    "fontconfig"
    "gdebi"
    "git"
    "gnome-shell-extensions"
    "gnome-software"
    "gnome-software-plugin-flatpak"
    "gnome-tweaks"
    "gnupg"
    "goverlay"
    "gparted"
    "handbrake"
    "imagemagick"
    "inkscape"
    "libhiredis-dev"
    "libmagickwand-dev"
    "libmemcached-dev" 
    "libssl-dev"
    "memcached"
    "mysql-server"
    "ncurses-term"
    "postgresql-16"
    "postgresql-contrib"
    "postgresql-server-dev-16"
    "qbittorrent"
    "redis-server"
    "silversearcher-ag"
    "software-properties-common"
    "stacer"
    "synaptic"
    "tilix"
    "ubuntu-restricted-extras"
    "vim-gtk3"
    "vlc"
    "zsh"
)

# Instala os pacotes
echo "Instalando os pacotes..."
for app in "${APPS[@]}"; do
    sudo nala install -y $app
    echo "Instalando " + $app + "..."
done

# Configurar Git
echo "Configurando Git..."
git config --global user.name "Seu Nome"
git config --global user.email "seu.email@example.com"

# Instalar Docker
echo "Instalando Docker..."
sudo apt install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER

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

# Instalar e configurar asdf
echo "Instalando asdf..."
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.15.0

# Adicionar asdf ao shell
echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bashrc
echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc
echo '. "$HOME/.asdf/asdf.sh"' >> ~/.zshrc
echo '. "$HOME/.asdf/completions/asdf.bash"' >> ~/.zshrc
source ~/.bashrc

# Reiniciar o shell para aplicar as mudanças do asdf
exec $SHELL

# Instalar plugins do asdf
asdf plugin-add crystal https://github.com/asdf-community/asdf-crystal.git
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf plugin-add golang https://github.com/kennyp/asdf-golang.git
asdf plugin-add kotlin https://github.com/missingcharacter/asdf-kotlin.git
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf plugin-add rust https://github.com/code-lever/asdf-rust.git

# Instalar as versões mais recentes das linguagens
asdf install crystal latest
asdf install elixir latest
asdf install erlang latest
asdf install golang latest
asdf install kotlin latest
asdf install nodejs latest
asdf install ruby latest
asdf install rust latest

# Definir as versões globais
asdf global crystal latest
asdf global elixir latest
asdf global erlang latest
asdf global golang latest
asdf global kotlin latest
asdf global nodejs latest
asdf global ruby latest
asdf global rust latest

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


# habilita minimizar janela com click no incone do aplicativo na dock
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'

echo "Instalação concluída."
