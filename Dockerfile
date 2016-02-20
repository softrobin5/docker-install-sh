FROM ubuntu:14.04

MAINTAINER soft robin <softrobin@gmail.com>

# DNS Setting
#RUN echo "nameserver 192.168.1.1" > /etc/resolv.conf

# Update 
RUN \
	apt-get update && \
	apt-get -y upgrade

# Set Date 
RUN echo "Asia/Kolkata" > /etc/timezone && \
                dpkg-reconfigure -f noninteractive tzdata

# Install ssh-server
RUN \ 
	apt-get install -y openssh-server && \
	mkdir -p /var/run/sshd && \
	mkdir -p /root/.ssh && \
	echo 'root:satish' |chpasswd && \
	echo 'PermitRootLogin yes' > /etc/ssh/sshd_config && \
	EXPOSE 22

# Install Apache2
RUN \ 
	apt-get -y install apache2 && \
	rm /var/www/html/index.html && \
	EXPOSE 80

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*



# Run openssh server as deamon
CMD ["/usr/sbin/sshd", "-D"]
