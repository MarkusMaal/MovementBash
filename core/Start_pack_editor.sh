#!/bin/bash
#
# Movement Bash Map Pack editor
#
# This editor allows you to make map packs
#

packname="$1"
select=-1
min_id=1

while read -r line; do author="$line"; done < <(sed -n '1,1p' ".config")
# Asks the user for the name of the pack if not specified
if [ "$packname" = "" ]; then
	core/Browser.sh packs 1
	[ -f ".m" ] && read packname < .m
	[ -f ".m" ] || exit 0
	rm .m
fi
declare -a maps_array
while read -r line; do
	e=$(echo "$line" | cut -c1-1)
	[ "$e" != ";" ] && [ "$e" != "" ] && maps_array+=("$line")
done < "packs/$packname"
# Opens the map pack file

Preview() {
	clear
	echo
	echo "${maps_array[$select]} (Unicode mode)"
	echo
	core/Preview_map.sh ${maps_array[$select]} false
	echo
	read -rsn1 -p "Press any key to continue . . . "
	clear
	echo
	echo "${maps_array[$select]} (ASCII mode)"
	echo
	core/Preview_map.sh ${maps_array[$select]} true
	echo
	read -rsn1 -p "Press any key to continue . . . "
}

Add() {
    clear
	core/Browser.sh maps
	[ -f ".m" ] && read mapname < .m
	[ -f ".m" ] || return
	rm .m
    maps_array+=("$mapname")
    mapname=""
}

Change() {
    clear
	core/Browser.sh maps
	[ -f ".m" ] && read mapname < .m
	[ -f ".m" ] || return
	rm .m
	new_array=()
	for value in "${maps_array[@]}"
	do
		[[ $value != $1 ]] && new_array+=($value)
		[[ $value == $1 ]] && new_array+=($mapname)
	done
	maps_array=("${new_array[@]}")
	unset new_array
    mapname=""
}

Delete() {
	new_array=()
	for value in "${maps_array[@]}"
	do
		[[ $value != $1 ]] && new_array+=($value)
	done
	maps_array=("${new_array[@]}")
	unset new_array
	select=-1
}

Swap() {
	backup="$1"
	Map_List
	swapwith="${maps_array[$select]}"
	new_array=()
	for value in "${maps_array[@]}"
	do
		[[ $value == $backup ]] && new_array+=($swapwith) && continue
		[[ $value == $swapwith ]] && new_array+=($backup) && continue
		new_array+=($value)
	done
	maps_array=("${new_array[@]}")
	unset new_array
}

Map_List() {
	while true; do
		clear
		echo
		echo "Maps in map pack"
		echo
		id=1
		for i in "${maps_array[@]}"; do
			[ "$id" -gt "$(($min_id-1))" ] && [ "$id" -lt "$(($min_id+9))" ] && echo "$(($id-$min_id+1)). $i (ID: $id)"
			id="$(($id+1))"
		done
		echo
		[ "$min_id" -lt "$((${#maps_array[@]}-8))" ] && echo "N - Next page"
		[ "$min_id" -gt "1" ] && echo "P - Previous page"
		echo "E - Return to previous menu"
		echo
		read -rsn1 -p "Enter a valid number: " ans
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
	done
	ans=""
}

Save() {
	if [ "$author" = "Developer" ]; then
		clear
		echo
		echo "Developer mode"
		echo
		echo "Cannot save map packs in developer mode"
		echo
		read -rsn1 -p "Press any key to continue . . . "
		return
	fi
	echo "Saving header info..."
	echo ";Movement Bash Map Pack" > packs/$packname
	echo "Saving map names..."
	for map in "${maps_array[@]}";
	do
		echo "$map" >> packs/$packname
	done
	echo "Map pack saved"
	read -rsn1 -p "Press any key to continue . . . "
}

Check() {
	clear
	echo
	echo "Map pack checker"
	echo
	for map in "${maps_array[@]}";
	do
		exist="false"
		[[ -f "maps/${map}" ]] && exist="true" 
		[[ -f "maps/${map}" ]] || echo -e "[\e[31mFAIL\e[37m] $map does not exist!!!"
		[[ -f "ifchecks/${map}_ifcheck.sh" ]] || echo -e "[\e[33mWARN\e[37m] Ifcheck not found for $map" || exist="false"
		[ "$exist" = "true" ] && echo -e "[ \e[32mOK\e[37m ] $map is a valid map"
	done
	echo
	read -rsn1 -p "Press any key to continue . . . "
}

while true; do
	clear
	echo -e "\e[96mMovement Bash Map Pack Editor\n\e[93mLoaded pack: \e[37m${packname}\n"
	echo "This map pack contains ${#maps_array[@]} maps"
	selected="false"
	[ "$select" -lt "${#maps_array[@]}" ] && [ "$select" -gt "-1" ] && echo "Selected map: ${maps_array[$select]}" && selected="true"
	[ "$(($select + 1))" -gt "${#maps_array[@]}" ] && echo "No map selected"
	[ "$select" -lt "0" ] && echo "No map selected"
	echo
	echo "1. Add map"
	echo "2. Select map"
	[ "$selected" = "false" ] && echo "3. Exit editor"
	[ "$selected" = "false" ] && echo "4. Save map pack"
	[ "$selected" = "false" ] && echo "5. Check maps"
	[ "$selected" = "true" ] && echo "3. Change map"
	[ "$selected" = "true" ] && echo "4. Remove map"
	[ "$selected" = "true" ] && echo "5. Swap with another map in map pack"
	[ "$selected" = "true" ] && echo "6. Preview map"
	[ "$selected" = "true" ] && echo "7. Exit editor"
	[ "$selected" = "true" ] && echo "8. Save map pack"
	[ "$selected" = "true" ] && echo "9. Check maps"
	echo
	read -rsn1 -p "Please type a number: " ans
	[ "$ans" = "1" ] && Add
	[ "$ans" = "2" ] && Map_List
	[ "$selected" = "false" ] && [ "$ans" = "3" ] && break
	[ "$selected" = "false" ] && [ "$ans" = "4" ] && Save
	[ "$selected" = "false" ] && [ "$ans" = "5" ] && Check
	[ "$selected" = "true" ] && [ "$ans" = "3" ] && Change ${maps_array[$select]}
	[ "$selected" = "true" ] && [ "$ans" = "4" ] && Delete ${maps_array[$select]}
	[ "$selected" = "true" ] && [ "$ans" = "5" ] && Swap ${maps_array[$select]}
	[ "$selected" = "true" ] && [ "$ans" = "6" ] && Preview
	[ "$selected" = "true" ] && [ "$ans" = "7" ] && break
	[ "$selected" = "true" ] && [ "$ans" = "8" ] && Save
	[ "$selected" = "true" ] && [ "$ans" = "9" ] && Check
done
