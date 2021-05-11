source $HOME/.diaryNXBC/src/functions/getInitValues.sh

# $1 - key (value)
# $2 - replacement

function replace () {
	tempPattern="$1=$(eval echo '$'{$1})"
	tempReplacement="$1=$2"
	sed -i "s!${tempPattern}!${tempReplacement}!" "${HOME}/.diaryNXBC/.config"
}
