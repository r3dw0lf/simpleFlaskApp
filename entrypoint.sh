#!/bin/sh

eval $(jq -r 'to_entries | .[] | "export " + .key + "=" + (.value | @sh)' < /opt/file.json)
exec "$@"
