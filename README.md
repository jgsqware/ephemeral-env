# Ephemeral-env test

## Up and Running

```
$ cd debian-box
$ vagrant up

$ docker -H tcp://localhost:2375 service ls
ID                  NAME                MODE                REPLICAS            IMAGE                        PORTS
b5qnlxvig5x4        portainer           replicated          1/1                 portainer/portainer:latest   *:9000->9000/tcp 
```