#!/bin/sh
git pull --rebase || true
sudo ansible-galaxy install -r requirements.yml

if [ -e /root/.ansible.vault.password ]
then
  sudo ansible-playbook --diff -i inventory/$(hostname).yml site.yml --vault-password-file=/root/.ansible.vault.password -v "$@"
else
  echo skipping vault
  sudo ansible-playbook --diff -i inventory/$(hostname).yml site.yml -v "$@"
fi
