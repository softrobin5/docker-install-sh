FROM ubuntu:14.04
MAINTAINER soft robin <softrobin@gmail.com>
# disable interactive installation
ENV DEBIAN_FRONTEND noninteractive

# DNS Setting
#RUN echo "nameserver 192.168.1.1" > /etc/resolv.conf

# Update 
RUN  apt-get update && \
     apt-get -y upgrade

#
#RUN sudo apt-get install -y build-essential git

# Set Date 
RUN echo "Asia/Kolkata" > /etc/timezone && \
	dpkg-reconfigure -f noninteractive tzdata

# Required Package
RUN apt-get install -y \
	vim \
	wget \
	curl \
	net-tools
			
# Install ssh-server
RUN \ 
	apt-get install -y openssh-server && \
	mkdir -p /var/run/sshd && \
	mkdir -p /root/.ssh && \
	echo 'root:satish' |chpasswd && \
	echo 'PermitRootLogin yes' > /etc/ssh/sshd_config
EXPOSE 22

# Install Apache2
RUN \ 
	apt-get -y install apache2 && \
	rm /var/www/html/index.html
EXPOSE 80

# Install Nginx
#RUN \
#	apt-get install nginx-extras -y --no-install-recommends && \
#	RUN echo "daemon off;" >> /etc/nginx/nginx.conf && \
#	CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
#EXPOSE 80

# Clean up APT when done.
RUN \
	apt-get autoremove -y && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*




# Run openssh server as deamon
CMD ["/usr/sbin/sshd", "-D"]
