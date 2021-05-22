#!/bin/bash

if [ "${UBUNTU}" != 'false' ]; then
  source $HOME/.diaryNXBC/src/functions/replace.sh

  echo "---Default directory for this diary is \"${DIARY_DIR}\""
  echo -n "new default: "
  read -p "$(echo -n "->: ${HOME}/")"
  echo -n "\"${DIARY_DIR}\"--->"
  replace "DIARY_DIR" "${HOME}/${REPLY}"
  replace "DIARY_BACKUPS_DIR" "${HOME}/${REPLY}/.backups"
  mkdir --parents "${HOME}/${REPLY}"
  echo "\"${HOME}/${REPLY}\""
else
  echo 'Sorry, but this function is not available for this version of Linux.'
fi
