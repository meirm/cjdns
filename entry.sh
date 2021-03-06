#!/bin/bash

if ! [ -s /etc/cjdns/cjdroute.conf ]; then
  echo -n "Generate /etc/cjdns/cjdroute.conf... "
  (
    umask 077
    cjdroute --genconf >/etc/cjdns/cjdroute.conf
  )
  echo "ok"
fi

if [ $1 == "cjdroute" ] ; then
	exec </etc/cjdns/cjdroute.conf
fi
exec "$@"

