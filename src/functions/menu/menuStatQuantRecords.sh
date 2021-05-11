 #!/bin/bash

source $HOME/.diaryNXBC/src/functions/getInitValues.sh

nFiles=0
function walkFolder() {
	for fileName in $1/*; do
		if [ -d "${fileName}" ]; then
			walkFolder "${fileName}"
		elif [ -f "${fileName}" ]; then
			nFiles=$((${nFiles}+1))
		fi
	done
}

walkFolder "${DIARY_DIR}"

if [ ${nFiles} -eq 0 ]; then
	echo "The \""${DIARY_DIR}"\" diary has no records"
else
	echo "The \""${DIARY_DIR}"\" diary has "${nFiles}" records"
fi
