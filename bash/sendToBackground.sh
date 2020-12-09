#!/bin/bash
while true; do echo '1'; sleep 2; done &
#nohup $cmd &
cmdpid=$!
sleep 5
echo "killing bg: ${cmdpid}"
kill ${cmdpid}
