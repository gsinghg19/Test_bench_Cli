#!/bin/bash
# Written by Gurpreet Singh v0.1
# 2022-08-10
echo "spinning up local neodelorian..."
sleep 2
i=1
sp="/-\|"
echo -n ' '
while true; do
    printf "\b${sp:i++%${#sp}:1}"
    sleep 0.1
done &
run_neo() {
    echo "warming up neodelorian..."
    sleep 1
    $cmd &
    pid=$!
    PID_LIST+=" $pid"
    cd /Users/gurpreetsingh/Desktop/github/neodelorian/
    make run_app &
    echo "Running neodelorian..."
}

run_neo
sleep 1

trap "kill $PID_LIST" SIGINT

echo "Parallel processes have started"

wait $PID_LIST

echo "All processes have completed"
