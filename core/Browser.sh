declare -a maps_array
for a in $(ls -1 $1); do
	maps_array+=("${a}")
done
min_id="1"
new="$2"
select="-1"
while true; do
	clear
	echo
	[[ "$1" == */* ]] && echo "Available templates"
	[[ "$1" == */* ]] || echo "Available $1"
	echo
	id=1
	for i in "${maps_array[@]}"; do
		[ "$id" -gt "$(($min_id-1))" ] && [ "$id" -lt "$(($min_id+9))" ] && echo "[$(($id-$min_id+1))] $id. $i"
		id="$(($id+1))"
	done
	echo
	[ "$min_id" -lt "$((${#maps_array[@]}-8))" ] && echo "[N] Next page"
	[ "$min_id" -gt "1" ] && echo "[P] Previous page"
	echo "[U] From URL"
	echo "[E] Return to previous menu"
	[ "$new" == "1" ] && echo "[C] Create new ${1/s/}"
	echo
	read -rsn1 -p "Press a number or a letter to continue: " ans
	[ "$ans" == "1" ] && select="$(($min_id-1))" && break
	[ "$ans" == "2" ] && select="$min_id" && break
	[ "$ans" == "3" ] && select="$(($min_id+1))" && break
	[ "$ans" == "4" ] && select="$(($min_id+2))" && break
	[ "$ans" == "5" ] && select="$(($min_id+3))" && break
	[ "$ans" == "6" ] && select="$(($min_id+4))" && break
	[ "$ans" == "7" ] && select="$(($min_id+5))" && break
	[ "$ans" == "8" ] && select="$(($min_id+6))" && break
	[ "$ans" == "9" ] && select="$(($min_id+7))" && break
	[ "$min_id" -lt "$((${#maps_array[@]}-8))" ] && [ "$ans" == "n" ] && min_id=$(($min_id+9))
	[ "$min_id" -gt "1" ] && [ "$ans" == "p" ] && min_id=$(($min_id-9))
	[ "$ans" == "e" ] && break
	filename=""
	[ "$ans" == "u" ] && clear && read -p "Enter map name: " filename && echo "$filename" > .m && clear && exit 0
	[ "$new" == "1" ] && [ "$ans" == "c" ] && clear && read -p "Enter the new map name: " filename && echo "$filename" > .m && clear && exit 0
done
clear
echo "Preparing to load ${1/s/}..."
ans=""
[ "$select" -gt "-1" ] && echo "${maps_array[$select]}" > .m
