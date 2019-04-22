#!/bin/bash
##
## Start installation of macOS Workstation with Ansible
##

repo="macos-setup-ansible"
vault_password_file="${HOME}/.vault-password"
skiptags="--skip-tags=mas"

if [ -f "${vault_password_file}" ] ; then
  vaultargs="--vault-password-file=$(vault_password_file)"
else
  skiptags+=",vault"
fi

export PYTHONUSERBASE="${HOME}/.ansible-bootstrap"
export PATH=${PYTHONUSERBASE}/bin:$PATH

sudo -v
sudo launchctl limit maxfiles unlimited
sudo easy_install pip
pip install --user ansible

mkdir -p "${repo}"
cd "${repo}"

curl -L "https://github.com/stephenulmer/${repo}/tarball/master" \
	| tar -xf - --strip-components 1

ansible-galaxy install -r requirements.yml
ansible-playbook ${skiptags} ${vaultargs} -i localhost, --connection=local setup.yml
