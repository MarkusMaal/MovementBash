 #
 # Map preview utility
 #
 
filename="$1"
if test -f ".c" ; then
	read character<".c"
fi
if [ "${#filename}" = "1" ]; then
	filename=""
fi
if [ "$filename" = "" ]; then
	echo "Please enter a valid map name"
fi

ascii="$2"
map=""
# 
# 1.5D dynamic map splicer
#
# This system allows for different map sizes, while still using a single
# non-nested character array (a.k.a. string). The splice size defines how
# many characters are in a full row and blocks is just the length of the
# array. The default splice size is 20, but it can be changed by the map.
# The splice size is stored on the fifth line.
#
splice="20"
blocks="100"
id="0"
while read -r line; do
    [ "$id" = "0" ] && name="$line" && map="$name"
    [ "$id" = "4" ] && splice="$line"
    id=$(($id + 1))
done < "maps/$filename"

if [ "$id" -gt "5" ]; then
	map="````````````````````````````````````````````````````````````````````````````````````````````````````"
fi
if [ "$map" = "" ]; then
	map="````````````````````````````````````````````````````````````````````````````````````````````````````"
fi
blocks="$(( ${#map}-1 ))"
for (( c=1; c<=${blocks}; c+=${splice} ))
do
	smap="${map:$(($c-1)):$splice}"
	if [ "$ascii" = "false" ]; then
		smap="${smap//#/\\u2588}"	
		smap="${smap//\`/\\u2592}"
		smap="${smap//\'/\ }"
		smap="${smap//\./\\u2591}"
		smap="${smap//\+/\\u2593}"
	fi
	printf "$smap\n"
done
exit 0
