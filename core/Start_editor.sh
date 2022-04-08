#!/bin/bash
#
# Movement Bash Map Editor
#
# This file helps you create your own map.
#

# Cursor character
character="*"

# Cursor location
position="1"

# File name
filename="$1"

# If true, display map in ASCII
ascii="false"

# Text editor used to edit scripts
textdit = ""

# Declares arrays for ifchecks
declare -a collide_array
declare -a script_array
declare -a scollide_array
declare -a collide_array2

while read -r line; do author="$line"; done < <(sed -n '1,1p' ".config")
# Line index for block collision
collide_id=0
collide_id2=0
scollide_id=0
position2=-1
splice=20

# If no map specified in the arguments, ask the user for the map name
if [ "$filename" = "" ]; then
	core/Browser.sh maps 1
	[ -f ".m" ] && read filename < .m
	[ -f ".m" ] || exit 0
	rm .m
fi
ifcheck="ifchecks/${filename}_ifcheck.sh"
filename="maps/$filename"
# Orig_map is the original map without any cursor/player characters
orig_map=""

# Loads the map if it exists
id="0"
echo "Updating map modification time/creating empty map file"
touch $filename
echo "Loading file..."
while read -r line; do
    [ "$id" = "0" ] && name="$line" && orig_map="$name"
    [ "$id" = "1" ] && position="$line"
    [ "$id" = "2" ] && position2="$line"
    [ "$id" = "4" ] && splice="$line"
    id=$(($id + 1))
done < "$filename"
blocks="$((${#orig_map}-1))"
# Sets $start variable to current position
start="$position"
[ "$start2" = "" ] && start2="$position2"

# Sets $finish variable to False, which disables it
finish="False"

# Creates a new map if it doesn't exist
if [ "$orig_map" = "" ]; then
	if [ "$author" = "Developer" ]; then
		clear
		echo
		echo "Developer mode"
		echo
		echo "Cannot create new maps in developer mode"
		echo
		read -rsn1 -p "Press any key to continue . . . "
		exit 0
	fi
	echo "Warning: Map size cannot be easily changed later"
	read -p "Enter map width [20]: " splice
	[ "$splice" = "" ] && splice="20"
	read -p "Enter map height [5]: " height
	[ "$height" = "" ] && height="5"
	blocks="$((splice * height))"
	echo "Total blocks: ${blocks}"
	echo "Generating map"
	for (( c=1; c<=${blocks}; c+=1 ))
	do
		o="$orig_map"
		a="\`"
		orig_map="$orig_map$a"
	done
	touch "$ifcheck"
else
	echo "Running simulation..."
	source ./$ifcheck
	for (( i=0; i<${blocks}; i++ ))
	do
		last=$(($i-1))
		last2=$(($i-1))
		endshoot="false"
		position="$i"
		position2="$i"
		shootpos="$i"
		backup="${orig_map:$shootpos:1}"
		map_ifcheck
		[ "$position" = "$last" ] && collide_array+=("$i") && collide_id=$(( $collide_id + 1 ))
		[ "$position2" = "$last2" ] && collide_array2+=("$i") && collide_id2=$(( $collide_id2 + 1 ))
		[ "$endshoot" = "true" ] && scollide_array+=("$i") && scollide_id=$(( $scollide_id + 1 ))
		[ "$finish" = "True" ] && finish="$i"
		orig_map="${orig_map:0:$shootpos}$backup${orig_map:$(($shootpos+1)):$((${blocks}-$shootpos))}"
	done
	echo "Resetting position variable..."
	position="$start"
	first_read=$(($collide_id+$collide_id2+$scollide_id+2))
	[ "$finish" = "False" ] && first_read=$(($first_read-1))
	cnt=0
	echo "Loading custom scripts..."
	while read line
	do
		if [ "$cnt" -gt "$first_read" ];
		then
			script_array+=("$line")
		fi
		cnt=$((cnt+1))
	done < $ifcheck
	unset 'script_array[${#script_array[@]}-1]'
	unset 'script_array[${#script_array[@]}-1]'
fi

# Reset some variables
map=""
last=1
bchar="#"

#
# Layout - updates the screen layout
#

layout () {
	map=""
	for (( c=0; c<=${blocks}; c++ ))
	do
		if [ "$c" = "$position" ]; then
			map="$map$character"
		else
			mapchar="$(echo ${orig_map:$c:1})"
	 		map="$map$mapchar"
		fi
	done
}

#
# Screen - outputs everything
#
#
# First displays some text along with the map loaded
#
# Second displays your map with the character
#
# Third displays keys the user can press to perform
# actions.
#
# Fourth displays current values of some variables.
#

screen () {
	clear
	echo -e "\e[96mMovement Bash Editor\n\e[93mLoaded map:\e[39m ${filename/maps\//}\n\e[95mYour signature: \e[37m${author}\e[97m\n"
	for (( c=1; c<=${blocks}; c+=${splice} ))
	do
		smap="${map:$(($c-1)):$splice}"
		if [ "$ascii" = "false" ]; then
	        smap="${smap//#/\\u2588}"
	        smap="${smap//\`/\\u2592}"
	        smap="${smap//\'/\ }"
	        smap="${smap//\./\\u2591}"
	        smap="${smap//\+/\\u2593}"
	        printf "$smap\n"
	     else
			echo "$smap"
	     fi
	done
        echo -e "\e[39m\nUse WASD to move, press E to exit"
        echo -e "\nC - Change block   P - Place block   M - Custom block\nB - Start point    F - Finish line   U - Toggle ascii/unicode mode\nO - Add obstacle   Z - Add script    X - Save changes\nQ - Player2 start   L - Player2 obstacle   I - Unshootable object\nK - Make shootable object"
	epos=$(($position+1))
	cchar=$(echo "$orig_map" | cut -c$epos-$epos)
	echo -e "\nPos: $position (${splice}x$(($blocks/$splice+1)) blocks)"
	echo "Block below character: $cchar"
	echo "Placable character: $bchar"
	echo "Start point(s): $start; $start2 , Finish: $finish"
	echo "Collidable Player1 blocks: ${#collide_array[@]} [J to display]"
	echo "Collidable Player2 blocks: ${#collide_array2[@]}"
	echo "Unshootable objects: ${#scollide_array[@]}"
	echo "Custom script lines: ${#script_array[@]}"
}

#
# Prompt - reads user input
#
# Inputs can be changed here
#

prompt () {
	read -rsn1 input
# Move cursor
	if [ "$input" = "w" ]; then
		last=$position
		position=$(($position-$splice))
	elif [ "$input" = "a" ]; then
		last=$position
		position=$(($position-1))
	elif [ "$input" = "s" ]; then
		last=$position
		position=$(($position+$splice))
	elif [ "$input" = "d" ]; then
		last=$position
		position=$(($position+1))
	elif [ "$input" = "c" ]; then
# Predefined characters
		if [ "$bchar" = "#" ]; then
			bchar="-"
		elif [ "$bchar" = "-" ]; then
			bchar="\`"
		elif [ "$bchar" = "\`" ]; then
			bchar="."
		elif [ "$bchar" = "." ]; then
			bchar="+"
		elif [ "$bchar" = "+" ]; then
			bchar="'"
		elif [ "$bchar" = "'" ]; then
			bchar=":"
		elif [ "$bchar" = ":" ]; then
			bchar="#"
		else
			bchar="#"
		fi
# Code for placing the block
	elif [ "$input" = "p" ]; then
		epos=$(($position+2))
		cchar=$(echo "$orig_map" | cut -c$epos-$epos)
		orig_map1=$(echo "$orig_map" | cut -c1-$position)
		orig_map2=$(echo "$orig_map" | cut -c$epos-${blocks})
		orig_map="$orig_map1$bchar$orig_map2"
# Code for marking start/finish points
	elif [ "$input" = "b" ]; then
		start="$position"
	elif [ "$input" = "q" ]; then
		start2="$position"
	elif [ "$input" = "f" ]; then
		finish="$position"
# Code for marking blocks collidable (can you step on it?)
	elif [ "$input" = "o" ]; then
		c="$colls"
		b="$position"
		d=";"
		colls="$c$b$d"
		collide_array[$collide_id]=$position
		collide_id=$(($collide_id+1))
	elif [ "$input" = "j" ]; then
		clear
		echo "Player 1 obstacles:"
		for line in "${collide_array[@]}"
		do
			echo "$line"
		done
		read -rsn1 -p "Press any key to continue . . . "
		clear
		echo "Player 2 obstacles:"
		for line in "${collide_array2[@]}"
		do
			echo "$line"
		done
		read -rsn1 -p "Press any key to continue . . . "
		clear
		echo "Unshootables:"
		for line in "${scollide_array[@]}"
		do
			echo "$line"
		done
		read -rsn1 -p "Press any key to continue . . . "
	elif [ "$input" = "l" ]; then
		c="$colls2"
		b="$position"
		d=";"
		colls2="$c$b$d"
		collide_array2[$collide_id2]=$position
		collide_id2=$(($collide_id2+1))
	elif [ "$input" = "i" ]; then
		c="$scolls"
		b="$position"
		d=";"
		scolls="$c$b$d"
		scollide_array[$scollide_id]=$position
		scollide_id=$(($scollide_id+1))
# Code for saving the map
	elif [ "$input" = "x" ]; then
		if [ "$author" = "Developer" ]; then
			clear
			echo
			echo "Developer mode"
			echo
			echo "Cannot save maps in developer mode"
			echo
			read -rsn1 -p "Press any key to continue . . . "
			return
		fi
		echo "Saving map geometry..."
		echo "$orig_map">$filename
		echo "$start">>$filename
		echo "$start2">>$filename
		echo "$author">>$filename
		echo "$splice">>$filename
		echo "Saving map logic..."
		filend="_ifcheck.sh"
		echo "function map_ifcheck {">${filename/maps/ifchecks}$filend
		for i in "${collide_array[@]}"; do
			ob_1="$i"
			echo "	[ \"\$position\" = \"$ob_1\" ] && position=\"\$last\"">>${filename/maps/ifchecks}$filend
		done
		for i in "${collide_array2[@]}"; do
			ob_1="$i"
			echo "	[ \"\$position2\" = \"$ob_1\" ] && position2=\"\$last2\"">>${filename/maps/ifchecks}$filend
		done
		for i in "${scollide_array[@]}"; do
			ob_1="$i"
			echo "	[ \"\$shootpos\" = \"$ob_1\" ] && endshoot=\"true\"">>${filename/maps/ifchecks}$filend
		done
		echo "	[ \"\$position\" = \"$finish\" ] && finish=\"True\"">>${filename/maps/ifchecks}$filend
		echo "	[ \"\$position2\" = \"$finish2\" ] && finish=\"True\"">>${filename/maps/ifchecks}$filend
		for i in "${script_array[@]}"; do
			ob_1="$i"
			echo "	$ob_1">>${filename/maps/ifchecks}$filend
		done
		echo "}">>${filename/maps/ifchecks}$filend
	        echo -e "\e[39m\nMap saved"
                read -rsn1 -p "Press any key to continue. . . "
# Code that asks the user for a custom character
	elif [ "$input" = "m" ]; then
		read -rsn1 -p "Type a character you'd like to use . . . " bchar
	elif [ "$input" = "u" ]; then
		if [ "$ascii" = "false" ]; then
			ascii="true"
		else
			ascii="false"
		fi
# Code for editing custom scripts
	elif [ "$input" = "k" ]; then
		script_array+=("[ \"\$shootpos\" = \"${position}\" ] && orig_map=\"\${orig_map:0:\$shootpos}\\${bchar}\${orig_map:\$((\$shootpos+1)):\$((${blocks}-\$shootpos))}\"")
	elif [ "$input" = "z" ]; then
		clear
		txtdit="$EDITOR"
		if [ "$textdit" = "" ]; then
			echo
			echo "We couldn't find the default command line editor. Please specify,"
			echo "which editor you'd like to use."
			echo
			read -p "Enter the name of the text editor you'd like to use: " textdit
		fi
		if [ "$textdit" != "" ]; then
			touch .filescript
			for i in "${script_array[@]}"; do
				echo "$i">>.filescript
			done
			$textdit .filescript
			id=0
			while read -r line; do
			    script_array[$id]="$line"
			    id=$(($id + 1))
			done < ".filescript"
			rm .filescript
		fi
# Code for closing the editor
	elif [ "$input" = "e" ]; then
		exit
	fi
}

#
# Ifcheck - checks if the player has moved out of bounds
#

ifcheck () {
	if [ "$position" -gt "$blocks" ]; then
		position=$last
	elif [ "$position" -lt "0" ]; then
		position=$last
	fi
}

#
# Main loop
#
# All the functions above are going to be called from here.
#

while true; do
	layout
	screen
	prompt
	ifcheck
done
