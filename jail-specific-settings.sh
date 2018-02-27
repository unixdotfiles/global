#!/bin/sh
iocage set enforce_statfs=1 allow_mount=1 allow_mount_nullfs=1 allow_mount_linsysfs=1 allow_mount_zfs=1 sysvmsg=new sysvsem=new sysvshm=new develop
