#!/bin/bash
domainString=""
for d in $@; do
	domainString="$domainString -d $d"
done
certbot certonly $domainString --agree-tos --manual --manual-public-ip-logging-ok --preferred-challenges=dns --manual-auth-hook ./certbot-manual-authenticator.sh --manual-cleanup-hook ./certbot-manual-cleanup.sh
