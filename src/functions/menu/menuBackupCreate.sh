#!/bin/bash

source $HOME/.diaryNXBC/src/functions/walkFolderShowFiles.sh
source $HOME/.diaryNXBC/src/functions/getDates.sh

walkFolderShowFiles "${DIARY_DIR}" > "/dev/null"
isExist=$?

if [ $(echo ${isExist}) -eq 1 ]; then
	getDates
	tempFileName="backup_${YEAR}-${MONTH}-${DAY}_${HOUR}-${MIN}-${SEC}"
	tempOldPWD="${PWD}"
	mkdir --parents "${DIARY_BACKUPS_DIR}"
	cd "${DIARY_DIR}"
	tar --exclude='.trash' --exclude='.backups' -czf "${DIARY_BACKUPS_DIR}/${tempFileName}.tar.gz" "."
	cd "${tempOldPWD}"
	echo "\"${tempFileName}\" created"
else
	echo "Records not found"
fi
