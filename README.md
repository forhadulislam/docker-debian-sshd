# docker-debian-sshd

    
### How to build and run SSH Docker container
    
make build-test-ssh # build the ssh container using make
    
    docker run -d=true --name=docker_debian_ssh --restart=always -p=2022:22 -v=/opt/data:/data docker_debian_ssh /ssh-start.sh
    
To connect using ssh use this command:

    ssh sadi@localhost -p 2022 # password is: abcd1234
