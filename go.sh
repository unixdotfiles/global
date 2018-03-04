#!/bin/sh
git pull --rebase || true
sudo ansible-playbook --diff -i inventory/$(hostname).yml site.yml -v "$@"
