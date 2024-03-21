#!/bin/bash
rooturl="https://dist.8086.net/clusterctrl/usbboot/bullseye/2023-05-03/"
dist="2023-05-03-4-bullseye-ClusterCTRL-armhf-lite-usbboot.tar.xz"
username="pi"
password="picluster"

url="$rooturl$dist"
wget -P ~pi/ $url

for pinum in {1..4};
do

        # remove previous
        sudo rm -rf /var/lib/clusterctrl/nfs/p$pinum/{*,.*}

        echo "Untarring pi" $pinum
        sudo tar -axf ~pi/$dist -C /var/lib/clusterctrl/nfs/p$pinum/
        echo "Init boot"  $pinum
        sudo usbboot-init $pinum


        # Turn off bash history temporarily
        set +o history

        # Updating username and password on pis
        echo "$username:"$(echo 'picluster' | openssl passwd -6 -stdin) | sudo tee /var/lib/clusterctrl/nfs/p$pinum/boot/userconf.txt

        # Turn history back on again
        set -o history

        sudo touch /var/lib/clusterctrl/nfs/p$pinum/boot/ssh
        clusterctrl on p$pinum
done

tail -f /var/log/daemon.log /var/log/kern.log
~                                                                                                                                                                                             
~                
