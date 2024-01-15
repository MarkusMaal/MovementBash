function map_ifcheck {
	[ "$position" = "49" ] && position="$last"
	[ "$position2" = "49" ] && position2="$last2"
	[ "$shootpos" = "48" ] && endshoot="true"
	[ "$shootpos" = "49" ] && endshoot="true"
	[ "$shootpos" = "50" ] && endshoot="true"
	[ "$position" = "99" ] && finish="True"
	[ "$position2" = "" ] && finish="True"
}
