#!/bin/bash
BASE_DIR=/home/casimon/mirror
DOMAIN=provision.ocp.example.com
podman run --name ocp-registry -d -p 5001:5000 \
  -v $BASE_DIR/data:/var/lib/registry:z \
  -v $BASE_DIR/auth:/auth:z \
  -v $BASE_DIR/certs:/certs:z \
  -e "REGISTRY_AUTH=htpasswd" \
  -e "REGISTRY_AUTH_HTPASSWD_REALM=Registry" \
  -e "REGISTRY_HTTP_SECRET=ALongRandomSecretForRegistry" \
  -e "REGISTRY_AUTH_HTPASSWD_PATH=/auth/htpasswd" \
  -e "REGISTRY_HTTP_TLS_CERTIFICATE=/certs/$DOMAIN.crt" \
  -e "REGISTRY_HTTP_TLS_KEY=/certs/$DOMAIN.key" \
  docker.io/library/registry:2

# podman login provision.ocp.example.com:5001