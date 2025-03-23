#!/bin/bash

#parse arguments

while [ "$#" -gt 0 ]; do
  case "$1" in
    -f) folder="$2"; shift 2 ;;
    -o) output="$2"; shift 2 ;;
    -file) file_pattern="$2"; shift 2 ;;
    *) break ;;
  esac
done
#create term args
terms=();
if [ "$#" -gt 0 ]; then
    terms=("$@")
fi

# Output the values for testing purposes
#echo "Folder: $folder"
#echo "Output: $output"
#echo "File pattern: $file_pattern"
#echo "Search terms: ${terms[@]}"

grepflag="file"
#set up grep flags
if [ "$output" == "content" ]; then
    grepflag="-i -B 5 -A 5"
elif [ "$output" == "file" ]; then
    grepflag="-Hil"
else 
    echo "Improper -o option, [file|content]"
    grepflag="-Hil"
fi
to_grep=""
for term in "${terms[@]}"; do
    to_grep+=" | xargs -I {} grep $grepflag \"$term\" {}"

done
execute="find -L \"$folder\" -name \"$file_pattern\" -print $to_grep"
#echo "Executing: $execute"
eval "$execute"