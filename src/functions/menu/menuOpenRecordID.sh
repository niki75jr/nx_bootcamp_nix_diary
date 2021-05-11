#!/bin/bash

source $HOME/.diaryNXBC/src/functions/walkFolderShowFiles.sh

file="${DIARY_DIR}/.tempListID"
walkFolderShowFiles "${DIARY_DIR}" > "${file}"
isExist=$?

if [ $(echo ${isExist}) -eq 1 ]; then
	read -p "$(echo -e "->: ID=")"
	temp1=$(cat "${file}" | grep --only-matching --perl-regexp "${DIARY_DIR}/\d*/\d*/${REPLY}.*\.md")
	echo "temp1: ${temp1}"
	echo "tem"
	if [ "${temp1}" ]; then
		$DIARY_EDITOR "${temp1}"
	else
		echo "Record with ID \"${REPLY}\" does not existing"
	fi
else
	echo "Records not found"
fi
rm "${file}"
