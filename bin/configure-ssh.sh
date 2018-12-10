sudo apt-get update
sudo apt-get upgrade
sudo apt-get install git
git config --global user.name "Scott A. Beeker"
git config --global user.email "sbeeker@ix.netcom.com"
git config --global core.editor vi
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install ansible
sudo apt-get update
sudo apt-get upgrade
ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
mkdir -p /var/lib/clusterhat/nfs/p{1,2,3,4}/home/pi/.ssh/
cat ~/.ssh/id_rsa.pub >> /var/lib/clusterhat/nfs/p1/home/pi/.ssh/authorized_keys
cat ~/.ssh/id_rsa.pub >> /var/lib/clusterhat/nfs/p2/home/pi/.ssh/authorized_keys
cat ~/.ssh/id_rsa.pub >> /var/lib/clusterhat/nfs/p3/home/pi/.ssh/authorized_keys
cat ~/.ssh/id_rsa.pub >> /var/lib/clusterhat/nfs/p4/home/pi/.ssh/authorized_keys
