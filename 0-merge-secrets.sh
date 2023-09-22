#!/bin/bash
cat secrets/pull-secret.txt | jq ".auths += `cat secrets/reg-secret.json`" | tr -d '[:space:]' > secrets/pull-secret-merged.json
# Default podman location
mkdir -p ~/.config/containers
cp secrets/pull-secret-merged.json ~/.config/containers/auth
