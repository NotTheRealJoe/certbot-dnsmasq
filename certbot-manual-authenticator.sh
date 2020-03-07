#!/bin/bash
./check-dependencies.sh
if [[ "$?" -ne 0 ]]; then
    exit 1
fi

if [ -f /tmp/certbot-dnsmasq.pid ]; then
	kill $(cat /tmp/certbot-dnsmasq.pid)
fi

if [ ! -f /tmp/certbot-dnsmasq.conf ]; then
	echo "pid-file=/tmp/certbot-dnsmasq.pid
strict-order
no-resolv
no-hosts" > /tmp/certbot-dnsmasq.conf
fi

echo "txt-record=_acme-challenge.$CERTBOT_DOMAIN,\"$CERTBOT_VALIDATION\"" >> /tmp/certbot-dnsmasq.conf
dnsmasq -C /tmp/certbot-dnsmasq.conf
