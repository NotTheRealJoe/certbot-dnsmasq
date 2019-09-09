#!/bin/bash
certbot renew --agree-tos --manual --manual-public-ip-logging-ok --preferred-challenges=dns --manual-auth-hook ./certbot-manual-authenticator.sh --manual-cleanup-hook ./certbot-manual-cleanup.sh
