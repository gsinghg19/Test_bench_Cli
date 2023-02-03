#!/bin/bash
# Written by Chris D v0.2
# 2021-06-18
# Script to do a diff on seeds for two crawls
# pass the two seed file names as arguments
# Check the names of the two seed lists have been passed
run_seeds_diff() {
    if [ -z "$2" ]; then
        echo "You need to pass the names of the two"
        echo "seed lists as arguments"
        echo "For example, ./seeds_diff.sh MW-LOC-WEEKLY-011.txt MW-LOC-WEEKLY-012.txt"
        echo "Make sure you get the file names exactly right"
        echo "Give it another try, there's a good egg"
        exit 1
    fi
    export seed_list1=$1
    export seed_list2=$2
    export date=$(date +%Y-%m-%d-%H-%M)
    export results="$seed_list1""_""$seed_list2""_""$date""_diff_results.txt"
    touch $results
    echo "Ok, so we're comparing the seed lists for"
    echo "$seed_list1 vs $seed_list2"
    echo "Super - smashing - great"
    echo "Seeds in $seed_list1 but not in $seed_list2:" >>$results
    echo "" >>$results
    awk 'FNR==NR{a[$0];next}!($0 in a)' $seed_list2 $seed_list1 | grep '# Record ID' >>$results
    echo "" >>$results
    echo "Seeds in $seed_list2 but not in $seed_list1:" >>$results
    awk 'FNR==NR{a[$0];next}!($0 in a)' $seed_list1 $seed_list2 | grep '# Record ID' >>$results
    echo "All done"
    echo "The results are saved in this directory and are called $results"
    open $results
}

run_seeds_diff

trap "kill $PID_LIST" SIGINT

echo "Parallel processes have started"

wait $PID_LIST

echo "All processes have completed"
