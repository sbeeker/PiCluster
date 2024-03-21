# After configuring the cluster using chsetup.sh
# Install Ansible on each pi.

# look at network for address
ifconfig br0

# edit and install /etc/hosts information
# template file host-add.txt
#
# also do similar for ansible updating the myhosts file

# Configure the PPA and install Ansible run these commands:
sudo apt update
# these seem to cause issues
# sudo apt install software-properties-common
# sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible
# Check installed ansible version (In my case it is 2.9.6)
ansible --version 

# Configure to skip the host key check in the file /etc/ansible/ansible.cfg file and add the following part:
# [defaults]
 host_key_checking = False

# test the connectivity
ansible myservers -i myhosts -m ping -u pi --ask-pass

# As of Ansible 2.9, shell completion of the Ansible command line utilities is available and provided through an optional dependency called argcomplete
sudo apt install python-argcomplete

