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
