#!/bin/bash

source $HOME/.diaryNXBC/src/functions/getInitValues.sh
source $HOME/.diaryNXBC/src/functions/getDates.sh
source $HOME/.diaryNXBC/src/functions/getValue.sh
source $HOME/.diaryNXBC/src/functions/generateID.sh

getDates

function createRecord() {
	path="${DIARY_DIR}/${YEAR}/${MONTH}"
	mkdir --parents $path
	ID=$(generateID)
	fileName="${ID}__${YEAR}-${MONTH}-${DAY}_${HOUR}-${MIN}.md"
	touch "${path}/${fileName}"
	cat "${DIARY_TEMPLATE}" > "${path}/${fileName}"
	sed -i "s/_date/$(date +'%F')/" "${path}/${fileName}"
	sed -i "s/_id/${ID}/" "$path/$fileName"
	sed -i "s/_author/${DIARY_AUTHOR}/" "${path}/${fileName}"
	$DIARY_EDITOR "${path}/${fileName}"
}

createRecord
