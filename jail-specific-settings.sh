#!/bin/sh

set -eux

iocage set \
  enforce_statfs=1 \
  allow_mount=1 \
  allow_mount_devfs=1 \
  allow_mount_nullfs=1 \
  allow_mount_zfs=1 \
  allow_mount_tmpfs=1 \
  allow_mount_procfs=1  \
  sysvmsg=new sysvsem=new sysvshm=new \
  develop

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
