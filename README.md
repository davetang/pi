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
