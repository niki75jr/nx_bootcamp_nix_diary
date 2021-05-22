# $1 - key
# $2 - path to file

function getValue() {
 if [ -r $2 ] && [ $# -eq 2 ]
  then
   tempS1=$1
   temp1=$(grep -E -E "$1" $2)
   temp2=${temp1:$((${#tempS1}+1))}
   echo $temp2
   return 1
  else
   return 11
 fi
}
