#!/bin/bash
check="dnsmasq certbot"
progs=""
while read -r prog; do
    if [[ -z "$(command -v "$prog")" ]]; then
        progs="$progs $prog"
    fi
done <<< "$(echo $check | tr " " "\n")"

if [[ ! -z "$progs" ]]; then
    echo "Error: You must have the following installed!"
    echo "    $progs"
    exit 1
fi
