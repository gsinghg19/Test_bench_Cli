#!/bin/bash
# Written by Gurpreet Singh v0.1
# 2022-08-10
echo "spinning up local Go Playback..."
sleep 2

run_ui() {
    echo "warming up api..."
    sleep 1
    $cmd &
    pid=$!
    PID_LIST+=" $pid"
    cd /Users/gurpreetsingh/Desktop/github/go-replay-ui/
    source .env && yarn dev &
    echo "running api..."
}

run_api() {
    echo "warming up ui..."
    sleep 1
    $cmd &
    pid=$!
    PID_LIST+=" $pid"
    cd /Users/gurpreetsingh/Desktop/github/go-replay-api/
    source .env
    cd cmd
    aws-vault exec mw-client-data-live -- go run . &
    echo "running ui..."
}

run_contentscripts() {
    echo "warming up content scripts..."
    sleep 1
    $cmd &
    pid=$!
    PID_LIST+=" $pid"
    cd /Users/gurpreetsingh/Desktop/github/content-scripts/mw-client-live-contentscripts/
    python3 -m http.server 9001
    #python -m SimpleHTTPServer 9001
    echo "serving content scripts..."
}

run_ui
sleep 1
run_contentscripts
sleep 1
run_api

trap "kill $PID_LIST" SIGINT

echo "Parallel processes have started"

wait $PID_LIST

echo "All processes have completed"
