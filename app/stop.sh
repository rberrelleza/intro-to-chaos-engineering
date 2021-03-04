test -f /tmp/sunset.pid && pkill -F /tmp/sunset.pid
test -f /tmp/astre.pid &&  pkill -F /tmp/astre.pid
pkill -f astre.py
pkill -f sunset.py
cp valid-cert.pem cert.pem