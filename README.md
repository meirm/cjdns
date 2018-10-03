docker-cjdns
============

Installation is simple. On first run, cjdns will generate your IP
address. The cjdns configuration lies in `/etc/cjdns` (which is a
docker volume).

To be useful you'll have to run this in privileged mode, with the
same network stack as the host. This can be acomplished using the
docker options `--privileged --net=host`.

    docker pull meirm/cjdns
    docker run --privileged --net=host --volume /etc/cjdns:/etc/cjdns meirm/cjdns

For testing purpose you can run it without privileged mode and then 
you can run multiple containers and let them talk between them.

Included there is runme.sh which should allow you to run multiple instances.

To Build the image run:

    ./runme.sh --setup

To run an instance run:

    ./runme.sh <instance-name>

