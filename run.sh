#!/bin/bash
project="sclera"
if !([ -d $project ]); then
  echo "Project directory doesn't exist!"
  exit
fi

cd $project
options=()
tab=""
for file in *; do
    [[ -d $file ]] && continue # not a file
    [[ ! -x "$file" ]] && continue # not executable
    options+=($tab --title="$file"  -e "bash -ic \"nice -n 3 ./$file ; bash\"" ) 
    tab="--tab"
done

xfce4-terminal "${options[@]}"

