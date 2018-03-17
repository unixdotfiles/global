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
  allow_chflags=0 \
  allow_quotas=0 \
  allow_raw_sockets=0 \
  allow_set_hostname=1 \
  allow_socket_af=0 \
  allow_sysvipc=0 \
  sysvmsg=new sysvsem=new sysvshm=new \
  children_max=1000 \
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
