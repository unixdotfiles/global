#!/bin/sh
git pull --rebase || true
sudo ansible-galaxy install -r requirements.yml
sudo ansible-playbook --diff -i inventory/$(hostname).yml site.yml --vault-password-file=~/.ansible.vault.password -v "$@"
