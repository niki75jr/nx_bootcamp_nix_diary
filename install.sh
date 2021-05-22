#!/bin/bash

DIARY_DEFAULT_DIR=".diaryNXBC"

if ! [ -d "${HOME}/${DIARY_DEFAULT_DIR}" ]; then
  mkdir --parents "${HOME}/${DIARY_DEFAULT_DIR}"
  invitation="Enter the path for the diary directory (default: \"diary\"): $HOME/";
  read -p "$invitation"
  if [ "${REPLY}" ]; then
    DIARY_DIR="${HOME}/${REPLY}"
    echo "DIARY_DIR=${HOME}/${REPLY}" > "${HOME}/${DIARY_DEFAULT_DIR}/.config"
  else
    DIARY_DIR="${HOME}/diary"
    echo "DIARY_DIR=${HOME}/diary" > "${HOME}/${DIARY_DEFAULT_DIR}/.config"
  fi
  echo "DIARY_BACKUPS_DIR=${DIARY_DIR}/.backups" >> "${HOME}/${DIARY_DEFAULT_DIR}/.config"
  echo "DIARY_AUTHOR=$USER" >> "${HOME}/${DIARY_DEFAULT_DIR}/.config"
  echo "DIARY_EDITOR=/usr/bin/editor" >> "${HOME}/${DIARY_DEFAULT_DIR}/.config"
  echo "DIARY_TEMPLATE=${HOME}/.diaryNXBC/src/templates/standart.md" >> "${HOME}/${DIARY_DEFAULT_DIR}/.config"
fi

mkdir --parents "${HOME}/${DIARY_DIR}"

if [ -w "${HOME}/${DIARY_DEFAULT_DIR}" ]; then
  mkdir --parents "${HOME}/${DIARY_DEFAULT_DIR}"
  cp --recursive "./src" "${HOME}/${DIARY_DEFAULT_DIR}"
fi

if [ -z "$(cat "${HOME}/.bashrc" | grep "source \"${HOME}/.diaryNXBC/src/diary\"")" ]; then
  echo -n "source \"${HOME}/.diaryNXBC/src/diary\"" >> "${HOME}/.bashrc"
  exec bash
fi
