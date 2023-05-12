#!/bin/bash
DOMAIN=provision.ocp.example.com
openssl req -newkey rsa:4096 -nodes -sha256 \
  -keyout certs/$DOMAIN.key -x509 -days 356 \
  -out certs/$DOMAIN.crt \
  -subj "/C=US/ST=NorthCarolina/L=Raleigh/O=Red Hat/OU=Engineering/CN=$DOMAIN" \
  -addext "subjectAltName = DNS:$DOMAIN"