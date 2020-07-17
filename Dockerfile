FROM debian:latest

# Prepare scripts and configs
ADD ./ssh-start.sh /ssh-start.sh

RUN apt-get -q -y update; apt-get -q -y upgrade && \
       apt-get -q -y install sudo openssh-server && \
       mkdir /var/run/sshd

# Set root password
RUN echo 'root:abcd1234' >> /root/passwdfile

# Create user and it's password
RUN useradd -m -G sudo sadi && \
       echo 'sadi:abcd1234' >> /root/passwdfile

RUN chpasswd -c SHA512 < /root/passwdfile && \
       rm /root/passwdfile

# Port 22 is used for ssh
EXPOSE 22

# Assign /data as static volume.
VOLUME ["/data"]

# Fix all permissions
RUN chmod +x /ssh-start.sh
WORKDIR /app

# Starting ssh daemon
CMD ["/ssh-start.sh"]
