#!/bin/bash

eval $(jq -r 'to_entries | .[] | "export " + .key + "=" + (.value | @sh)' < file.json)