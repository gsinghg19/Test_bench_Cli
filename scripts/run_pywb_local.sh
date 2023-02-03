#!/bin/bash
# Written by Gurpreet Singh v0.1
# 2023-01-25
echo "Spinning up Pywb Troubleshooting local..."
sleep 2

run_pywb_troubleshooting() {
    echo "Warming up Pywb Troubleshooting local..."
    sleep 1
    $cmd &
    pid=$!
    PID_LIST+=" $pid"
    cd /Users/gurpreetsingh/Desktop/github/pywb-troubleshooting
    devbox shell && make run_local &
    echo "Running Pywb Troubleshooting local..."
}

run_pywbcontentscripts() {
    echo "warming up pywb content scripts..."
    sleep 1
    $cmd &
    pid=$!
    PID_LIST+=" $pid"
    cd /Users/gurpreetsingh/Desktop/github/mw-tna-pywb-contentscripts/pywb2
    #python3 -m http.server 9000
    #python -m SimpleHTTPServer 9001
    python3 -m http.server 9001
    echo "serving content scripts..."
}

run_pywb_troubleshooting
sleep 1
run_pywbcontentscripts

trap "kill $PID_LIST" SIGINT

echo "Parallel processes have started"

wait $PID_LIST

echo "All processes have completed"
