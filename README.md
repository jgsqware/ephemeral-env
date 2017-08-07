# Ephemeral-env test

## Local dev on vagrant

```
cd debian-box
vagrant up

vagrant ssh
sudo apt-get install -y curl vim
```

## Env setup

```
curl -fsSL get.docker.com | sh 
sudo usermod -aG docker `whoami`

SWARM_IP=`ip -4 -o addr show  | awk '/10\./{gsub(/\//," ");print $4'` docker swarm init --advertise-addr="$SWARM_IP"

# Insecure connection
vim /lib/systemd/system/docker.service

...
//Append tcp://0.0.0.0:2375 to ExecStart
ExecStart=/usr/bin/dockerd -H fd:// -H tcp://0.0.0.0:2375
//Save with :wq

sudo systemctl daemon-reload
sudo systemctl restart docker
```

### Local Vagrant Access

```
docker -H tcp://127.0.0.1:2375 ps
```
