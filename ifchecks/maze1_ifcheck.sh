function map_ifcheck {
	[ "$position" = "19" ] && finish="True"
	[ "$position2" = "" ] && finish="True"
	[ "${orig_map:$position:1}" = "#" ] && position="$last"
	[ "${orig_map:$position2:1}" = "#" ] && position2="$last2"
	[ "${orig_map:$shootpos:1}" = "#" ] && endshoot="true"
}
