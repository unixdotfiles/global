#!/bin/sh

set -eux

if ! zfs list zroot/srv > /dev/null
then
  zfs create zroot/srv \
    -o redundant_metadata=most \
    -o mountpoint=/srv \
    -o logbias=latency
fi

for ds in srv/src srv/obj srv/cores
do
  if ! zfs list "zroot/$ds" > /dev/null
  then
    zfs create "zroot/$ds"
  fi
done

zfs \
  redundant_metadata=most \
  logbias=latency \
  atime=off \
  zroot/srv/src

zfs \
  redundant_metadata=most \
  logbias=throughput \
  atime=off \
  zroot/srv/obj

zfs \
  redundant_metadata=all \
  logbias=throughput \
  sync=disabled \
  atime=off \
  zroot/usr/src
