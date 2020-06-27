
# cleanup, no snap, docker old
sudo apt purge snapd -y
sudo apt-get remove docker docker-engine docker.io containerd runc -y

# docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-get install apt-transport-https  ca-certificates curl gnupg-agent software-properties-common -y
sudo apt-get install docker-ce docker-ce-cli containerd.io    
sudo add-apt-repository   "deb [arch=amd64] https://download.docker.com/linux/ubuntu    $(lsb_release -cs)    stable"
sudo apt install docker-ce docker-ce-cli containerd.io -y

#vscode
sudo apt update
sudo apt install software-properties-common apt-transport-https wget -y
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

# repo section
sudo add-apt-repository multiverse
sudo add-apt-repository universe
sudo apt update


# ubuntu
sudo apt install  gnome-shell-extensions ubuntustudio-wallpapers  vlc ansible   

# sudo apt install  vim tmux  git vlc  gnome-tweak-tool steam code lutris  -y

# gnome utils
sudo apt install gnome-shell-extensions arc-theme gnome-tweak-tool -y

# gaming and extras
sudo add-apt-repository ppa:lutris-team/lutris
sudo apt install steam  lutris vlc -y

# Vms
sudo apt install vagrant virtualbox -y

# DEV ansible, Python and more
sudo apt install python3-pip git code tmux -y
sudo pip3 install ansible-lint
