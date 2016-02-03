#!/bin/bash

# we need git and ansible to get started
yum install -y git
yum install -y ansible

# ansible complains if these files are on the windows share because permissions
cp /vagrant/hosts /etc/ansible/hosts
cp /vagrant/.vagrant/machines/default/virtualbox/private_key /etc/ansible/private_key
# set complaint-free permissions
chmod 600 /etc/ansible/private_key
chmod -x /etc/ansible/hosts

# run ansible
ansible-galaxy install -r /vagrant/requirements.yml --force
ansible-playbook --inventory-file=/etc/ansible/hosts --private-key=/etc/ansible/private_key /vagrant/vagrant.yml

