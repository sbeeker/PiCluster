#!/bin/bash
rooturl="https://dist.8086.net/clusterctrl/usbboot/bullseye/2023-05-03/"
dist="2023-05-03-4-bullseye-ClusterCTRL-armhf-lite-usbboot.tar.xz"
username="pi"
password="picluster"

url="$rooturl$dist"

for pinum in {1..4};
do

        # Updating username and password on pis
        echo "$username:"$(echo 'picluster' | openssl passwd -6 -stdin) | sudo tee /var/lib/clusterctrl/nfs/p$pinum/boot/userconf.txt

done
