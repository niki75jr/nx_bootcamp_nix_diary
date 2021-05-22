#!/bin/bash

source $HOME/.diaryNXBC/src/functions/getInitValues.sh
source $HOME/.diaryNXBC/src/functions/getDates.sh
source $HOME/.diaryNXBC/src/functions/generateID.sh

getDates

function createRecord() {
  mkdir --parents "${DIARY_DIR}/.tempNewRec"
  ID=$(generateID)
  tempFileName="${DIARY_DIR}/.tempNewRec/.newRecord"
  touch "${tempFileName}"
  cat "${DIARY_TEMPLATE}" > "${tempFileName}"
  sed -i "s/_date/$(date +'%F')/" "${tempFileName}"
  sed -i "s/_id/${ID}/" "${tempFileName}"
  sed -i "s/_author/${DIARY_AUTHOR}/" "${tempFileName}"
  $DIARY_EDITOR "${tempFileName}"
  #
  fNameDate="$(grep -E -o  '\d{4,4}-\d{2,2}-\d{2,2}' "${tempFileName}")"
  fNameYear=${fNameDate:0:4}
  fNameMonth=${fNameDate:5:2}
  fNameDay=${fNameDate:8:2}
  #
  fNameID=$"(grep -E -o '\`ID: \w{8,8}\`')"
  fNameID="${fNameID:5:8}"
  #
  fName="${ID}__${fNameYear}-${fNameMonth}-${fNameDay}_${HOUR}-${MIN}.md"
  fullPath="${DIARY_DIR}/${fNameYear}/${fNameMonth}"
  mkdir --parents "${fullPath}"
  mv "${tempFileName}" "${fullPath}/${fName}"
  rm -r -f "${DIARY_DIR}/.tempNewRec"
}

createRecord
