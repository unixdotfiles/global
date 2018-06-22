#!/bin/sh

set -eux

iocage set \
  securelevel=3 \
  bastion

