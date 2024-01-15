function map_ifcheck {
	[ "$position" = "False" ] && finish="True"
	[ "$position2" = "" ] && finish="True"
	[ "$shootpos" = "2" ] && orig_map="${orig_map:0:$shootpos}\+${orig_map:$(($shootpos+1)):$((10-$shootpos))}"
	[ "$shootpos" = "8" ] && orig_map="${orig_map:0:$shootpos}\+${orig_map:$(($shootpos+1)):$((10-$shootpos))}"
	[ "$shootpos" = "4" ] && orig_map="${orig_map:0:$shootpos}\+${orig_map:$(($shootpos+1)):$((10-$shootpos))}"
	[ "$shootpos" = "6" ] && orig_map="${orig_map:0:$shootpos}\+${orig_map:$(($shootpos+1)):$((10-$shootpos))}"
	[ "$shootpos" = "0" ] && orig_map="${orig_map:0:$shootpos}\+${orig_map:$(($shootpos+1)):$((10-$shootpos))}"
}
