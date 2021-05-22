#!/bin/bash

source $HOME/.diaryNXBC/src/functions/walkFolderShowFiles.sh
source $HOME/.diaryNXBC/src/functions/fill.sh

if [ -d "${DIARY_DIR}/.trash" ]; then
  file="${DIARY_DIR}/.tempRemoveList"
  walkFolderShowFiles "${DIARY_DIR}/.trash" > "${file}"
  sort -t '_' -k 2 -o "${file}" "${file}"
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
  moving=$(cat "${file}" | grep -E "#${REPLY}\s${DIARY_DIR}" | grep -o "${DIARY_DIR}.*$")
  tempYear=$(echo "${moving}" | grep -E -o "/\w{8,8}__\d{4,4}-\d{2,2}")
  tempMonth=${tempYear:16:2}
  tempYear=${tempYear:11:4}
  mkdir --parents "${DIARY_DIR}/${tempYear}/${tempMonth}"
  mv "${moving}" "${DIARY_DIR}/${tempYear}/${tempMonth}"
  echo "Record \""${moving}"\" was restored"
  rm "${file}"
else
  echo "No deleted records"
fi
