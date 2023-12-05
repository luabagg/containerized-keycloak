#!/bin/bash

# Copied from https://stackoverflow.com/questions/75693830/keycloak-v21-docker-container-health-check-failing

exec 3<>/dev/tcp/localhost/8080

echo -e "GET /health/ready HTTP/1.1\nhost: localhost:8080\n" >&3

timeout --preserve-status 1 cat <&3 | grep -m 1 status | grep -m 1 UP
ERROR=$?

exec 3<&-
exec 3>&-

exit $ERROR