#!/bin/bash
##
## Start installation of macOS Workstation with Ansible
##

sudo -v
sudo launchctl limit maxfiles unlimited
sudo easy_install pip
sudo pip install ansible

ansible-pull -U https://github.com/stephenulmer/macos-setup-ansible.git \
	--skip-tag="mas" \
	-i localhost,

