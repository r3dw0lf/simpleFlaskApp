#!/bin/sh

if [[ -z "${SECRET_PATH}" ]]; then
  SECRET_STORE="/mnt/"
else
  SECRET_STORE="${SECRET_PATH}"
fi

for i in `find ${SECRET_STORE} -name "*.json" -type f`; do
    eval $(jq -r 'to_entries | .[] | "export " + .key + "=" + (.value | @sh)' < $i)
done

exec "$@"

