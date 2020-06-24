
# cleanup, no snap, docker old
sudo apt purge snapd -y
sudo apt-get remove docker docker-engine docker.io containerd runc -y

# docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-get install apt-transport-https  ca-certificates curl gnupg-agent software-properties-common -y
    
sudo add-apt-repository   "deb [arch=amd64] https://download.docker.com/linux/ubuntu    $(lsb_release -cs)    stable"

#vscode
sudo apt update
sudo apt install software-properties-common apt-transport-https wget -y
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

# repo section
sudo add-apt-repository multiverse
sudo add-apt-repository universe
sudo add-apt-repository ppa:lutris-team/lutris
sudo apt update



sudo apt install vlc ansible arc-theme gnome-tweak-tool steam code lutris docker-ce docker-ce-cli containerd.i -y


