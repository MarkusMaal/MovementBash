[ -f "/bin/bash" ] && #!/bin/bash
[ -f "/usr/bin/bash" ] && #!/usr/bin/bash
[ -f "/Programs/Bash/5.0/bin/bash" ] && #!/Programs/Bash/5.0/bin/bash
[ -f "/run/current-system/sw/bin/bash" ] && #!/Programs/Bash/5.0/bin/bash
[ -f "/usr/local/bin/bash" ] && #!/usr/local/bin/bash
#
# The above code is needed for non-Linux OSs that support bash,
# like FreeBSD or radically different Linux OSs that don't follow
# the UNIX-like file path standards.
#
# OS-s without bash or bash compatible shell will not work
#
# For Windows, you can use Git or Windows Subsystem for Linux
#

#
# Movement Bash
#
# To launch movement bash, extract all files from
# the archive. Then drag and drop the "Start_game.sh" file
# onto the terminal window. Press enter after dropping
# the script.
#
# Alternatively, you can cd to where
# Start_game.sh is located and then type ./Start_game.sh
# to launch the script.
#
# Note that launching directly from a file manager or using
# the sh command won't work
#
pushd "$(dirname "$BASH_SOURCE")" > /dev/null
#setterm -term linux -back black -fore white -clear all
printf "\e]2;Game is currently starting up. If you can read this, then I recommend you to drink coffee...\a"
echo "Loading Movement Bash..."
#
# SaveConfig
#
# Saves any settings set in the options menu
#
SaveConfig() {
	nxt="${me/\*i\*/\\e[30m}"
	me="${nxt/\*r\*/\\e[31m}"
	nxt="${me/\*g\*/\\e[32m}"
	me="${nxt/\*y\*/\\e[33m}"
	nxt="${me/\*b\*/\\e[34m}"
	me="${nxt/\*m\*/\\e[35m}"
	nxt="${me/\*c\*/\\e[36m}"
	me="${nxt/\*w\*/\\e[37m}"
	nxt="${me/_i_/\\e[90m}"
	me="${nxt/_r_/\\e[91m}"
	nxt="${me/_g_/\\e[92m}"
	me="${nxt/_y_/\\e[93m}"
	nxt="${me/_b_/\\e[94m}"
	me="${nxt/_m_/\\e[95m}"
	nxt="${me/_c_/\\e[96m}"
	me="${nxt/_w_/\\e[97m}"
	nxt="${me/--/\\e[0m}"
	nxt="${nxt/\*\*/\\e[1m}"
	me="${nxt/()/\\e[2m}"
	nxt="${me/[]/\\e[3m}"
	me="${nxt/__/\\e[4m}"
	nxt="${me/::/\\e[5m}"
	me="${nxt}\\e[37m\e[0m"
	echo "${me}" > .config
	echo "$character" >> .config
	echo "$character2" >> .config
	echo "$shoot" >> .config
	echo "$ascii" >> .config
	echo "$multiplayer" >> .config
}

#
# Setup
#
# Initial setup
#

Setup() {
	clear
	echo
	echo "Welcome to Movement Bash!"
	echo
	echo "Player 1 character not found. Default setting: @"
	echo "Player 2 character not found. Default setting: #"
	echo 
	echo "Movement Bash uses your signature in the main menu and as the author on custom maps you make."
	echo "Your signature is also visible to custom scripts in custom maps."
	me=""
	while true; do
		read -p "Please enter your signature: " me
		[ "$me" = "Developer" ] || break
		[ "$me" = "Developer" ] && echo "This is a reserved signature"
	done
	echo
	echo "Saving to .config..."
	shoot="5"
	SaveConfig
	echo "e" > .ctrl
	echo "m" >> .ctrl
	echo "[A" >> .ctrl
	echo "[D" >> .ctrl
	echo "[B" >> .ctrl
	echo "[C" >> .ctrl
	echo "[3~" >> .ctrl
	echo "[6~" >> .ctrl
	echo "w" >> .ctrl
	echo "a" >> .ctrl
	echo "s" >> .ctrl
	echo "d" >> .ctrl
	echo "c" >> .ctrl
	echo "v" >> .ctrl
	echo "Note: If controls don't work, set them manually in"
	echo "the options menu."
	read -rsn1 -p "Press any key to continue . . . "
}


#
# Options
#
# Customize the experience
#

Options() {
	while true; do
		clear
		echo
		echo "*/* Options */*"
		echo
		echo -e "1. Change your signature: $me\e[0m"
		echo -e "2. Change your character: $character\e[0m"
		echo -e "3. Change opponent's character: $character2\e[0m"
		echo "4. Shooting distance: $shoot"
		[ "$ascii" = "false" ] && echo "5. ASCII mode: disabled"
		[ "$ascii" = "true" ] && echo "5. ASCII mode: enabled"
		[ "$multiplayer" = "false" ] && echo "6. Multiplayer mode: disabled"
		[ "$multiplayer" = "true" ] && echo "6. Multiplayer mode: enabled"
		echo "7. Set controls"
		echo "8. Reset settings"
		echo "9. Go back"
		echo
		read -rsn1 -p "Press a specific number key to continue: " input
		[ "$input" = "1" ] && clear && me="Developer" && while [ "$me" = "Developer" ]; do read -p "Please enter your signature: " me; done && SaveConfig
		[ "$input" = "2" ] && clear && read -rsn1 -p "Please enter the player character you'd like to use: " character && SaveConfig
		[ "$input" = "3" ] && clear && read -rsn1 -p "Please enter the opposition character you'd like to use: " character2 && SaveConfig
		[ "$input" = "4" ] && clear && read -rsn1 -p "Please enter a number in range 0-9: " shoot && SaveConfig
		[ "$input" = "5" ] && [ "$ascii" = "false" ] && ascii="true" && input=0 && SaveConfig
		[ "$input" = "5" ] && [ "$ascii" = "true" ] && ascii="false" && input=0 && SaveConfig
		[ "$input" = "6" ] && [ "$multiplayer" = "false" ] && multiplayer="true" && input=0 && SaveConfig
		[ "$input" = "6" ] && [ "$multiplayer" = "true" ] && multiplayer="false" && input=0 && SaveConfig
		[ "$input" = "7" ] && SetControls
		[ "$input" = "8" ] && rm .config && rm .ctrl && clear && echo "Settings have been reset. To setup Movement Bash again, just run the script again." && exit 0
		[ "$input" = "9" ] && break
	done
}

SetControls() {
	# Reset controls
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
	clear
	echo
	echo "Set controls"
	echo
	echo "Exit/Skip map (recommended: E)"
	while [ "$e" == "" ]; do read -t0.1 -rsn4 e; done
	echo "$e" > .ctrl
	echo "Debug mode (recommended: M)"
	while [ "$m" == "" ]; do read -t0.1 -rsn4 m; done
	echo "$m" >> .ctrl
	echo
	echo "Player 1 controls"
	echo "Move up (recommended: Up)"
	while [ "$w" == "" ]; do read -t0.1 -rsn4 w; done
	echo "$w" >> .ctrl
	echo "Move left (recommended: Left)"
	while [ "$a" == "" ]; do read -t0.1 -rsn4 a; done
	echo "$a" >> .ctrl
	echo "Move down (recommended: Down)"
	while [ "$s" == "" ]; do read -t0.1 -rsn4 s; done
	echo "$s" >> .ctrl
	echo "Move right (recommended: Right)"
	while [ "$d" == "" ]; do read -t0.1 -rsn4 d; done
	echo "$d" >> .ctrl
	echo "Shoot left (recommended: Delete)"
	while [ "$c" == "" ]; do read -t0.1 -rsn4 c; done
	echo "$c" >> .ctrl
	echo "Shoot right (recommended: Page Down)"
	while [ "$v" == "" ]; do read -t0.1 -rsn4 v; done
	echo "$v" >> .ctrl
	echo
	echo "Player 2 controls"
	echo "Up (recommended: W)"
	while [ "$eight" == "" ]; do read -t0.1 -rsn4 eight; done
	echo "$eight" >> .ctrl
	echo "Left (recommended: A)"
	while [ "$four" == "" ]; do read -t0.1 -rsn4 four; done
	echo "$four" >> .ctrl
	echo "Down (recommended: S)"
	while [ "$two" == "" ]; do read -t0.1 -rsn4 two; done
	echo "$two" >> .ctrl
	echo "Right (recommended: D)"
	while [ "$six" == "" ]; do read -t0.1 -rsn4 six; done
	echo "$six" >> .ctrl
	echo "Shoot left (recommended: C)"
	while [ "$one" == "" ]; do read -t0.1 -rsn4 one; done
	echo "$one" >> .ctrl
	echo "Shoot right (recommended: V)"
	while [ "$three" == "" ]; do read -t0.1 -rsn4 three; done
	echo "$three" >> .ctrl
}


#
# Standard_maps
#
# Play maps from a campaign
#
Campaign() {
    pushd campaign/$1 > /dev/null
    for file in *; do
        popd > /dev/null
        echo "$1/$file">.m && (core/Start_map.sh || Error) && rm .m
        pushd campaign/$1 > /dev/null
    done
    popd > /dev/null
	clear
	echo
	echo "Congratulations!"
	echo
	echo "You finished all of the \"$1\" maps!"
	echo
	read -rsn1 -p "Press any key to continue . . . "
}

Error() {
	code=$?
	[ "$code" = "0" ] && return
	clear
	echo
	echo The map was stopped unexpectedly, because a runtime
	echo error occoured.
	echo
	sleep 2
	printf "Press [M] key to continue . . . "
	while true; do
		read -rsn1 input
		[ "$input" = "m" ] && break
		[ "$input" = "M" ] && break
	done
}

#
# Play
#
# This menu allows you to start playing a map or a map pack
#
Play() {
	while true; do
		clear
		echo
		echo "-Standard maps----------------------"
		echo "1. Tutorials"
		echo "2. Classic"
		echo "3. Maze"
		echo "4. TBD"
		echo "5. TBD"
		echo "-Other maps-------------------------"
		echo "6. Custom map"
		echo "7. Map pack"
		echo "-Misc-------------------------------"
		echo "8. Go back"
		echo
		read -rsn1 -p "Press a specific number key to continue: " input
		all="false"
		[ "$input" = "1" ] && Campaign Tutorial
		[ "$input" = "2" ] && Campaign Template
		[ "$input" = "3" ] && Campaign Maze
		[ "$input" = "6" ] && (core/Start_map.sh || Error)
		[ "$input" = "7" ] && (core/Start_pack.sh || Error)
		[ "$input" = "8" ] && break
	done
}

#
# Editors
#
# Allows you to make and manage custom maps and map packs
#
Editors() {
	while true; do
		clear
		echo
		echo "-Create----------------------------"
		echo "1. Create map or edit existing one"
		echo "2. Create a map pack"
		echo "-Rename----------------------------"
		echo "3. Rename map"
		echo "4. Rename map pack"
		echo "-Delete----------------------------"
		echo "5. Delete map"
		echo "6. Delete map pack"
		echo "-Misc------------------------------"
		echo "7. Go back"
		echo 
		read -rsn1 -p "Press a specific number key to continue: " input
		[ "$input" = "1" ] && core/Start_editor.sh
		[ "$input" = "2" ] && core/Start_pack_editor.sh
		if [ "$input" = "3" ]; then
			core/Browser.sh maps
			[ -f ".m" ] && read current < .m
			[ -f ".m" ] || continue
			rm .m
			clear
			read -p "Enter a new name: " new
			mv "maps/${current}" "maps/${new}"
			mv "ifchecks/${current}_ifcheck.sh" "ifchecks/${new}_ifcheck.sh"
			clear
			echo Map renamed
			read -rsn1 -p "Press any key to continue . . . "
		elif [ "$input" = "4" ]; then
			core/Browser.sh packs
			[ -f ".m" ] && read current < .m
			[ -f ".m" ] || continue
			rm .m
			clear
			read -p "Enter a new name: " new
			mv "packs/${current}" "packs/${new}"
		elif [ "$input" = "5" ]; then
			core/Browser.sh maps
			[ -f ".m" ] && read current < .m
			[ -f ".m" ] || continue
			rm .m
			rm "maps/$current"
			rm "ifchecks/$current_ifcheck.sh"
			clear
			echo Map deleted
			read -rsn1 -p "Press any key to continue . . . "
		elif [ "$input" = "6" ]; then
			core/Browser.sh packs
			[ -f ".m" ] && read current < .m
			[ -f ".m" ] || continue
			rm .m
			rm "packs/${current}"
			clear
			echo "Map pack deleted"
			read -rsn1 -p "Press any key to continue . . . "
		fi
		[ "$input" = "7" ] && break
	done
}

Exit() {
	popd > /dev/null
	clear
	exit
}

Extras() {
	while true; do
		clear
		echo
		echo "+++ Extras +++"
		echo
		echo "1. Preview map"
		echo "2. Generate a random map"
		echo "3. Convert Movement Batch map geometry (alpha)"
		echo "4. Credits"
		echo "5. Reload menu"
		echo "6. Go back"
		echo
		read -rsn1 -p "Press a number key: " ans
		[ "$ans" = "1" ] && Preview_map
		[ "$ans" = "2" ] && RMG
		[ "$ans" = "3" ] && Converter
		[ "$ans" = "4" ] && core/.congratulations
		[ "$ans" = "5" ] && Reload_main
		[ "$ans" = "6" ] && break
	done
}

Converter() {
	clear
	echo
	echo "<*> Map converter <*>"
	echo
	echo -e "\e[41m\e[93m\e[5mWARNING\e[0m\e[37m\e[40m: This tool is really experimental and might"
	echo "not work properly."
	echo 
	echo "This tool allows you to convert the geometry of"
	echo "a Movement Batch map into a Movement Bash format."
	echo
	echo "Note that any custom scripts of the map WILL NOT be"
	echo "converted. All that needs to be done manually using"
	echo "the editor."
	echo
	while true; do
		read -p "Enter the full path to the .cmd file of a valid Movement Batch map: " legacyfile
		[ -f "$legacyfile" ] && break
	done
	iconv -f WINDOWS-1252 -t utf8 < "$legacyfile" > ".m"
	read -p "Enter the name, you'd like to save the converted map as: " filename
	declare -a batchlines
	map=""
	while read -r "line"; do
		batchlines+=("${line}")
	done < ".m"
	rm .m
	id="1"
	fail="false"
	endblocks="false"
	for line in "${batchlines[@]}"; do
		replace="a$id="
		[[ "${line: -3:1}" = "=" ]] && map+="${line: -2:1}"
		[[ "${line: 7:6}" = "start=" ]] && start="${line: 13}" && endblocks="true"
		[[ "${line: 7:6}" = "start2" ]] && start2="${line: 14}"
		[[ "${line: 4:6}" = "author" ]] && author="${line: 11}"
		[[ "${line: 4:8}" = "color=yes" ]] && fail="true" && break
		#fline="$line"
		#block="${fline/$replace/}"
		id="$(( $id + 1 ))"
	done
	if [ "$fail" = "true" ]; then
		clear
		echo
		echo "Unsupported map"
		echo
		echo "This map cannot be converted, because it is a color map."
		echo "This version of Movement Bash doesn't support color maps"
		echo
		read -rsn1 -p "Press any key to continue . . . "
		return
	fi
	[ "${#map}" -gt "100" ] && splice="40"
	[ "${#map}" -gt "100" ] || splice="20"
	map="${map//±/\`}"
	map="${map//Û/#}"
	map="${map//°/.}"
	map="${map// /_}"
	clear
	echo "$map" > maps/$filename
	echo "${start/+11-11/}" >> maps/$filename
	echo "${start2/+11-11/}" >> maps/$filename
	echo "${author/ /_}" >> maps/$filename
	echo "$splice" >> maps/$filename
	echo "map_ifcheck() {" > "ifchecks/${filename}_ifcheck.sh"
	echo "    return" >> "ifchecks/${filename}_ifcheck.sh"
	echo "}" >> "ifchecks/${filename}_ifcheck.sh"
	chmod +x "ifchecks/${filename}_ifcheck.sh"
	echo "Map converted successfullly"
	read -rsn1 -p "Press any key to continue . . . "
}

RMG() {
	clear
	echo
	echo "/? Random map generator ?/"
	echo
	filename=""
	while [ "$filename" = "" ]; do read -p "Enter map name: " filename; done
	read -p "Enter map width [20]: " width
	[ "$width" = "" ] && width="20"
	read -p "Enter map height [5]: " height
	[ "$height" = "" ] && height="5"
	nblocks=$(($width * $height))
	declare -a logic
	echo "Generating..."
	finish="$(( $RANDOM % $nblocks ))"
	logic+=("[ \"\$position\" = \"${finish}\" ] && finish=\"True\"")
	logic+=("[ \"\$position2\" = \"${finish}\" ] && finish=\"True\"")
	orig_map=""
	for (( i=0; i<${nblocks}; i++ )); do
		sel="$(( $RANDOM % 3 + 1 ))"
		o="$orig_map"
		[ "$sel" = "1" ] && blk="\`" && echo "Place \` to $i"
		[ "$sel" = "2" ] && blk="#" && echo "Place # to $i"
		[ "$sel" = "2" ] && logic+=("[ \"\$position\" = \"${i}\" ] && position=\"\$last\"") && echo "Add wall to $i for player 1"
		[ "$sel" = "2" ] && logic+=("[ \"\$position2\" = \"${i}\" ] && position2=\"\$last2\"") && echo "Add wall to $i for player 2"
		[ "$sel" = "3" ] && blk="." && echo "Place . to $i"
		tp="$(( $RANDOM % $nblocks ))"
		[ "$sel" = "3" ] && logic+=("[ \"\$position\" = \"${i}\" ] && position=\"${tp}\"") && echo "Add teleport from $i to ${tp} for player 1"
		[ "$sel" = "3" ] && logic+=("[ \"\$position2\" = \"${i}\" ] && position2=\"${tp}\"") && echo "Add teleport from $i to ${tp} for player 2"
		orig_map="$orig_map$blk"
	done
	
	map=""
	echo "Placing finish to $finish"
	for (( c=0; c<${nblocks}; c++ ))
	do
		if [ "$c" = "$finish" ]; then
			map="${map}F"
		else
			mapchar="$(echo ${orig_map:$c:1})" && map="$map$mapchar"
		fi
	done
	start="$(( $RANDOM % $nblocks ))"
	start2="$(( $RANDOM % $nblocks ))"
	echo "Saving geometry..."
	echo "$map" > maps/$filename
	echo "$start" >> maps/$filename
	echo "$start2" >> maps/$filename
	echo "Random Map Generator" >> maps/$filename
	echo "$width" >> maps/$filename
	echo "Saving logic..."
	echo "map_ifcheck() {" > ifchecks/${filename}_ifcheck.sh
	for line in "${logic[@]}"; do
		ob_1="$line"
		echo "    ${ob_1}" >> ifchecks/${filename}_ifcheck.sh
	done
	echo "}" >> ifchecks/${filename}_ifcheck.sh
	echo "Map generated!"
	read -rsn1 -p "Press any key to continue . . . "
}

Preview_map() {
	core/Browser.sh maps
	[ -f ".m" ] && read mapname < .m
	author=""
	while read -r line; do author="$line"; done < <(sed -n '4,4p' "maps/$mapname")
	rm .m
	clear
	echo
	[ "$author" = "" ] || echo -e "$mapname by ${author}\e[37m\e[97m"
	[ "$author" = "" ] && echo -e "$mapname"
	echo
	core/Preview_map.sh $mapname $ascii
	echo -e "\e[37m"
	read -rsn1 -p "Press any key to continue . . . "
}

Help() {
	while true; do
		clear
		echo
		echo "(?) Help (?)"
		echo
		echo "1. Quick start guide"
		echo "2. Default controls"
		echo "3. Menu navigation"
		echo "4. Map editor"
		echo "5. Map pack editor"
		echo "6. Extra stuff"
		echo "7. Signature formatting"
		echo "8. Go back"
		echo
		read -rsn1 -p "Press a specific number key to continue: " inp
		[ "$inp" = "1" ] && less help/help.txt
		[ "$inp" = "2" ] && clear && cat help/controls.txt && read -rsn1 -p "Press any key to continue . . . "
		[ "$inp" = "3" ] && less help/menu.txt
		[ "$inp" = "4" ] && less help/editor.txt
		[ "$inp" = "5" ] && less help/pack.txt
		[ "$inp" = "6" ] && less help/extra.txt
		[ "$inp" = "7" ] && Help_formatting
		[ "$inp" = "8" ] && break
	done
}

Help_formatting() {
	clear
	echo
	echo "Help > Formatting"
	echo
	echo "Movement bash allows you to format your signature."
	echo
	echo "If you type a specific letter and surround it with"
	echo "asterisks (\*) or underscores (_), you can change the"
	echo "color of your text. Asterisks for dark colors, under-"
	echo "scores for light colors."
	echo
	echo -e "e.g. \"*b*test\" will show up as \e[34mtest\e[37m"
	echo -e "     \"_b_test\" will show up as \e[94mtest\e[37m"
	echo
	read -rsn1 -p "Press any key to see color codes. . . "
	clear
	echo
	echo "Color codes"
	echo
	echo -e "i - \e[90mBlack/gray\e[37m"
	echo -e "r - \e[31mRed\e[37m"
	echo -e "g - \e[32mGreen\e[37m"
	echo -e "y - \e[33mYellow\e[37m"
	echo -e "b - \e[34mBlue\e[37m"
	echo -e "m - \e[35mMagenta\e[37m"
	echo -e "c - \e[36mCyan\e[37m"
	echo -e "w - \e[37mWhite"
	echo
	read -rsn1 -p "Press any key to see special operators. . . "
	clear
	echo
	echo "Special operators"
	echo
	echo "--        Reset any operator"
	echo -e "**        \e[1mLightened/bold text\e[0m"
	echo -e "()        \e[2mDarkened/thin text\e[0m"
	echo -e "[]        \e[3mItalic text\e[0m"
	echo -e "__        \e[4mUnderlined text\e[0m"
	echo -e "::        \e[5mBlinking text\e[0m"
	echo
	read -rsn1 -p "Press any key to continue. . . "
}

Emusplash() {
    emu = $1
    [ "$emu" = "systemd" ] && splash="You are running this bash script over \e[1msystemd\e[0m" && return
    [ "$emu" = "sshd" ] && splash="You are running this bash script over \e[1mssh\e[0m" && return
    [ "$emu" = "" ] && splash="You are not using a terminal emulator" && return
    splash="You are using \e[1m$emu\e[0m as your terminal emulator"
}

Timesplash() {
    ([ "$(date +'%k')" -gt 4 ] && [ "$(date +'%k')" -lt 13 ]) && splash="Good morning"
    ([ "$(date +'%k')" -gt 12 ] && [ "$(date +'%k')" -lt 17 ]) && splash="Good afternoon"
    ([ "$(date +'%k')" -gt 16 ] && [ "$(date +'%k')" -lt 23 ]) && splash="Good evening"
    [ "$(date +'%k')" -gt 22 ] && splash="Good night"
    [ "$(date +'%k')" -lt 5 ] && splash="Good night"
}

Editorsplash() {
    edit="${EDITOR/\/usr\/bin\//}"
    [ "$edit" = "" ] && splash="The \$EDITOR variable is not set" && return
    splash="\e[1m$edit\e[0m is your default command line text editor"
}

ChooseSplash() {
    [ $rng = "1" ] && splash="Welcome to Movement Bash"
    [ $rng = "2" ] && splash="Also try Movement Batch"
    [ $rng = "3" ] && splash="Hello"
    [ $rng = "4" ] && splash="This is a splash text"
    [ $rng = "5" ] && splash="Did you sleep well" && quest="?"
    [ $rng = "6" ] && splash="How are things" && quest="?"
    [ $rng = "7" ] && splash="This is a bash game"
    [ $rng = "8" ] && splash="Welcome"
    [ $rng = "9" ] && splash="Did you have a good day" && quest="?"
    [ $rng = "10" ] && Editorsplash
    [ $rng = "11" ] && splash="Editor allows you to make new maps"
    [ $rng = "12" ] && splash="Do you remember using old movement batch editor" && quest="?"
    [ $rng = "13" ] && splash="You may want to see help"
    [ $rng = "14" ] && splash="Check out other player's creations"
    [ $rng = "15" ] && splash="Also try exit"
    [ $rng = "16" ] && splash="Hi"
    [ $rng = "17" ] && splash="I hope you will understand"
    [ $rng = "18" ] && splash="This game is made 100% using a text editor"
    [ $rng = "19" ] && splash="This program cannot be run in Win32 mode"
    [ $rng = "20" ] && splash="You can't ask me anything"
    [ $rng = "21" ] && splash="Also try LogOS"
    [ $rng = "22" ] && splash="Dislike, comment, unsubscribe"
    [ $rng = "23" ] && splash="Virus free"
    [ $rng = "24" ] && splash="Also try help"
    [ $rng = "25" ] && splash="Also try editor"
    [ $rng = "26" ] && splash="This is a text based game"
    [ $rng = "27" ] && splash="Also try cheating"
    [ $rng = "28" ] && splash="Also try my other batch and bash games"
    [ $rng = "29" ] && splash="Fail"
    [ $rng = "30" ] && splash="First letter of your username is \e[1m${USER:0:1}\e[0m"
    [ $rng = "31" ] && splash="Last letter of your username is \e[1m${USER/${USER:0:-1}/}\e[0m"
    [ $rng = "32" ] && splash="Tervetuloa"
    [ $rng = "33" ] && splash="I do not think so" && quest="."
    [ $rng = "34" ] && splash="Welcome back"
    [ $rng = "35" ] && splash="Now with more splash texts"
    [ $rng = "36" ] && splash="Deja Vu"
    [ $rng = "37" ] && splash="Deja Vu"
    [ $rng = "38" ] && splash="Thank you"
    [ $rng = "39" ] && splash="Have you cheched out multiplayer" && quest="?"
    [ $rng = "40" ] && splash="Damn"
    [ $rng = "41" ] && splash="Winderful"
    [ $rng = "42" ] && splash="This bash file is HUUUGEE"
    [ $rng = "43" ] && splash="Nice to meet you"
    [ $rng = "44" ] && splash="I'm not a robot"
    [ $rng = "45" ] && splash="Also check out \e[1m#\e[2m\e[36mmarkusTegelane\e[0m\e[37m"
    [ $rng = "46" ] && Timesplash
    [ $rng = "47" ] && splash="Your computer is using the \e[1m$(uname)\e[0m kernel"
    [ $rng = "48" ] && splash="Did you even look at the options menu" && quest="?"
    [ $rng = "49" ] && splash="This map is called \e[1m${splashmap}\e[0m"
    [ $rng = "50" ] && splash="You can't explain that"
    [ $rng = "51" ] && splash="Windows XP"
    [ $rng = "52" ] && splash="This piece of code is not a tangent"
    [ $rng = "53" ] && splash="Running \e[1mrm -rf /\e[0m as root helps speed up the startup time of your computer"
    [ $rng = "54" ] && splash="Your lucky number is \e[1m$RANDOM\e[0m"
    [ $rng = "55" ] && splash="Why did I waste my time making these splash texts" && quest="?"
    [ $rng = "56" ] && splash="Or is it" && quest="?"
    [ $rng = "57" ] && splash="Yes"
    [ $rng = "58" ] && splash="No"
    [ $rng = "59" ] && splash="Play a map \e[1mNOW\e[0m"
    [ $rng = "60" ] && splash="Have a pizza"
    [ $rng = "61" ] && splash="You're not my father"
    [ $rng = "62" ] && splash="Expand ding"
    [ $rng = "63" ] && splash="Beep, beep"
    [ $rng = "64" ] && splash="Great to see you again"
    [ $rng = "65" ] && splash="Have a nap"
    [ $rng = "66" ] && splash="\e[5mBlink\e[0m"
    [ $rng = "67" ] && splash="\e[3mItalic\e[0m"
    [ $rng = "68" ] && splash="\e[4mUnderlined text\e[0m"
    [ $rng = "69" ] && splash="\e[1mConfidence\e[0m"
    [ $rng = "70" ] && splash="\e[30mI'm a ninja\e[37m"
    [ $rng = "71" ] && splash="\e[31mR\e[32mG\e[34mB\e[37m"
    [ $rng = "72" ] && splash="\e[1m\e[36mC\e[35mM\e[33mY\e[30mK\e[37m\e[0m"
    [ $rng = "73" ] && splash="\e[34mSpace satellites\e[37m"
    [ $rng = "74" ] && splash="This looks familiar"
    [ $rng = "75" ] && splash="Have I been here before" && quest="?"
    [ $rng = "76" ] && splash="This looks oddly familiar, yet so different at the same time"
    [ $rng = "77" ] && splash="Wait, this isn't even Windows"
    [ $rng = "78" ] && splash="\e[3${color1}mC\e[3${color2}mo\e[3${color3}ml\e[3${color4}mo\e[3${color5}mr\e[3${color6}ms\e[37m"
    [ $rng = "79" ] && splash="This is why we can't have nice things"
    [ $rng = "80" ] && splash="Knock, knock"
    emu="$(ps -o comm= -p "$(($(ps -o ppid= -p "$(($(ps -o sid= -p "$$")))")))")"
    [ $rng = "81" ] && Emusplash $emu
    test -f "$(which fortune)" && [ $rng = "82" ] && splash="$(fortune)"
    [ $rng = "83" ] && splash="What did you just say" && quest="?"
    [ $rng = "84" ] && splash="Why don't you go outside" && quest="?"
    [ $rng = "85" ] && splash="Welcome to a simple bash game"
    [ $rng = "86" ] && splash="Now with more loops"
    [ $rng = "87" ] && splash="Also try scripting"
    [ $rng = "88" ] && splash="Why are you staring at this text" && quest="?"
    [ $rng = "89" ] && splash="Is this my new reality" && quest="?"
    [ $rng = "90" ] && splash="Hola"
    [ $rng = "91" ] && splash="You"
    [ $rng = "92" ] && splash="sup"
    [ $rng = "93" ] && splash="Why is 6 affraid of 7" && quest="?"
    [ $rng = "94" ] && splash="ASCII or pixel art" && quest="?"
    [ $rng = "95" ] && splash="Elephants are cool"
    [ $rng = "96" ] && splash="Press any key to continue"
    [ $rng = "97" ] && splash="cqvmix is a cool channel"
    [ $rng = "98" ] && splash="\e[31mHere's Johnny\e[37m"
    [ $rng = "99" ] && splash="My neighbours wanted to greet you"
    [ $rng = "100" ] && splash="Please don't go"
    [ $rng = "101" ] && splash="This game requires less RAM than Google Chrome"
    [ $rng = "102" ] && splash="Rabbit Technologies Corporation"
    [ $rng = "103" ] && splash="At least ESD isn't BSD" && quest="..."
    [ $rng = "104" ] && splash="Lunix"
    [ $rng = "105" ] && splash="Last, but not least"
}

Reload_main() {
    arr=(maps/*)
    rng=$(( $RANDOM % ${#arr[@]} ))
    splashmap=${arr[$rng]}
    splashmap=${splashmap/maps\//}
    # random colors for a splash text
    color1=$(( $RANDOM % 7 + 1 ))
    color2=$(( $RANDOM % 7 + 1 ))
    color3=$(( $RANDOM % 7 + 1 ))
    color4=$(( $RANDOM % 7 + 1 ))
    color5=$(( $RANDOM % 7 + 1 ))
    color6=$(( $RANDOM % 7 + 1 ))
    # splash text chooser
    # "Apparently, this is possible" is a fallback splash text
    quest="!"
    splash="Apparently, this is possible"
    rng=$(( $RANDOM % 105 + 1 ))
    ChooseSplash
}

# me - your signature (string)
# character - your character (char)
# character2 - opponent's character (char)
# shoot - shooting distance (int)
# multiplayer - multiplayer mode (bool)
# ascii - ascii mode (bool)
me="$USER"
character="@"
character2="#"
shoot="0"
multiplayer="false"
ascii="false"
# delete temporary files
test -f ".c" && rm ".c"
test -f ".a" && rm ".a"
test -f ".m" && rm ".m"
# start the initial setup, if the config file is missing
test -f ".config" || Setup
# read data from config file
while read -r line; do me="$line"; done < <(sed -n '1,1p' ".config")
while read -r line; do character="$line"; done < <(sed -n '2,2p' ".config")
while read -r line; do character2="$line"; done < <(sed -n '3,3p' ".config")
while read -r line; do shoot="$line"; done < <(sed -n '4,4p' ".config")
while read -r line; do ascii="$line"; done < <(sed -n '5,5p' ".config")
while read -r line; do multiplayer="$line"; done < <(sed -n '6,6p' ".config")
# select a random map to display at the main menu
Reload_main
# main menu loop
printf "\e]2;Movement Bash 1.0\a"
while true; do
	clear
	core/Preview_map.sh $splashmap $ascii
	echo
	echo -e "\e[0m\e[39m${splash}, $me${quest}\n"
	echo "1. Start"
	echo "2. Options"
	echo "3. Create"
	echo "4. Help"
	echo "5. Extras"
	echo "6. Exit"
	echo
	read -rsn1 -p "Press a specific number key to continue: " input
	[ "$input" = "1" ] && Play
	[ "$input" = "2" ] && Options
	[ "$input" = "3" ] && Editors
	[ "$input" = "4" ] && Help
	[ "$input" = "5" ] && Extras
	[ "$input" = "6" ] && clear && Exit
done

