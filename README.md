# WGGL (Wireguard GUI for Linux)

GUI to manage your Wireguard VPN Connection with a graphical interface

GUI VPN Client for Linux-Distros.

## Requirements

- wireguard must be installed.
- wireguard-tools must be installed.
- zenity must be installed if not already installed.
- resolvconf must be installed if not already installed.
- 
```bash
sudo apt install wireguard wireguard-tools zenity resolvconf
```
## Installation

1. Download install.sh
2. Open terminal in downlod folder and type ``` chmod +x install.sh ```
3. call the script ```./install.sh ```

## Usage

install.sh creates a Desktop shortcut for easy access.

You can add and remove your Wireguard config files and connect and disconnect a VPN tunnle.

## Screenshots

![Screenshot1](https://github.com/SuitDeer/wggl/raw/main/Screenshots/screenshot1.png)

![Screenshot2](https://github.com/SuitDeer/wggl/raw/main/Screenshots/screenshot2.png)

To establish a wireguard VPN tunnel you need admin/root rights. So each time you want to connect to a wireguard Server/partner you need to input the admin/root password. In the background Wireguard wants to create new network tunnel interface and that is only possible with root/admin credentials

![Screenshot3](https://github.com/SuitDeer/wggl/raw/main/Screenshots/screenshot3.png)

![Screenshot4](https://github.com/SuitDeer/wggl/raw/main/Screenshots/screenshot4.png)
