#!/bin/bash
##
## Start installation of macOS Workstation with Ansible
##

repo="macos-setup-ansible"

sudo -v
sudo launchctl limit maxfiles unlimited
sudo easy_install pip
sudo pip install ansible

mkdir -p "${repo}"
cd "${repo}"
curl -L "https://github.com/stephenulmer/${repo}/tarball/master" \
	| tar -xf - --strip-components 1

ansible-galaxy install -r requirements.yml
ansible-playbook --skip-tag="mas" -i localhost, --connection=local setup.yml
