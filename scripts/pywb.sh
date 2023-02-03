#!/bin/bash
# Written by Gurpreet Singh v0.1
# 2022-08-10
echo "spinning up local Go Playback..."
sleep 2
i=1
sp="/-\|"
echo -n ' '
while true; do
    printf "\b${sp:i++%${#sp}:1}"
    sleep 0.1
done &
run_pywb() {
    echo "warming up pywb..."
    sleep 1
    $cmd &
    pid=$!
    PID_LIST+=" $pid"
    cd /Users/gurpreetsingh/pywb
    source venv/bin/activate
    aws-vault exec tna-ukgwa -- ./run-gunicorn.sh
    echo "running pywb..."
}

run_pywbcontentscripts() {
    echo "warming up pywb content scripts..."
    sleep 1
    $cmd &
    pid=$!
    PID_LIST+=" $pid"
    cd /Users/gurpreetsingh/Desktop/github/mw-tna-pywb-contentscripts/pywb2
    python3 -m http.server 9000
    #python -m SimpleHTTPServer 9001
    echo "serving content scripts..."
}

run_pywb
sleep 1
run_pywbcontentscripts

trap "kill $PID_LIST" SIGINT

echo "Parallel processes have started"

wait $PID_LIST

echo "All processes have completed"
