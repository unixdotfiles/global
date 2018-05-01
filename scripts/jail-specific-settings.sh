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
  quota=1G \
  zroot/iocage/jails/znc

zfs set \
  quota=2G \
  zroot/iocage/jails/vpn
