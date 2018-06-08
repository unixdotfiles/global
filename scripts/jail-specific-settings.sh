#!/bin/sh

set -eux

iocage set \
  securelevel=3 \
  bastion

zfs set \
  quota=800G \
  zroot/iocage/jails

zfs set \
  quota=1G \
  zroot/iocage/jails/bastion

zfs set \
  quota=2G \
  zroot/iocage/jails/vpn

# Set sanity check quotas. If the usage are higher
# than this, we have a run-away process

# This should be much lower
zfs set \
  quota=400G \
  zroot/ROOT

zfs set \
  quota=300G \
  zroot/srv

zfs set \
  quota=200G \
  zroot/srv/cores

zfs set \
  quota=200G \
  zroot/srv/obj/ccache

zfs set \
  quota=200G \
  zroot/srv/obj/ccache-poudriere

zfs set \
  quota=200G \
  zroot/srv/obj
