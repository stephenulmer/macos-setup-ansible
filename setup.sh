#!/bin/bash
##
## Start installation of macOS Workstation with Ansible
##

sudo -v
sudo launchctl limit maxfiles unlimited
sudo easy_install pip
sudo pip install ansible

ansible-pull -U git@github.com:stephenulmer/macos-setup-ansible.git \
	--skip-tag="mas" \
	--accept-host-key \
	--private-key=~/.ssh/rsa_deployment_key \
	-i localhost,

