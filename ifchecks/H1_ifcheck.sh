function map_ifcheck {
	[ "$position" = "28" ] && position="$last"
	[ "$position" = "31" ] && position="$last"
	[ "$position" = "48" ] && position="$last"
	[ "$position" = "49" ] && position="$last"
	[ "$position" = "50" ] && position="$last"
	[ "$position" = "51" ] && position="$last"
	[ "$position" = "68" ] && position="$last"
	[ "$position" = "71" ] && position="$last"
	[ "$position" = "71" ] && finish="True"
	[ "$position2" = "" ] && finish="True"
	[ "$shootpos" = "28" ] && orig_map="${orig_map:0:$shootpos}`${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "48" ] && orig_map="${orig_map:0:$shootpos}`${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "49" ] && orig_map="${orig_map:0:$shootpos}`${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "68" ] && orig_map="${orig_map:0:$shootpos}`${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "50" ] && orig_map="${orig_map:0:$shootpos}`${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "51" ] && orig_map="${orig_map:0:$shootpos}`${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "31" ] && orig_map="${orig_map:0:$shootpos}`${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
}
