function fillGap () {
	a=$1
	b=$2
	for((i=0; i<$((${#a}-${#b})); i++)); do
		echo "$3"
	done
}

function fillChar () {
	for((i=0; i<$1; i++)); do
		echo -n $2
	done
}