#!/bin/bash

source $HOME/.diaryNXBC/src/functions/walkFolderShowFiles.sh
source $HOME/.diaryNXBC/src/functions/fill.sh

file="${DIARY_DIR}/.tempList"
file1="${file}1"
walkFolderShowFiles "${DIARY_DIR}" > "${file}"
isExist=$?

if [ $(echo ${isExist}) -eq 1 ]; then
  sort -r -t '_' -k 2 -o "${file}" "${file}"
  head --lines=5 "${file}" > "${file}_"
  rm "${file}"
  file="${file}_"
  tempMaxWidth=0
  for str in $(cat "${file}"); do
    tempString1="$(head --lines=2 ${str})"
    tempID="$(echo "${tempString1}" | grep -E -o "\`ID: \w{8,8}\`")"
    tempID=${tempID:5:8}
    tempDate="$(echo "${tempString1}" | grep -E -o "\`Date: \d{4,4}.\d{2,2}.\d{2,2}\`")"
    tempDate=${tempDate:7:10}
    tempTitle="$(echo "${tempString1}" | grep -E -o "#### \".*\"")"
    tempTitle=${tempTitle:6:$((${#tempTitle}-7))}
    tempResult="${tempID} ${tempDate} $tempTitle"
    echo "${tempResult}" >> "${file1}"
    curWidth=$((${#tempResult}))
    [ ${tempMaxWidth} -gt ${curWidth} ] && tempMaxWidth=$curWidth
  done
  fillChar curWidth '█'; echo ''
  cat "${file1}"
  fillChar curWidth '█'; echo ''
  rm "${file}"
  rm "${file1}"
else
  echo "Records not found"
fi

