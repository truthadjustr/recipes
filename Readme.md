### myng2

This is my own personal tool to weave quickly a containerized nodejs development environment.
It is biased towards **Angular2** via **Angular CLI** tooling.

# Start the container

```Shell
docker -d --net=host truthadjustr/myng2
```

The above command will start an ssh server inside the container. This is needed to launch X11 portforwarding from
the container in case you want to open **Visual Studio Code*** IDE. 

The other alternatives are:

    * vncserver
    * /tmp/.X11-unix/ socket sharing

The socket sharing is not possible in Docker Toolbox because of the intermediate boot2docker.iso VM. The
socket sharing is only possible if your Docker host is a Linux machine. This limination is 
discussed (here)[https://github.com/moby/moby/issues/8710]. So is why, I choose to have ssh server for X11 
port forwarding.


This is for Windows 7 users with **Docker Toolbox** and **cygwin** installed. Your cygwin
installation must have the following packages:

    * xorg-server
    * xinit

And then from a cygwin terminal type:

```Shell
startxwin
```

Then in another cygwin terminal initialize **DISPLAY** and ssh connect to your container:

```Shell
export DISPLAY=:0
ssh -p 2222 -Y root@192.168.99.100
vscode
```

If you don't need the VSCode IDE, you can simply get into the container by:
```Shell
docker exec -it container-id bash
```


