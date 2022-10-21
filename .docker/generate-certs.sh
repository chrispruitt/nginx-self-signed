#!/bin/bash

DOMAIN=mycert

# generate certs
openssl req -new -newkey rsa:4096 -days 3650 -nodes -x509 \
    -subj "/C=US/ST=CA/L=SanDiego/O=Figg/CN=oe.gofigg.com" \
    -keyout /etc/ssl/private/${DOMAIN}.key -out /etc/ssl/certs/${DOMAIN}.crt

# create conf directory
mkdir -p /etc/nginx/snippets/
mkdir -p /etc/ssl/private/

# configure nginx
cat << EOF > /etc/nginx/snippets/self-signed.conf
ssl_certificate /etc/ssl/certs/${DOMAIN}.crt;
ssl_certificate_key /etc/ssl/private/${DOMAIN}.key;

EOF

