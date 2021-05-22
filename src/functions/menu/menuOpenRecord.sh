#!/bin/bash

source $HOME/.diaryNXBC/src/functions/walkFolderShowFiles.sh
source $HOME/.diaryNXBC/src/functions/fill.sh

file="${DIARY_DIR}/.tempList"
walkFolderShowFiles "${DIARY_DIR}" > "${file}"
isExist=$?
sort -r -t '_' -k 2 -o "${file}" "${file}"

if [ $(echo ${isExist}) -eq 1 ]; then
  count=0
  maxWidth=0
  for str in $(cat "${file}"); do
    count=$((count+1))
    temp1="$(wc -l < "${file}")"
    sed -i "s!"${str}"!$(fillGap $temp1 $count ' ')#"${count}" "${str}"!" "${file}"
  done
  fillChar $((${#str}+${#count}+2)) '█'; echo ''
  cat "${file}"
  fillChar $((${#str}+${#count}+2)) '█'; echo ''
  read -p "$(echo -e "->: ")"
  while [ ${REPLY} -lt 1 ] || [ ${REPLY} -gt ${count} ]; do
    read -p "$(echo -e "->: ")"
  done
  temp2=$(cat "${file}" | grep -E "^\s*#${REPLY}\s" | grep -o "${DIARY_DIR}.*$")
  $DIARY_EDITOR "${temp2}"
else
  echo "Records not found"
fi
rm "${file}"
