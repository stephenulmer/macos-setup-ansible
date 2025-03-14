#!/bin/bash
##
## Start installation of macOS Workstation with Ansible
##

repo="macos-setup-ansible"

export ANSIBLE_BS="${HOME}/.ansible-bootstrap"

python3 -m venv ${ANSIBLE_BS}
source ${ANSIBLE_BS}/bin/activate
python3 -m pip install ansible-core

mkdir -p "${repo}"
cd "${repo}"

curl -L "https://github.com/stephenulmer/${repo}/tarball/master" \
	| tar -xf - --strip-components 1

ansible-galaxy collection install -r requirements.yml
ansible-galaxy role install -r requirements.yml
ansible-playbook -K main.yml
