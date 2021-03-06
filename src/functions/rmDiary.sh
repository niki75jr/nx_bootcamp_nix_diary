function rmDiary () {
  if [ -d "${HOME}/.diaryNXBC" ]; then
    source "${HOME}/.diaryNXBC/src/functions/getInitValues.sh"
  	if [ $# -ne 0 ]; then
  		if [ $1 = '-f' ] || [ $1 = '--full' ]; then
    		if [ -d "${DIARY_DIR}" ]; then
      		rm --recursive "${DIARY_DIR}"
     			if ! [ -d $"{DIARY_DIR}" ]; then
    				echo "\"${DIARY_DIR}\" removed"
  				fi
    		fi	
   		fi
  	fi
    if [ -n "$(cat "${HOME}/.bashrc" | grep "source \"${HOME}/.diaryNXBC/src/diary\"")" ]; then
      sed -i "s@source \"${HOME}/.diaryNXBC/src/diary\"@@" "${HOME}/.bashrc"
      tempBool1="true"
    fi
      rm --recursive "${HOME}/.diaryNXBC"
      if ! [ -d "${HOME}/.diaryNXBC" ]; then
        echo "\"${HOME}/.diaryNXBC\" removed"
        [ "${tempBool1}" ] && exec bash
      fi
  else
    echo "\"${HOME}/.diaryNXBC\" does not exist"
  fi
}
