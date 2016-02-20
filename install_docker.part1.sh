# On Ubuntu Trusty 14.04 (LTS)
sudo apt-get update
sudo apt-get -y upgrade

sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" | sudo tee  /etc/apt/sources.list.d/docker.list

sudo apt-get update

# Purge the old repo if it exists.
sudo apt-get purge -y lxc-docker

# Install the recommended package.
sudo apt-get install -y  linux-image-extra-$(uname -r)

#Reboot your host.
sudo reboot

