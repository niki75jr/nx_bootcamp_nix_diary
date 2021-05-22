#!/bin/bash

DIARY_DEFAULT_DIR=".diaryNXBC"

if ! [ -d "${HOME}/${DIARY_DEFAULT_DIR}" ]; then
  mkdir --parents "${HOME}/${DIARY_DEFAULT_DIR}"
  if [ "${DIARY_DIR}" ]; then
    echo "DIARY_DIR=${DIARY_DIR}" > "${HOME}/${DIARY_DEFAULT_DIR}/.config"
  else
    DIARY_DIR="${HOME}/diary"
    echo "DIARY_DIR=${HOME}/diary" > "${HOME}/${DIARY_DEFAULT_DIR}/.config"
  fi
  echo "DIARY_BACKUPS_DIR=${DIARY_DIR}/.backups" >> "${HOME}/${DIARY_DEFAULT_DIR}/.config"
  echo "DIARY_AUTHOR=${DIARY_AUTHOR}" >> "${HOME}/${DIARY_DEFAULT_DIR}/.config"
  echo "DIARY_EDITOR=${DIARY_EDITOR}" >> "${HOME}/${DIARY_DEFAULT_DIR}/.config"
  echo "DIARY_TEMPLATE=${HOME}/.diaryNXBC/src/templates/standart.md" >> "${HOME}/${DIARY_DEFAULT_DIR}/.config"
fi

mkdir --parents "${DIARY_DIR}"

if [ -w "${HOME}/${DIARY_DEFAULT_DIR}" ]; then
  mkdir --parents "${HOME}/${DIARY_DEFAULT_DIR}/"
  cp -r "/root/.diarysrc/src" "${HOME}/${DIARY_DEFAULT_DIR}"
fi
