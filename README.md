# certbot-dnsmasq
certbot-dnsmasq is a small collection of shell scripts to allow you to complete a DNS-01 challenge for Let's Encrypt or
other ACME servers. The script spins up a temporary instance of dnsmasq that hosts the appropriate record for the ACME
server to perform the verification.

This project is intended for servers that are not DNS servers -- that is, the dnsmasq instance it uses is temporary, and
port 53 needs to be not in use by any other application. If you're already running a DNS server daemon, it should be
pretty easy to get Certbot to talk to it. See https://certbot.eff.org/docs/using.html#hooks.

## dependencies
**dnsmasq** and **certbot** must be installed and available in PATH. Make sure you're using a version of certbot new
enough to support the DNS-01 challenge.

## configuring host records
You will need to add a record at your upstream DNS provider so that the ACME server knows to hit your real server to get
the verification code.

Create a NS record for the subdomain `_acme-challenge` that points to your server. You can use the server's IP or
another host record that points to it if available.

You will also need to do it for any subdomains that you wish to issue a record for. For example, if you wanted to issue
a certificate for `example.com` and `www.example.com`, you would need host records for both
`_acme-challenge.example.com` and `_acme-challenge.www.example.com`.

I have run into the registrar Ionos (formerly One and One) not supporting NS records that start with an underscore,
meaning it is not possible to use certbot-dnsmasq or similar scripts if you are using their DNS. Having a NS record that
starts with an underscore is within specifications, so there is no reason they shouldn't be able to do this, but
unfortunately they are not up to standards so you will need to find another provider to get certbot-dnsmasq to work.

## dnsmasq configuration
In a basic setup, dnsmasq should require no extra configuration to be run by the scripts. If you need to pass extra
options to dnsmasq, such as an alternative port or listen interface, create dnsmasq.conf in the same directory as the
scripts and your config will be copied in when the scripts run it.

## running
### issuing a new certificate
```bash
./issue.sh <domain1.com> [domain2.com] [domain3.com] ...
```

### renewing certificates
```bash
./renew.sh
```

## improvements
Because of the way that certbot calls the hooks script multiple times when multiple domains are specified for a single
cert but with no indication of which call is the last, dnsmasq is restarted several times unnecessarily. It may be
possible to better detect the state of certbot and not waste time starting and stopping dnsmasq a bunch.

## contributing
Pull requests through GitHub. Any contribution is welcomed.

## license
The author hereby releases this work into the Public Domain.
