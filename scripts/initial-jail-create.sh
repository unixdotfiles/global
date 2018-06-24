sudo iocage activate zroot
sudo ./createjail.sh -n bastion

iocage set \
  securelevel=3 \
  bastion
