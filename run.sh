#! /bin/sh
#
# Example of running the Suricata Docker image.
#
# Add -i <interface> for IDS mod.
# Add -q <num> for IPS mod.

sudo iptables -I FORWARD -j NFQUEUE

docker run --rm -it \
       --name=suricata \
       --cap-add=sys_nice \
       --cap-add=net_admin \
       --net=host \
       -v $(pwd)/etc:/etc/suricata \
       -v $(pwd)/logs:/var/log/suricata \
       yeiazel/suricata-ips:latest $@

sudo iptables -D FORWARD -j NFQUEUE
