function generateID() {
	if [ $# -ne 1 ]; then
		length=8
	else
		if [ $1 -ge 1 ] && [ $1 -le 40 ]; then
			length=$1
		else
			length=8
 		fi
	fi
	sec=$(date +'%s')
	nSec=$(date +'%N')
	sum=$(echo "$sec$nSec" | sha1sum)
	sum=${sum:0:${length}}
	echo $sum
}
