#!/bin/bash
./check-dependencies.sh
if [[ "$?" -ne 0 ]]; then
    exit 1
fi

domainString=""
for d in $@; do
	domainString="$domainString -d $d"
done
certbot certonly $domainString --agree-tos --manual --preferred-challenges=dns --manual-auth-hook ./certbot-manual-authenticator.sh --manual-cleanup-hook ./certbot-manual-cleanup.sh
