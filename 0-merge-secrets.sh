#!/bin/bash
cat secrets/pull-secret.txt | jq ".auths += `cat secrets/reg-secret.json`" | tr -d '[:space:]' > secrets/pull-secret-merged.json
cp secrets/pull-secret-merged.json ~/.docker/config.json