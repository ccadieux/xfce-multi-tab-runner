#!/bin/bash
cd "test/"

echo "options"
options=()
echo "tab"
tab=""
for file in *; do
    [[ -d $file ]] && continue # not a file
    [[ ! -x "$file" ]] && continue # not executable
    options+=($tab --title="$file"  -e "bash -ic \"nice -n 3 ./$file ; bash\"" ) 
    tab="--tab"
done

xfce4-terminal "${options[@]}"

