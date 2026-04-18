ssh steve@stapp02

docker network create --help
# output:
# Usage:  docker network create [OPTIONS] NETWORK

# Create a network

# Options:
#       --attachable           Enable manual container attachment
#       --aux-address map      Auxiliary IPv4 or IPv6 addresses used by
#                              Network driver (default map[])
#       --config-from string   The network from which to copy the configuration
#       --config-only          Create a configuration only network
#   -d, --driver string        Driver to manage the Network (default "bridge")
#       --gateway strings      IPv4 or IPv6 Gateway for the master subnet
#       --ingress              Create swarm routing-mesh network
#       --internal             Restrict external access to the network
#       --ip-range strings     Allocate container ip from a sub-range
#       --ipam-driver string   IP Address Management Driver (default "default")
#       --ipam-opt map         Set IPAM driver specific options (default map[])
#       --ipv6                 Enable IPv6 networking
#       --label list           Set metadata on a network
#   -o, --opt map              Set driver specific options (default map[])
#       --scope string         Control the network's scope
#       --subnet strings       Subnet in CIDR format that represents a
#                              network segment

docker network create --driver bridge --subnet 172.28.0.0/24 --ip-range 172.28.0.0/24 beta
# output:
# 16f6e40ae537111770ac709c1e369661ed122e65c935617abab56e2d97a4a018

docker network ls
# output:
# NETWORK ID     NAME      DRIVER    SCOPE
# 16f6e40ae537   beta      bridge    local
# d6f009b74bcd   bridge    bridge    local
# 9af119af5c5b   host      host      local
# fc0b8006b8f5   none      null      local
