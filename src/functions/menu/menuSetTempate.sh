#!/bin/bash

source $HOME/.diaryNXBC/src/functions/replace.sh
source $HOME/.diaryNXBC/src/functions/fill.sh
source $HOME/.diaryNXBC/src/functions/walkFolderShowFiles.sh

file="${DIARY_DIR}/.tempListTemplate"
walkFolderShowFiles "${HOME}/.diaryNXBC/src/templates" | sort -r > ${file}

count=0
tempMaxWidth=0
countLine="$(wc -l < "${file}")"
for str in $(cat "${file}"); do
	count=$((count+1))
	replacement="$(fillGap ${countLine} $count ' ')#${count}"
	replacement="${replacement} ${str}"
	sed -i "s!${str}!${replacement}!" "${file}"
	curWidth=$((${#replacement}))
	[ ${tempMaxWidth} -gt ${curWidth} ] && tempMaxWidth=$curWidth
done
tempString1="---Default editor for this diary is \"${DIARY_TEMPLATE}\""
fillChar "${#tempString1}" '█'; echo ''
echo "${tempString1}"
cat "${file}"
fillChar "${#tempString1}" '█'; echo ''
while [ 1 ]; do
	read -p "$(echo -n ">: ")"
	if [ ${REPLY} -ge 1 ] && [ ${REPLY} -le ${count} ]; then
		break
	fi
done
tempReplace=$(cat ${file} | grep -E -E ${REPLY} | grep -o "/.*$")
rm "${file}"
echo -n "\"${DIARY_TEMPLATE}\"--->"
replace "DIARY_TEMPLATE" "${tempReplace}"
echo "\"${tempReplace}\""
