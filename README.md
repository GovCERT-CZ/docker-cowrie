# docker-cowrie

This is Docker image for honeypot Cowrie (https://github.com/micheloosterhof/cowrie).

Build docker image
    
    $ git clone https://github.com/GovCERT-CZ/docker-cowrie
    $ cd docker-cowrie/
    $ docker build -t <repository>/<name> .
    
Run docker container
    
    $ docker run [--name <container name>] [-d] -p 22:22 [-v <host path>:/opt/cowrie/log] <repository>/<name>
    
Run docker container with mounted volume for data from host (persistent storage of ssh keys during destroying and deploying of containers)
    
    make directory data and download files to this directory
    $ wget https://github.com/micheloosterhof/cowrie/blob/master/data/fs.pickle
    $ wget https://raw.githubusercontent.com/micheloosterhof/cowrie/master/data/userdb.txt
    $ docker run [--name <container name>] [-d] -p 22:22 [-v <host path>:/opt/cowrie/log] [-v <host path>/data:/opt/cowrie/data] <repository>/<name>
    
Run docker container with custom conf file and userdb (userdb can be updated in data directory from previous example and doesn't need to be mounted separately)
    
    $ wget https://raw.githubusercontent.com/micheloosterhof/cowrie/master/cowrie.cfg.dist -O cowrie.cfg
    update cowrie.cfg file with your settings
    $ wget https://raw.githubusercontent.com/micheloosterhof/cowrie/master/data/userdb.txt
    update userdb with your values
    $ docker run [--name <container name>] [-d] -p 22:22 [-v <host path>:/opt/cowrie/log] [-v <host path>/data:/opt/cowrie/data] [-v <host path>/cowrie.cfg:/opt/cowrie/cowrie.cfg] [-v <host path>/userdb.txt:/opt/cowrie/data/userdb.txt] <repository>/<name>
    

