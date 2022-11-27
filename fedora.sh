sudo echo -e "fastest_mirror=True\nmax_parallel_downloads=10\n" >> /etc/dnf/dnf.conf;

sudo dnf update -y --refresh;

sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y;
sudo dnf groupupdate core -y;
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -y;
sudo dnf groupupdate sound-and-video -y;

sudo dnf install gnome-tweaks -y;
sudo dnf install gnome-shell-extension-appindicator.noarch -y;

flatpak install flathub com.discordapp.Discord \
                        com.spotify.Client \
                        org.telegram.desktop \
                        org.videolan.VLC \
                        com.obsproject.Studio \
                        org.gnome.Builder \
                        net.lutris.Lutris \
                        com.usebottles.bottles \
                        com.obsproject.Studio \
                        org.onlyoffice.desktopeditors \
                        org.qbittorrent.qBittorrent \
                        com.getpostman.Postman \
                        com.mojang.Minecraft \
                        org.chromium.Chromium \
                        org.libretro.RetroArch \
                        com.github.tchx84.Flatseal \
                        org.standardnotes.standardnotes \
                        org.cryptomator.Cryptomator \
                        org.gnome.Geary \
                        org.gnome.Extensions -y;

sudo dnf -y install dnf-plugins-core;
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo -y;
sudo dnf install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y;
sudo systemctl start docker;
sudo dnf install docker-compose -y;

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc;
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo';
dnf check-update;
sudo dnf install code -y;

sudo dnf install golang -y;
mkdir -p $HOME/go;
echo 'export GOPATH=$HOME/go' >> $HOME/.bashrc;
source $HOME/.bashrc;

sudo dnf install rust cargo -y;

sudo dnf install java-devel -y;
sudo dnf install java-openjdk-headless -y;

sudo dnf install rpi-imager -y;

# git config --global user.name ""
# git config --global user.email ""
# git config --global color.ui auto

# ssh-keygen -t ed25519 -C ""