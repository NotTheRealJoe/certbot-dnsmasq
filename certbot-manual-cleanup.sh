#!/bin/bash
if [ -f /tmp/certbot-dnsmasq.pid ]; then
	kill $(cat /tmp/certbot-dnsmasq.pid)
	rm -f /tmp/certbot-dnsmasq.pid
	rm -f /tmp/certbot-dnsmasq.conf
fi
