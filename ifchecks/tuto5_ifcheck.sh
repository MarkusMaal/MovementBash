function map_ifcheck {
	[ "$shootpos" = "76" ] && orig_map="${orig_map:0:$shootpos}\`${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "56" ] && orig_map="${orig_map:0:$shootpos}\`${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "58" ] && orig_map="${orig_map:0:$shootpos}\`${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "78" ] && orig_map="${orig_map:0:$shootpos}\`${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "38" ] && orig_map="${orig_map:0:$shootpos}\`${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "35" ] && orig_map="${orig_map:0:$shootpos}\`${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "27" ] && orig_map="${orig_map:0:$shootpos}\`${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "28" ] && orig_map="${orig_map:0:$shootpos}\`${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "29" ] && orig_map="${orig_map:0:$shootpos}\`${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "30" ] && orig_map="${orig_map:0:$shootpos}\`${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "31" ] && orig_map="${orig_map:0:$shootpos}\`${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "32" ] && orig_map="${orig_map:0:$shootpos}\`${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "52" ] && orig_map="${orig_map:0:$shootpos}\`${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "51" ] && orig_map="${orig_map:0:$shootpos}\`${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "50" ] && orig_map="${orig_map:0:$shootpos}\`${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "49" ] && orig_map="${orig_map:0:$shootpos}\`${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "48" ] && orig_map="${orig_map:0:$shootpos}\`${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "47" ] && orig_map="${orig_map:0:$shootpos}\`${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "46" ] && orig_map="${orig_map:0:$shootpos}\`${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "26" ] && orig_map="${orig_map:0:$shootpos}\`${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "25" ] && orig_map="${orig_map:0:$shootpos}\`${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "45" ] && orig_map="${orig_map:0:$shootpos}\`${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "44" ] && orig_map="${orig_map:0:$shootpos}\`${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "24" ] && orig_map="${orig_map:0:$shootpos}\`${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "23" ] && orig_map="${orig_map:0:$shootpos}\`${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "43" ] && orig_map="${orig_map:0:$shootpos}\`${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "42" ] && orig_map="${orig_map:0:$shootpos}\`${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "22" ] && orig_map="${orig_map:0:$shootpos}\`${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "21" ] && orig_map="${orig_map:0:$shootpos}\`${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "41" ] && orig_map="${orig_map:0:$shootpos}\`${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "73" ] && orig_map="${orig_map:0:$shootpos}\`${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "72" ] && orig_map="${orig_map:0:$shootpos}\`${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "71" ] && orig_map="${orig_map:0:$shootpos}\`${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "70" ] && orig_map="${orig_map:0:$shootpos}\`${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "67" ] && orig_map="${orig_map:0:$shootpos}\`${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "65" ] && orig_map="${orig_map:0:$shootpos}\`${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "${orig_map:$position:1}" = "T" ] && position="$last"
	[ "${orig_map:$position2:1}" = "T" ] && position2="$last2"
	[ "${orig_map:$position:1}" = "#" ] && position="$last"
	[ "${orig_map:$position2:1}" = "#" ] && position2="$last2"
	[ "${orig_map:$shootpos:1}" = "#" ] && endshoot="true"
	[[ "$orig_map" == *T* ]] && return
	[ "$position" = "61" ] && finish="True"
	[ "$position2" = "61" ] && finish="True"
}
