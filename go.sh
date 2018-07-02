#!/bin/sh

trap 'exit 1' INT

git pull --rebase || true
sudo ansible-galaxy install -r requirements.yml

if [ -e /root/.ansible.vault.password ]
then
  sudo ansible-playbook --diff -i inventory/$(hostname).yml site.yml --vault-password-file=/root/.ansible.vault.password "$@"
else
  echo skipping vault
  sudo ansible-playbook --diff -i inventory/$(hostname).yml site.yml -v "$@"
fi
