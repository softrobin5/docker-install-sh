# On Ubuntu Trusty 14.04 (LTS)
sudo apt-get update

# apparmor is required
sudo apt-get install -y  apparmor

# Install Docker.
sudo apt-get install -y docker-engine

#  Docker commands without using sudo
username=`whoami`
sudo usermod -a -G docker $username

# reStart the docker daemon.
sudo service docker restart

#------------------------------------------
#Upgrade Docker
#To install the latest version of Docker with apt-get:

#$ apt-get upgrade docker-engine
#------------------------------------------

#------------------------------------------
# Uninstallation
#To uninstall the Docker package:
#  sudo apt-get purge docker-engine

#To uninstall the Docker package and dependencies that are no longer needed:
# sudo apt-get autoremove --purge docker-engine

#The above commands will not remove images, containers, volumes, or user created configuration files on your host. If you wish to delete all images, containers, and volumes run the following command:
# rm -rf /var/lib/docker
#------------------------------------------

#Reboot your host.
sudo reboot
