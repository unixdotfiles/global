iocage \
  create \
  sysvmsg=disable sysvsem=disable sysvshm=disable \
  ip4_addr=none \
  ip6_addr=none \
  defaultrouter=192.168.200.1 \
  bpf=yes \
  dhcp=on \
  devfs_ruleset=5 \
  vnet=on \
  allow_set_hostname=0 \
  boot=on \
  -r 11.1-RELEASE \
  "$@"
