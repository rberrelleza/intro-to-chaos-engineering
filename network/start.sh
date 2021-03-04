#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

toxiproxy-server --config $DIR/toxiproxy.json &
export ASTRE_PORT=8445
$DIR/../app/start.sh
