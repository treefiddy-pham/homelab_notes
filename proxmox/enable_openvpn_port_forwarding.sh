#!/bin/bash
# Not really a script. Just commands to forward udp port 1194 (OpenVPN) received by the host interface to 
# the host-internal private IP to the OpenVPN server.

##variables
SOURCE_INTERFACE="vmbr0"
OPENVPN_SERVER="192.168.2.100"
OPENVPN_PORT="1194"
OPENVPN_PROTO="udp"

## adds rule
iptables -t nat -A PREROUTING -i $SOURCE_INTERFACE -p $OPENVPN_PROTO --dport $OPENVPN_PORT -j DNAT --to-destination $OPENVPN_SERVER:$OPENVPN_PORT

## Saves rules to file
## iptables-save
iptables-save > /etc/iptables.rules