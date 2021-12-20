FROM ubuntu:18.04
# Essentials
RUN apt-get update && apt-get install -y \
      apt-utils \
      sudo \
      git 
      
# NodeJS
RUN  apt-get install -y nodejs npm
RUN npm install -g yarn

# Superuser
RUN useradd -m dp && echo "dp:dp" | chpasswd && adduser dp sudo

# User and path
USER dp
WORKDIR /home/dp
CMD /bin/bash   