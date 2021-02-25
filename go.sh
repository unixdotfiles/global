#!/bin/sh

trap 'exit 1' INT

git pull --rebase || true
sudo ansible-galaxy install -r requirements.yml

sudo ansible-playbook --diff -i inventory/$(hostname).yml site.yml "$@"
