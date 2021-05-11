 source $HOME/.diaryNXBC/src/functions/getInitValues.sh

# $1 - path to folder

function tempFunction () {
	for file_tF in "$1"/*; do
		if [ -d "${file_tF}" ]; then
			tempFunction "${file_tF}"
		elif [ -f "${file_tF}" ]; then
			echo '1' > "${fileIsExist}"
			echo "${file_tF}"
		fi
	done
	
}

function walkFolderShowFiles () {
	fileIsExist="${HOME}/.diaryNXBC/.fileIsExist"
	touch "${fileIsExist}"
	tempFunction "$1"
	result=$(cat "${fileIsExist}")
	rm "${fileIsExist}"
	return $(($result))
}
