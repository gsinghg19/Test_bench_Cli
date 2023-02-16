#!/bin/bash
# Written by Gurpreet Singh v0.1
# 16-02-2023
# Script to extract the url that have a 200 response code from a text file

run_code_checker() {

    if [ "$#" -ne 1 ]; then
        echo "Usage: $0 <text_file>"
        exit 1
    fi

    input_file=$1
    output_file="output.txt"

    while read line; do
        url=$(echo "$line" | cut -d ' ' -f 1)
        response=$(echo "$line" | cut -d ' ' -f 2)
        if [ "$response" -eq 200 ]; then
            echo "$url" >>"$output_file"
        fi
    done <"$input_file"
}

run_code_checker

trap "kill $PID_LIST" SIGINT

echo "Parallel processes have started"

wait $PID_LIST

echo "All processes have completed"
