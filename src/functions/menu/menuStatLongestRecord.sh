  #!/bin/bash

source $HOME/.diaryNXBC/src/functions/walkFolderShowFiles.sh

tempMaxLength=0
maxDate=0
function walkFolder() {
	for fileName in "$1"/*; do
		if [ -d "${fileName}" ]; then
			walkFolder "${fileName}"
		elif [ -f "${fileName}" ]; then
			curLength=$(cat "${fileName}" | wc --chars)
			if [ ${curLength} -gt ${tempMaxLength} ]; then
				tempMaxLength=${curLength}
				tempMaxFile="${fileName}"
			fi
		fi
	done
}

walkFolderShowFiles "${DIARY_DIR}" > "/dev/null"
isExist=$?

if [ $(echo ${isExist}) -eq 1 ]; then
	walkFolder "${DIARY_DIR}"
	echo "The longest file is \"${tempMaxFile}\" ($tempMaxLength symbols)"
else
	echo "Records not found"
fi
