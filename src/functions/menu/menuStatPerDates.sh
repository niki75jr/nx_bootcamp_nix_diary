#!/bin/bash

source $HOME/.diaryNXBC/src/functions/walkFolderShowFiles.sh
source $HOME/.diaryNXBC/src/functions/fill.sh

function extractDates() {
  for file_eD in "$1"/*; do
    if [ -d "${file_eD}" ]; then
      extractDates "${file_eD}"
    elif [ -f "${file_eD}" ]; then
      DATE="$(echo ${file_eD} | grep -E -E -o "/\w{8,8}__\d{4,4}-\d{2,2}")"
      DATE=${DATE:11:7}
      [ ${DATE} ] && echo "${DATE}" >> "${file1}"
    fi
  done
}

function countPerDate () {
  tempYEAR=0
  tempSTRING1="Records in the \"${DIARY_DIR}\" diary for:"

  fillChar ${#tempSTRING1} '█'; echo ''
  echo "${tempSTRING1}"
  for i in ${!arrDATE[@]}; do
    curYEAR=${arrDATE[$i]:0:4}
    [ ${tempYEAR} != ${curYEAR} ] && 
    { 
      echo -n "┌─────$curYEAR: "
      echo -n "$(cat ${file} | grep -E -E "\w{8,8}__${curYEAR}-" | wc -l) "
      echo "records"
    }
    tempYEAR=${curYEAR}
    curMONTH=${arrDATE[$i]:5:2}
    case ${curMONTH:1} in
      1)
        tempENDING="'st"
        ;;
      2)
        tempENDING="'nd"
        ;;
      3)
        tempENDING="'rd"
        ;;
      *)
        tempENDING="'th"
        ;;
    esac
    echo -n "├─>${curMONTH}${tempENDING} month: "
    echo -n "$(cat ${file} | grep -E -E "\w{8,8}__${curYEAR}-${curMONTH}" | wc -l) "
    echo ;
  done
  fillChar ${#tempSTRING1} '█'; echo ''
}

file="${DIARY_DIR}/.tempList"
file1="${DIARY_DIR}/.tempDate"

walkFolderShowFiles "${DIARY_DIR}" > "${file}"
isExist=$?

if [ $(echo ${isExist}) -eq 1 ]; then
  extractDates "${DIARY_DIR}"
  arrDATE=($(cat "${file1}" | sort -u -r))
  countPerDate
else
  echo "Records not found"
fi

[ -w "${file}" ] && rm "${file}"
[ -w "${file1}" ] && rm "${file1}"
