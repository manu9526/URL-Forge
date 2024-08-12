#!/bin/bash

# color codes
red='\033[0;31m'
green='\033[0;32m'
blue='\033[0;34m'
nc='\033[0m' #no color
bold='\033[1m'

if [ "$#" -ne 2 ]; then
	echo "Usage: $0 <URL> <file_path>"
	exit 1
fi

url=$1
file=$2

if [[ ! "$url" =~ ^https?:// ]]; then
	echo "$red $bold ERROR:$nc Enter a valid URL"
	exit 1
fi

if [ ! -f "$file" ]; then
	echo "$red $bold ERROR: $nc File not Found: $file"
	exit 1
fi

out="url_out.txt" > "$out"

while IFS= read -r line; do
	line=$(echo "$line" | xargs)

	[ -z "$line" ] && continue


