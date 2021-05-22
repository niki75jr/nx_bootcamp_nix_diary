  #!/bin/bash

source $HOME/.diaryNXBC/src/functions/walkFolderShowFiles.sh

function compareStrDate () {
	echo -e "$1"'\n'"$2" | sort -r | head -n 1
}

maxDate=0
function walkFolder() {
	for fileName in "$1"/*; do
		if [ -d "${fileName}" ]; then
			walkFolder "${fileName}"
		elif [ -f "${fileName}" ]; then
			str=$(echo "${fileName}" | grep -E -E -o "\d*-\d*-\d*_\d*-\d*")
			maxDate=$(compareStrDate ${maxDate} ${str})
		fi
	done
}

file="${DIARY_DIR}/.tempList"
walkFolderShowFiles "${DIARY_DIR}" > "${file}"
isExist=$?

if [ $(echo ${isExist}) -eq 1 ]; then
	walkFolder "${DIARY_DIR}"
	echo -n "The last record was created: ${maxDate} \"("
	echo "$(grep -E -E -o "/home.*${maxDate}\.md" ${file}))\""
else
	echo "Records not found"
fi
rm "${file}"
