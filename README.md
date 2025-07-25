# Install Ansible on macOS Workstations

This is a system that uses Ansible to bootstrap macOS systems that I use.

## Quick Start

To get started:

```
curl -L https://raw.githubusercontent.com/stephenulmer/macos-setup-ansible/master/setup.sh | /bin/bash
```

## Boostrap Phase

First run the provided setup.sh script which will:

- Install the Xcode Command Line Tools (python3 will not run without them?!)
- Create a Python virtualenv and install ansible-core 
- Download a copy of this git repo
- Install the prerequsite Ansile collections and roles
- Run the bootstrap.yml playbook

The bootstrap.yml playbook will ask for the BECOME password (the password for sudo), so that it can install Homebrew, 1Password and a few dependencies.

Once the playbook completes, the user should start 1Password and connect it to their Vaults. This is easily and quickly done by scanning the presented QR code with the 1Password mobile app. Next, enable 1Password CLI and SSH integration:

    1Password -> Settings -> Developer -> Use the SSH Agent
    1Password -> Settings -> Developer -> Edit SSH Config (appears after above is checked)
    1Password -> Settings -> Developer -> Integrate with 1Password CLI

Now 1Password is ready to provide secrets to automate additional installation.

Homebrew needs permission to update casks installed in /Applications, and Ansible needs to update preferences plist files. Add `Terminal.app` to:

    System Settings -> Privacy & Security -> App Management
    System Settings -> Privacy & Security -> Full Disk Access

Terminal.app may need to restart to apply the new permissions. If so, you will need to re-activate the Python virtualenv:

    source ~/.ansible-bootstrap/bin/activate


## Setup Phase

Run the dotfiles.yml playbook:

    ansible-playbook playbooks/dotfiles.yml

This installs the dotfiles git repository, which includes `~/bin/op-sudo`.

When called aith the '-A' argument, sudo will look in the SUDO_ASKPASS environment variable for the name of a command to run to get the password. Setting SUDO_ASKPASS="$HOME/bin/op-sudo" enables 1Password to provide sudo with the escalation credentials, authorized with Touch ID. 1password will look for a Login item named *username*@*hostname*, and provide the password from that to sudo.

Run the packages.yml playbook:

    ansible-playbook playbooks/packages.yml

The `packages.yml` playbook runs the `geerlingguy.mac.homebrew` role to install the software listed in the inventory. The role is called in such a way that if the BECOME passwword is needed it is provided by 1Password.


## Evolution

This was my first self-motivated project with Ansible, and served as a learning tool.  As such, the form has changed quite a bit as I've matured with this particular tool -- the organizational philosphy is very different from cfengine and chef.

This repo started with a handful of custom roles for Ansible, but they fell into one of two categories:

  - complicated enough to warrant their own repo
  - just a wrapper for an existing role

The former are working their way into existence, and the latter have been transformed into playbooks and moved to their own repo.


## Motivation

When I acquired my 2017 MacBook Adorable(tm), the 2013 13" Retina MacBook Pro I had been using became a desktop workstation. To guard my sanity, I decided that all of my work product, documents, and projects would live in various cloud services.

This took care of my "user data" so to speak, but not the actual configuration of the workstations themselves. If I lost a computer (let's say to customs, the TSA, or a hotel thief), then I would have still been hours or days from a comfortable work environment -- even after replacing the hardware and syncing my data. As this project matures, it should converge towards complete coverage of my configuration.
