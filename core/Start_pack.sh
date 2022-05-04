#
# Movement Bash
#
# This file is a map pack loader. Map packs
# are like playlists, but for movement bash
# maps.
#
# * Opening a map pack*
#
# The first argument is the name of the map, so e.g.
# "./Start_pack.sh pack1" loads a map pack named "pack1".
# Starting the game without a map pack name specified will still work,
# but you'll be prompted to enter a map pack name.
#

packname="$1"
if [ "${#packname}" = "1" ]; then
	packname=""
fi
declare -a map_array
if [ "$packname" = "" ]; then
    clear
    core/Browser.sh packs
    [ -f ".m" ] && read packname < .m
    [ -f ".m" ] || exit 0
    rm .m
fi

id=0
while read -r line; do
	e=$(echo "$line" | cut -c1-1)
	if [ "$e" != ";" ]; then
		if [ "$e" != "" ]; then
			map_array[$id]="$line"
			id=$(($id+1))
		fi
	fi
done < "packs/$packname"

for i in "${map_array[@]}"; do
	[ -f "maps/$i" ] || continue
	echo "$i">.m
	core/Start_map.sh
	rm .m
done

while read -r line; do ascii="$line"; done < <(sed -n '5,5p' ".config")
clear
echo
core/Preview_map.sh ${map_array[-1]} $ascii
echo -e "\e[39m\nMap pack finished"
read -rsn1 -p "Press any key to continue. . . "
echo -e "\n"


