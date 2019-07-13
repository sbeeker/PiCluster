# PiCluster

PI Cluster repository contains all the Raspberry PI cluster project work being done on two Raspberry PI Cluster systems.  

These clusters are:

1.  Cluster 1 is six Raspberry PI 3 boards using either  WIFI or ethernet or both.

2. Cluster 2 is for Raspberry PI Zero boards using USB LAN on top of a PI Cluster Hat.

Directories:

ansible - contains ansible scripts for configuring varous PI related items.
dockerbuild - contains docker items TBD
# Usage

It looks like the new version of Raspbian do not have SSH enabled. This is probably for the better - people won't accidentally leave the port open with the default password `raspberry`. However, it makes it a little harder to get your Pi setup because you'll need a monitor and a keyboard.

- Before we start, boot up your Pi, and in `sudo raspi-config`, navigate to Advanced Options and enable SSH.

- While you're there, we might as well expand the filesystem. In the main menu, expand the filesystem.

## On host

- Change the inventory IP addresses to your pi address ~/PiCluster/ansible/hosts

- Add your SSH key to the pi (On OSX? You may need `brew install ssh-copy-id`):

ssh-keygen
ssh-copy-id -i ~/.ssh/id_rsa.pub pi@ip.address

Here on, you can do the following remotely.

## Configure Pi

SSH into your pi and install ansible.

sudo apt-get update
sudo apt-get install python3.4-minimal python3.4 python-crypto python-markupsafe python-jinja2 python-paramiko python-pkg-resources python-setuptools python-pip python-yaml -y
sudo pip install ansible

# Test Ansible


ansible -i <hosts file> <host desc> -a <command>
ansible -i hosts dc1 -a "date"

## Ansible

Run the specific role you want. Remember:

- Copy `pi.sample` to `pi` and edit the ip addresses. If you have multiple Pis you want to configure now, you may add them as extra lines
- In the following commands, replace `ip.address` with the Pi's ip address

First, we have to install the things it needs for the recipes to follow:

ansible-playbook setup.yml -i hosts

## Playbooks

### BitTorrent Sync Backup Server

To make the Pi a BTSync back up server:

ansible-playbook backup.yml -i hosts --extra-vars="btsync_password=mybtsyncpassword"

### Docker

To be able to run Docker:

ansible-playbook docker.yml -i hosts

### Syncthing Backup Server

To make the Pi a Syncthing backup server:

ansible-playbook syncthing.yml -i hosts

Visit port `8889` on your Pi to see the Web GUI.

### RVM & Ruby

ansible-playbook ruby.yml -i hosts

### Wifi

**Hasn't been tested yet**
You want wifi?

ansible-playbook wifi.yml -i hosts --extra-vars="ssid_name=yourssid ssid_password=yourssidpassword"

### NoIP (no-ip.com)

**Hasn't been tested yet**

ansible-playbook noip.yml -i hosts --extra-vars="noip_username=yourusername noip_password=yournoippassword"

### Electrum

ansible-playbook electrum.yml -i hosts

### Disable SSH login

Warning: make sure you are able to log in using a ssh key, or else you won't be able to log in remotely.

ansible-playbook secure.yml -i hosts

### Samba share

Here we create a folder on `/media/storage`, with username `pi` with password specified below:

ansible-playbook nas.yml -i hosts --extra-vars="dir=/media/storage/share smbpassword=yoursmbpassword"

### BitTorrent with Deluge

http://deluge-torrent.org

ansible-playbook bittorrent.yml -i hosts --extra-vars="deluge_username=delugeusername deluge_password=delugepassword download_location=/media/storage/downloads/bittorrent"

In the specified download location, you should set the following in your deluge thin client:

- downloading
- completed
- watch
- torrent-backups

As shown in [this page's](http://www.howtogeek.com/142044/how-to-turn-a-raspberry-pi-into-an-always-on-bittorrent-box/) "Configuring Your Download Location" section.

## Watch Mount

ansible-playbook mount.yml -i hosts --extra-vars="path=/media/storage"

If the mount cannot be detected, it will reboot the system. If you specify a dir that really does not exist, it will keep rebooting. You have 10 cycles (about ~150 seconds -- depends on what monit is configured consider a cycle) to change it before it reboots again.

# Others

## USB Auto Mount

_Instructions from [here](http://kwilson.me.uk/blog/force-your-raspberry-pi-to-mount-an-external-usb-drive-every-time-it-starts-up/)_

Find out where in `/dev/sd*` your disk is (probably `/dev/sda1`):

sudo fdisk -l

You should create the directory where you want it to be mounted: `sudo mkdir /media/storage`

## Format disk

If you need format the drive, see [this](http://superuser.com/questions/643765/creating-ext4-partition-from-console).
# Usage

NOTE: I'm currently moving these playbooks to use Docker whenever possible and wise. See progress in the [hypriot_compat](https://github.com/ramontayag/rpi-playbooks/tree/hypriot_compat) branch.

It looks like the new version of Raspbian do not have SSH enabled. This is probably for the better - people won't accidentally leave the port open with the default password `raspberry`. However, it makes it a little harder to get your Pi setup because you'll need a monitor and a keyboard.

- Before we start, boot up your Pi, and in `sudo raspi-config`, navigate to Advanced Options and enable SSH.
- While you're there, we might as well expand the filesystem. In the main menu, expand the filesystem.


ansible-playbook aptu.yml -i hosts
ansible-playbook backup.yml -i hosts
ansible-playbook base.yml -i hosts
ansible-playbook bittorrent.yml -i hosts
ansible-playbook docker.yml -i hosts
ansible-playbook electrum.yml -i hosts
ansible-playbook git.yml -i hosts
ansible-playbook mongodb.yml -i hosts
ansible-playbook monit.yml -i hosts
ansible-playbook mount.yml -i hosts
ansible-playbook mqtt.yml -i hosts
ansible-playbook mysql.yml -i hosts
ansible-playbook nas.yml -i hosts
ansible-playbook nodejs.yml -i hosts
ansible-playbook noip.yml -i hosts
ansible-playbook port_forwarded.yml -i hosts
ansible-playbook postgresql.yml -i hosts
ansible-playbook python.yml -i hosts
ansible-playbook ruby.yml -i hosts
ansible-playbook secure.yml -i hosts
ansible-playbook setup.yml -i hosts
ansible-playbook syncthing.yml -i hosts
ansible-playbook ucf.yml -i hosts
ansible-playbook wifi.yml -i hosts
ansible-playbook zeromq.yml -i hosts
