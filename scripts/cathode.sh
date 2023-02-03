#!/bin/bash
# Written by Gurpreet Singh v0.1
# 2022-08-10
echo "spinning up local Cathode...."
sleep 2
i=1
sp="/-\|"
echo -n ' '
while true; do
    printf "\b${sp:i++%${#sp}:1}"
    sleep 0.1
done &
run_Cathode() {
    echo "warming up Cathode..."
    sleep 1
    $cmd &
    pid=$!
    PID_LIST+=" $pid"
    cd /Users/gurpreetsingh/Desktop/github/cathode/cmd/
    source .env && aws-vault exec mw-core-dev -- go run . &
    echo "running Cathode..."
}

run_Cathode
sleep 1

trap "kill $PID_LIST" SIGINT

echo "Parallel processes have started"

wait $PID_LIST

#kill -TERM -PID

#kill -KILL -PID

echo "All processes have completed"
