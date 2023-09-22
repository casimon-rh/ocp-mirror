#!/bin/bash
cat secrets/pull-secret.txt | jq ".auths += `cat secrets/reg-secret.json`" | tr -d '[:space:]' > secrets/pull-secret-merged.json
# will override!
cp secrets/pull-secret-merged.json $XDG_RUNTIME_DIR/containers/auth.json
