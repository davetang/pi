## Table of Contents

- [Raspberry Pi notes](#raspberry-pi-notes)
  - [Setup](#setup)
    - [Static IP](#static-ip)
  - [Stuff to install](#stuff-to-install)
  - [Camera](#camera)
  - [Docker](#docker)

# Raspberry Pi notes

I have a Raspberry Pi 3 and 4 (and I might buy a 5 at some point) and I tend to forget how I did things, so I'm keeping my notes here.

## Setup

1. Install Raspberry Pi OS using [Raspberry Pi Imager](https://www.raspberrypi.com/software/)
2. Configure settings with a username and name your device, and enable SSH
3. SSH using `ssh username@name.local`

```
PRETTY_NAME="Debian GNU/Linux 12 (bookworm)"
NAME="Debian GNU/Linux"
VERSION_ID="12"
VERSION="12 (bookworm)"
VERSION_CODENAME=bookworm
ID=debian
HOME_URL="https://www.debian.org/"
SUPPORT_URL="https://www.debian.org/support"
BUG_REPORT_URL="https://bugs.debian.org/"
```

### Static IP

Use `nmtui` (Text User Interface for controlling `NetworkManager`) to set the IP, gateway, and DNS servers.

```console
sudo nmtui
```

Then restart `NetworkManager`.

```console
sudo systemctl restart NetworkManager
```

## Stuff to install

Necessities.

```console
sudo apt update
sudo apt install -y screen zsh
```

Clone [install_scripts](https://github.com/davetang/install_scripts) and install [Oh My Zsh](https://ohmyz.sh/) first.

```console
git clone git@github.com:davetang/install_scripts.git
cd install_scripts
./scripts/ohmyzsh.sh
```

## Camera

List camera/s.

```console
libcamera-hello --list-cameras
```
```
Available cameras
-----------------
0 : ov5647 [2592x1944 10-bit GBRG] (/base/soc/i2c0mux/i2c@1/ov5647@36)
    Modes: 'SGBRG10_CSI2P' : 640x480 [58.92 fps - (16, 0)/2560x1920 crop]
                             1296x972 [46.34 fps - (0, 0)/2592x1944 crop]
                             1920x1080 [32.81 fps - (348, 434)/1928x1080 crop]
                             2592x1944 [15.63 fps - (0, 0)/2592x1944 crop]
```

Capture a test photo.

```console
libcamera-jpeg -o test.jpg
```

## Docker

Install.

```console
curl -sSL https://get.docker.com | sh
sudo usermod -aG docker $USER
# log out and back in
```

Test.

```console
docker run hello-world
```
```
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
c9c5fd25a1bd: Pull complete
Digest: sha256:c41088499908a59aae84b0a49c70e86f4731e588a737f1637e73c8c09d995654
Status: Downloaded newer image for hello-world:latest

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (arm64v8)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/
```

### RStudio Server

Pull.

```console
docker pull rocker/rstudio:4.5
```

Run.

```console
docker run --rm \
   -p 8888:8787 \
   -e PASSWORD=password \
   -e USERID=$(id -u) \
   -e GROUPID=$(id -g) \
   rocker/rstudio:4.5
```
