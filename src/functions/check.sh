# $1 - pattern
# $2 - path to file

function check () {
 if [ -r $2 ] && [ $# -eq 2 ]
  then
   if [ $(grep $1 $2) ]
    then
	 return 1
	else
	 return 0
	fi
  else
   return 11
 fi
}
