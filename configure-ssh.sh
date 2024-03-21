#! /bin/sh

# genrate a ssh key
ssh-keygen -o

ssh-copy-id pi@172.19.180.1
ssh-copy-id pi@172.19.180.2
ssh-copy-id pi@172.19.180.3
ssh-copy-id pi@172.19.180.4

# TODO: somehow add the pi zeros to the hosts file 
# we can do a "ifconfig on br0 to get base adresses"

# Add each host to the /etc/hosts file
# base="172.19.180."
# for i in {1..4}; 
# do 
# 	sudo echo "$base$i\t\tp$i\n" >> /etc/hosts
# done


# base="172.19.180."
# for i in {1..4}; 
# do 
# 	ssh-copy-id pi@p$i
# done
