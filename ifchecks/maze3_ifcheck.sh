function map_ifcheck {
	[ "$position" = "15" ] && finish="True"
	[ "$position2" = "15" ] && finish="True"
	[ "${orig_map:$position:1}" = "#" ] && position="$last"
	[ "${orig_map:$position2:1}" = "#" ] && position2="$last2"
	[ "${orig_map:$shootpos:1}" = "#" ] && endshoot="true"
	[ "$position" = "0" ] && position="18"
	[ "$position" = "19" ] && position="1"
	[ "$position2" = "0" ] && position2="18"
	[ "$position2" = "19" ] && position2="1"
	[ "$shootpos" = "0" ] && shootpos="18"
	[ "$shootpos" = "19" ] && shootpos="1"
}
