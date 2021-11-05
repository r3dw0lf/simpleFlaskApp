#!/bin/sh


for i in `find /opt/ -name "*.json" -type f`; do
    eval $(jq -r 'to_entries | .[] | "export " + .key + "=" + (.value | @sh)' < $i)
done


exec "$@"
