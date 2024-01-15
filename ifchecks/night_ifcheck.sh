function map_ifcheck {
	[ "$position" = "99" ] && finish="True"
	[ "$position2" = "" ] && finish="True"
	[ "$shootpos" = "66" ] && orig_map="${orig_map:0:$shootpos}#${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "87" ] && orig_map="${orig_map:0:$shootpos}#${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "88" ] && orig_map="${orig_map:0:$shootpos}#${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "89" ] && orig_map="${orig_map:0:$shootpos}#${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "70" ] && orig_map="${orig_map:0:$shootpos}#${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "48" ] && orig_map="${orig_map:0:$shootpos}#${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
}
