#!/bin/bash

source $HOME/.diaryNXBC/src/functions/replace.sh
source $HOME/.diaryNXBC/src/functions/fill.sh

file="${DIARY_DIR}/.tempListEditor"
update-alternatives --list editor | sort > ${file}

count=0
countLine="$(wc -l < "${file}")"
for str in $(cat "${file}"); do
	count=$((count+1))
	replacement="$(fillGap ${countLine} $count ' ')#${count}"
	replacement="${replacement} ${str}"
	sed -i "s!${str}!${replacement}!" "${file}"
done
tempString1="---Default editor for this diary is \"${DIARY_EDITOR}\""
fillChar $((${#tempString1})) '█'; echo ''
echo "${tempString1}"
cat "${file}"
fillChar $((${#tempString1})) '█'; echo ''
while [ 1 ]; do
	read -p "$(echo -n "->: ")"
	if [ "${REPLY}" -ge 1 ] && [ "${REPLY}" -le "${countLine}" ]; then
		break
	fi
done
tempReplace=$(cat ${file} | grep --perl-regexp ${REPLY} | grep --only-matching --perl-regexp "/.*$")
rm "${file}"
echo -n "\"${DIARY_DIR}\"--->"
replace "DIARY_EDITOR" "${tempReplace}"
echo "\"${tempReplace}\""