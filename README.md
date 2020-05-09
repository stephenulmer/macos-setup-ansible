# Install Ansible on macOS Workstations

This is a system, to bootstrap Ansible on macOS systems that I use.

## Quick Start

To get started:

```
curl -L https://raw.githubusercontent.com/stephenulmer/macos-setup-ansible/master/setup.sh | /bin/bash
```

This script will install pip and Ansible, then fetch a copy of this repo and run the setup.yml playbook.

Ansible and its dependencies are installed into ~/.ansible-bootstrap and pip is installed for system-wide use. As the last play in setup.yml, Ansible is installed again using Homebrew, and then ~/.ansible-bootstrap is removed. This leaves an Ansible installation that is manageable with brew, and doesn't change the user's python environment.

The setup.yml playbook only installs the Homebrew package manager and the Mac App Store CLI.

## Evolution

This was my first self-motivated project with Ansible, and served as a learning tool.  As such, the form has changed quite a bit as I've matured with this particular tool -- the organizational philosphy is very different from cfengine and chef.

This repo started with a handful of custom roles for Ansible, but they fell into one of two categories:

  - complicated enough to warrant their own repo
  - just a wrapper for an existing role

The former are working their way into existence, and the latter have been transformed into playbooks and moved to their own repo.


## Motivation

When I acquired my 2017 MacBook Adorable(tm), the 2013 13" Retina MacBook Pro I had been using became a desktop workstation. To guard my sanity, I decided that all of my work product, documents, and projects would live in various cloud services.

This took care of my "user data" so to speak, but not the actual configuration of the workstations themselves. If I lost a computer (let's say to customs, the TSA, or a hotel thief), then I would have still been hours or days from a comfortable work environment -- even after replacing the hardware and syncing my data. As this project matures, it should converge towards complete coverage of my configuration.
