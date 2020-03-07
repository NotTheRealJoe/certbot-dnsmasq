#!/bin/bash
./check-dependencies.sh
if [[ "$?" -ne 0 ]]; then
    exit 1
fi

certbot renew --agree-tos --manual --manual-public-ip-logging-ok --preferred-challenges=dns --manual-auth-hook ./certbot-manual-authenticator.sh --manual-cleanup-hook ./certbot-manual-cleanup.sh
