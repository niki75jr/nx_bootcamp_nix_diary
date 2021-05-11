source ${HOME}/.diaryNXBC/src/functions/getValue.sh

DIARY_DIR=$(getValue "DIARY_DIR" "${HOME}/.diaryNXBC/.config")
DIARY_AUTHOR=$(getValue "DIARY_AUTHOR" ${HOME}/.diaryNXBC/.config)
DIARY_EDITOR=$(getValue "DIARY_EDITOR" ${HOME}/.diaryNXBC/.config)
DIARY_TEMPLATE=$(getValue "DIARY_TEMPLATE" ${HOME}/.diaryNXBC/.config)
DIARY_BACKUPS_DIR=$(getValue "DIARY_BACKUPS_DIR" ${HOME}/.diaryNXBC/.config)
