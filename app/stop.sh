#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

test -f /tmp/sunset.pid && pkill -F /tmp/sunset.pid
test -f /tmp/astre.pid &&  pkill -F /tmp/astre.pid
pkill -f astre.py
pkill -f sunset.py
cp $DIR/valid-cert.pem $DIR/cert.pem