#!/bin/sh
RESPONSE_CODE=""
printf 'Waiting for Backend\n'
while [ -z "$RESPONSE_CODE" ]
do
    RESPONSE_CODE=$(curl -s -I http://wp:80 | grep HTTP | awk {'print $2'})
    sleep 2
done
printf 'Backend ready. Starting Varnish\n'
varnishd -s malloc,250M -a 0.0.0.0:80 -b wp:80

while true
do
    :
done

