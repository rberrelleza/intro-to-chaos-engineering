test -f /var/run/sunset.pid && pkill -F /var/run/sunset.pid
test -f /var/run/astre.pid &&  pkill -F /var/run/astre.pid
cp valid-cert.pem cert.pem