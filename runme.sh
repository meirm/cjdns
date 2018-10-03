#!/usr/bin/env bash

set -ex

# Usage:
#   contrib/docker/run [<name>]
#   docker exec -it cjdns[-<name>] cjdnslog
#   docker exec -it cjdns[-<name>] peerStats
#   docker exec -it cjdns[-<name>] sessionState
#   docker exec -it cjdns[-<name>] dumptable
#   docker exec -it cjdns[-<name>] <any-command-from-tools/>
#   cat contrib/docker/cjdns[-<name>]/cjdroute.conf

# Location of cjdroute.conf within the container
CONF_DIR="/etc/cjdns"

IMAGE=meirm/cjdns

if [ "$1" == "--setup" ]; then
	docker build -t $IMAGE .
	exit $?
fi

[ "$1" == "" ] && name="cjdns" || name="cjdns-$1"
shift


exec docker run -it --rm --name=$name \
                --cap-add=NET_ADMIN --device=/dev/net/tun \
                --volume="$(pwd)/conf/$name:$CONF_DIR" $IMAGE $@
