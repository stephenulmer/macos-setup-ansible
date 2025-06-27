#!/bin/bash
##
## Start installation of macOS Workstation with Ansible
##

repo="macos-setup-ansible"
export ANSIBLE_BS="${HOME}/.ansible-bootstrap"

##
## Install CLI developer tools, because macOS won't run python
## without them.
##
## See http://apple.stackexchange.com/questions/107307/how-can-i-install-the-command-line-tools-completely-from-the-command-line
##
echo "Checking Xcode CLI tools"
xcode-select -p &> /dev/null
if [ $? -ne 0 ]; then
  echo "Installing Xcode CLI tools"
  touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress;
  PROD=$(softwareupdate -l \
	  | awk -F: '/Label: Command Line Tools/ { gsub(/^ +/, "", $2); print $2 }' \
	  | tail -n 1)
  softwareupdate -i "$PROD"
else
  echo "Xcode CLI tools already istalled"
fi


##
## Create a virtualenv so as not to disturb the system python,
## and install ansible-core.
##
python3 -m venv ${ANSIBLE_BS}
source ${ANSIBLE_BS}/bin/activate
python3 -m pip install ansible-core


##
## Download and run the setup playbooks.
##
mkdir -p "${repo}"
cd "${repo}"
curl -L "https://github.com/stephenulmer/${repo}/tarball/master" \
	| tar -xf - --strip-components 1

ansible-galaxy collection install -r requirements.yml
ansible-galaxy role install -r requirements.yml
ansible-playbook -K playbooks/bootstrap.yml
