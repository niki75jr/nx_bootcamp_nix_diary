#!/bin/bash

source $HOME/.diaryNXBC/src/functions/walkFolderShowFiles.sh
source $HOME/.diaryNXBC/src/functions/fill.sh

file="${DIARY_DIR}/.tempListBackup"
walkFolderShowFiles "${DIARY_BACKUPS_DIR}" > "${file}"
isExist=$?

if [ $(echo ${isExist}) -eq 1 ]; then
  sort -o "${file}1" -r "${file}"
  rm "${file}"
  mv "${file}1" "${file}"
  count=0
  countLine="$(wc -l < "${file}")"
  for str in $(cat "${file}"); do
    count=$((count+1))
    replacement="$(fillGap ${countLine} $count ' ')#${count}"
    replacement="${replacement} ${str}"
    sed -i "s!${str}!${replacement}!" "${file}"
  done
  tempWidth=${#replacement}
  fillChar ${tempWidth} '█'; echo ''
  cat "${file}"
  fillChar ${tempWidth} '█'; echo ''

  while [ 1 ]; do
  read -p "$(echo "->: ")"
  if [ ${REPLY} -ge 1 ] && [ ${REPLY} -le ${count} ]; then
    break
  fi
  done
  tempResult="$(cat ${file} | grep -E -E -o "#${REPLY}\s${DIARY_BACKUPS_DIR}.*$")"
  tempResult="$(echo ${tempResult} | grep -E -E -o "${DIARY_BACKUPS_DIR}.*$")"
  mkdir -p "${DIARY_BACKUPS_DIR}/a1"
  tar --directory="${DIARY_DIR}" -xf "${tempResult}"
else
  echo "Records not found"
fi
rm "${file}"
