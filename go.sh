#!/bin/sh
git pull --rebase || true
sudo ansible-playbook --diff site.yml -v "$@" 
