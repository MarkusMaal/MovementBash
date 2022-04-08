#!/bin/bash
#
# Movement bash
#
# Port of Movement Batch (classic version) for bash shells
# Uses the same function names as well as the same 1.5D
# map rendering engine. The codes is well documented for
# people interested in hacking/reprogramming the game.
#
ascii="$2"
dev="false"
shoots="0"
moves="0"
shoots2="0"
moves2="0"
keypressed="false"
canskip="true"
cust1=""
cust2=""
cust3=""
cust4=""
cust5=""
cust6=""
cust7=""
cust8=""
cust9=""
#character="@"

#
# Load map into memory
#
# Note: The whole map is stored on a single line.
#       Attempting to use multiple lines won't work.
#
if [ "$character" = "" ]; then
    character="@"
fi
while read -r line; do me="$line"; done < <(sed -n '1,1p' ".config")
while read -r line; do character="$line"; done < <(sed -n '2,2p' ".config")
while read -r line; do character2="$line"; done < <(sed -n '3,3p' ".config")
while read -r line; do shoot="$line"; done < <(sed -n '4,4p' ".config")
while read -r line; do ascii="$line"; done < <(sed -n '5,5p' ".config")
while read -r line; do multiplayer="$line"; done < <(sed -n '6,6p' ".config")

e=""
n=""
m=""
w=""
a=""
s=""
d=""
c=""
v=""
eight=""
four=""
six=""
one=""
two=""
three=""
while read -r line; do e="$line"; done < <(sed -n '1,1p' ".ctrl")
while read -r line; do m="$line"; done < <(sed -n '2,2p' ".ctrl")
while read -r line; do w="$line"; done < <(sed -n '3,3p' ".ctrl")
while read -r line; do a="$line"; done < <(sed -n '4,4p' ".ctrl")
while read -r line; do s="$line"; done < <(sed -n '5,5p' ".ctrl")
while read -r line; do d="$line"; done < <(sed -n '6,6p' ".ctrl")
while read -r line; do cl="$line"; done < <(sed -n '7,7p' ".ctrl")
while read -r line; do v="$line"; done < <(sed -n '8,8p' ".ctrl")
while read -r line; do eight="$line"; done < <(sed -n '9,9p' ".ctrl")
while read -r line; do four="$line"; done < <(sed -n '10,10p' ".ctrl")
while read -r line; do two="$line"; done < <(sed -n '11,11p' ".ctrl")
while read -r line; do six="$line"; done < <(sed -n '12,12p' ".ctrl")
while read -r line; do one="$line"; done < <(sed -n '13,13p' ".ctrl")
while read -r line; do three="$line"; done < <(sed -n '14,14p' ".ctrl")
position="50"
position2="-1"
author=""
d1="false"
d2="false"
splice="20"
blocks="100"
#filename="$1"
test -f ".c" && read character<".c"
test -f ".a" && read ascii<".a"
test -f ".m" && read filename<".m"
[ "${#filename}" = "1" ] && character="$1" && filename=""
if [ "$filename" = "" ]; then
	core/Browser.sh maps
	[ -f ".m" ] && read filename < .m
	[ -f ".m" ] || exit 0
	rm .m
fi
clear
echo "Loading.."
orig_map=""
id="0"
load_dir="maps"
if [[ "$filename" == */* ]]; then
    load_dir="campaign"
    canskip="false"
    delims="/"
    string=$filename$delims
    newarray=()
    while [[ $string ]]; do
    newarray+=( "${string%%"$delims"*}" )
    string=${string#*"$delims"}
    done
    filename="${newarray[1]}"
    load_dir="$load_dir/${newarray[0]}"
    [ "$load_dir" = "campaign/Template" ] && canskip="true"
fi
while read -r line; do
    [ "$id" = "0" ] && name="$line" && orig_map="$name"
    [ "$id" = "1" ] && position="$line"
    [ "$id" = "2" ] && position2="$line"
    [ "$id" = "3" ] && author="$line"
    [ "$id" = "4" ] && splice="$line"
    id=$(($id + 1))
done < "$load_dir/$filename"
    
blocks="$(( ${#orig_map} - 1 ))"
if [ "$id" -gt "5" ]; then
    clear
    echo -e "\nSpecified map is incompatible with this version of Movement Bash\n"
    read -rsn1 -p "Press any key to continue. . . "
    echo -e "\n"
    exit
fi
if [ "$orig_map" = "" ]; then
    clear
    echo -e "\nSpecified map either doesn't exist or doesn't support this version of Movement Batch\n"
    read -rsn1 -p "Press any key to continue. . . "
    echo -e "\n"
    exit
fi
#
# Import ifcheck function
#
# Note: The ifcheck file must be marked as executable
#       and it must contain the map_ifcheck function.
#
clear
echo "Loading..."
ifname1="ifchecks/$filename"
ifname2="_ifcheck.sh"
ifname="$ifname1$ifname2"
endshoot="false"
source ./$ifname

# Reset some variables
finish="False"
map=""
last=50
last2=-1
map_ifcheck
#
# Layout - updates the screen layout
#

layout () {
	map=""
	for (( c=0; c<=${blocks}; c++ ))
	do
		if [ "$c" = "$position" ] && [ "$d1" = "false" ]; then
			map="${map}a"
		elif [ "$c" = "$(($blocks/2))" ] && [ "$dev" = "true" ]; then
			map="${map}*"
		elif [ "$c" = "$position2" ] && [ "$multiplayer" = "true" ] && [ "$d2" = "false" ]; then
			map="${map}b"
		else
			mapchar="$(echo ${orig_map:$c:1})" && map="$map$mapchar"
		fi
	done
}

#
# Screen - outputs everything
#
# First displays some text along with the map loaded
# Second displays your map with the character
# Third displays a prompt for the user to press a key
#

screen () {
	[ "$author" = "" ] || echo -e "\033[0;0H\e[96mMovement Bash\n\e[93mLoaded map:\e[39m $filename by $author\e[97m\n"
	[ "$author" = "" ] && echo -e "\033[0;0H\e[96mMovement Bash\n\e[93mLoaded map:\e[39m $filename\e[97m\n"
	for (( c=1; c<=${blocks}; c+=${splice} ))
	do
		smap="${map:$(($c-1)):$splice}"
		if [ "$ascii" = "false" ]; then
			smap="${smap//#/\\u2588}"
			smap="${smap//\`/\\u2592}"
			smap="${smap//\'/\ }"
			smap="${smap//\./\\u2591}"
			smap="${smap//\+/\\u2593}"
			smap="${smap//\</\\u226A}"
			smap="${smap//\>/\\u226B}"
		fi
		smap="${smap//a/$character}"
		smap="${smap//b/$character2}"
		smap="${smap//_/\\e[30m_\\e[97m}"
		printf "$smap        \n"
	done
	[ "$keypressed" = "true" ] || printf "\e[0m"
	[ "$keypressed" = "true" ] && keypressed="false"
	[ "$dev" = "true" ] && echo && echo "Splice: $splice; Blocks: $blocks; Pos: $position; Pos2: $position2"
	[ "$dev" = "true" ] && echo "Last2: $last2; Last: $last; Block: ${orig_map:$position:1}; Block2: ${orig_map:$position2:1}"
	[ "$dev" = "true" ] && echo "Moves: $moves; Moves2: $moves2; Shoots: $shoots; Shoots2: $shoots2"
}

#
# Prompt - reads user input
#
# Inputs can be changed here
#

prompt () {
	escape_char="$(printf "\u1b")"
	input=""
	while [ "$input" = "" ]; do read -t0.001 -rsn4 input; done
	[ "$input" = "$w" ] && [ "$d1" = "false" ] && moves="$(($moves+1))" && last=$position && position=$(($position-${splice})) && keypressed="true"
	[ "$input" = "$s" ] && [ "$d1" = "false" ] && moves="$(($moves+1))" && last=$position && position=$(($position+${splice})) && keypressed="true"
	[ "$input" = "$d" ] && [ "$d1" = "false" ] && moves="$(($moves+1))" && last=$position && position=$(($position+1)) && keypressed="true"
	[ "$input" = "$a" ] && [ "$d1" = "false" ] && moves="$(($moves+1))" && last=$position && position=$(($position-1)) && keypressed="true"
	[ "$input" = "$cl" ] && [ "$d1" = "false" ] && shoots="$(($shoots+1))" && shootpos=$(($position-1)) && shoot -1 && keypressed="true"
	[ "$input" = "$v" ] && [ "$d1" = "false" ] && shoots="$(($shoots+1))" && shootpos=$(($position+1)) && shoot 1 && keypressed="true"
	[ "$input" = "$eight" ] && [ "$d2" = "false" ] && moves2="$(($moves2+1))" && last2=$position2 && position2=$(($position2-${splice})) && keypressed="true"
	[ "$input" = "$four" ] && [ "$d2" = "false" ] && moves2="$(($moves2+1))" && last2=$position2 && position2=$(($position2-1)) && keypressed="true"
	[ "$input" = "$two" ] && [ "$d2" = "false" ] && moves2="$(($moves2+1))" && last2=$position2 && position2=$(($position2+${splice})) && keypressed="true"
	[ "$input" = "$six" ] && [ "$d2" = "false" ] && moves2="$(($moves2+1))" && last2=$position2 && position2=$(($position2+1)) && keypressed="true"
	[ "$input" = "$one" ] && [ "$d2" = "false" ] && shoots2="$(($shoots2+1))" && shootpos=$(($position2-1)) && shoot -1 && keypressed="true"
	[ "$input" = "$three" ] && [ "$d2" = "false" ] && shoots2="$(($shoots2+1))" && shootpos=$(($position2+1)) && shoot 1 && keypressed="true"
	[ "$input" = "$e" ] && [ "$canskip" = "true" ] && exit
	[ "$input" = "$m" ] && [ "$dev" = "true" ] && clear && dev="false" && return
	[ "$input" = "$m" ] && [ "$me" = "Developer" ] && [ "$dev" = "false" ] && dev="true"
	[ "$input" = "+" ] && [ "$dev" = "true" ] && clear && echo "Resizing..." && splice="$(($splice+1))"
	[ "$input" = "-" ] && [ "$dev" = "true" ] && clear && echo "Resizing..." && splice="$(($splice-1))"
	[ "$input" = "*" ] && [ "$dev" = "true" ] && clear && echo "Redrawing..."
}


#
# Shootcheck - checks if a bullet has reached the edge
#
# echo and $() are used, because I wasn't able to make
# it not crash with global global variables
# ARGS: 1 - bullet position
#

shootcheck() {
	shootpos="$1"
	solas="${shootpos}$(($shootpos+1))"
	endshoot="false"
	for (( i=0; i<$blocks; i+=1 ))
	do
		if [ "$(( $i % $splice ))" = "0" ]; then
			[ "$solas" = "$(($i-1))$(($i))" ] && endshoot="true"
			[ "$solas" = "$(($i))$(($i+1))" ] && endshoot="true"
		fi
	done
	echo "$endshoot"
}

#
# Ifcheck - checks if the player has moved out of bounds
#

ifcheck () {
	polas="${last}${position}"
	polas2="${last2}${position2}"
	lines="$(($blocks/$splice))"

	for (( i=0; i<$blocks; i+=$splice ))
	do
		[ "$polas" = "$(($i-1))$(($i))" ] && position="$last"
		[ "$polas" = "$(($i))$(($i-1))" ] && position="$last"
		[ "$polas2" = "$(($i-1))$(($i))" ] && position2="$last2"
		[ "$polas2" = "$(($i))$(($i-1))" ] && position2="$last2"
	done
	[ "$position" -lt "0" ] && position="$last"
	[ "$position" -gt "$(($blocks))" ] && position="$last"

	[ "$position2" -gt "$(($blocks-1))" ] && position2="$last2"
	[ "$position2" -lt "0" ] && position2="$last2"
}

#
# Shoot - This function moves the bullet, if the player
# has decided to shoot
# ARGS: 1 - horizontal bullet location increment value
# 	    (e.g. -1 moves left, 1 moves right)
#

shoot () {
	[ "$1" == "0" ] && break
	endshoot="false"
	for (( i=0; i<$shoot; i++ ))
	do
		layout
		[ "$1" -lt "0" ] && map="${map:$((0)):$shootpos}<${map:$(($shootpos+1)):$((${blocks}-$shootpos))}"
		[ "$1" -gt "0" ] && map="${map:$((0)):$shootpos}>${map:$(($shootpos+1)):$((${blocks}-$shootpos))}"
		screen
		[ "$dev" = "false" ] && endshoot="$(shootcheck $shootpos)"
		[ "$shootpos" = "$position" ] && d1="true" && position="${blocks}"
		[ "$shootpos" = "$position2" ] && d2="true" && position2="${blocks}"
		[ "$dev" = "false" ] && map_ifcheck
		[ "$endshoot" = "true" ] && endshoot="false" && break
		shootpos=$(($shootpos+$1))
	done
	shootpos="0"
}

#
# Main loop
#
# All the functions above are going to be called from here.
#

while true; do
	layout
	skipprompt="false"
	[ "$keypressed" = "true" ] && skipprompt="true"
	screen
	[ "$skipprompt" = "false" ] && prompt
	[ "$dev" = "false" ] && ifcheck

    #
    # Map_ifcheck - position checks loaded from the map ifcheck file
    #
    # These checks allow the player to collide with the objects, teleport,
    # or finish the map.
    #

	[ "$dev" = "false" ] && map_ifcheck

    #
    # Finish message
    #
    # If the player finishes the map, display a message
    #

	if [ "$finish" = "True" ]; then
	        clear
	        screen "uhide"
	        echo -e "\e[39m\nMap finished"
		read -rsn1 -p "Press any key to continue. . . "
		echo -e "\n"
		break
	fi
done
