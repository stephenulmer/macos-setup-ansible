# Configure macOS Workstations With Ansible

This playbook configures the Mac systems that I use.

## Quick Start

To get started:

```
curl -L https://raw.githubusercontent.com/stephenulmer/macos-setup-ansible/master/setup.sh | /bin/bash
```

This script will install pip and Ansible, then run ansible-pull against this repo and run the playbooks.

Tasks that require the Mac App Store have an Ansible tag of "mas", and are skipped by default. This is because there is no command-line friendly way to sign in to the app store since High Sierra. As long as you use the Mac App Store App and sign in before running the playbooks, the items tagged "mas" will work just fine.

## Motivation

When I acquired my 2018 MacBook Adorable(tm), my 2013 13" MacBook Pro became a desktop workstation. To guard my sanity, I decided that all of my work product, documents, and projects would live in various cloud services.

This took care of my "user data" so to speak, but not the actual configuration of the workstations themselves. If I loose one (let's say to customs or the TSA), then I'm still hours or days from a comfortable work environment -- even after replacing the hardware and syncing my data.

