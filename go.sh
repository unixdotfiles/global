#!/bin/sh
sudo ansible-playbook --diff site.yml "$@"
