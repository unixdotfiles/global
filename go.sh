#!/bin/sh
git pull --rebase || true
sudo ansible-playbook --diff inventory/$(hostname).yml -v "$@"
