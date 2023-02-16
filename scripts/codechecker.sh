#!/bin/bash
​
if [[ ${#} -lt 2 ]]; then
    echo Invalid number of arguments
    echo Usage:
    echo "${0} [url-list] [crawl-log]"
    exit 1
fi
​
for i in $(cat ${1}); do
    awk -v url="${i}" '$4 == url {print $2,$4}' $2 >>${2}-responses.txt
done
​
echo "File created in current directory:"
echo "${2}-responses.txt"

### Usage:
## ./response-code-check.sh [url-list] [crawl-log] ##
