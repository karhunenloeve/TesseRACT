#!/bin/bash
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

predictions=`jq '.predictionFiles' config.json | xargs -n 1`
results=`jq '.resultFiles' config.json | xargs -n 1`
createTXT=`jq '.createTXT' config.json | xargs -n 1`
createPDF=`jq '.createPDF' config.json | xargs -n 1`
deleteIMG=`jq '.deleteIMG' config.json | xargs -n 1`

for filename in $(find $results -name '*.jpeg' -or -name '*.png'); do
  if $createPDF; then
    tesseract $dir/$filename $dir/${filename%.*} -l deu+eng pdf
  fi

  if $createTXT; then
    tesseract $dir/$filename $dir/${filename%.*} -l deu+eng
  fi

  if $deleteIMG; then
    rm -f $dir/$filename
  fi
done
