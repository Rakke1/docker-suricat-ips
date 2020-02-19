#!/bin/bash
mkdir etc
docker run --rm -it -v $(pwd)/etc:/etc/suricata yeiazel/suricata-ips:latest -V
mkdir log
docker run --rm -it -v $(pwd)/log:/var/log/suricata yeiazel/suricata-ips:latest -V
