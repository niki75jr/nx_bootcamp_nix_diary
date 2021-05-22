#!/bin/bash

source $HOME/.diaryNXBC/src/functions/walkFolderShowFiles.sh
source $HOME/.diaryNXBC/src/functions/fill.sh

file="${HOME}/.diaryNXBC/.tempList"
walkFolderShowFiles "${DIARY_DIR}" > "${file}"
isExist=$?
sort -r -t '_' -k 2 -o "${file}" "${file}"

if [ $(echo ${isExist}) -eq 1 ]; then
  count=0
  maxWidth=0
  countLine="$(wc -l < "${file}")"
  for str in $(cat "${file}"); do
    count=$((count+1))
    replacement="$(fillGap ${countLine} $count ' ')#${count}"
    replacement="${replacement} ${str}"
    sed -i "s!${str}!${replacement}!" "${file}"
  done
  fillChar $((${#str}+${#count}+2)) '█'; echo ''
  cat "${file}"
  fillChar $((${#str}+${#count}+2)) '█'; echo ''
else
  echo "Records not found"
fi
rm "${file}"
