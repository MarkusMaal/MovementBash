function map_ifcheck {
	[ "$position" = "41" ] && position="$last"
	[ "$position" = "51" ] && finish="True"
	[ "$position2" = "" ] && finish="True"
	[ "${orig_map:$position:1}" = "#" ] && position="$last"
	[ "${orig_map:$position2:1}" = "#" ] && position2="$last2"
	[ "${orig_map:$shootpos:1}" = "#" ] && endshoot="true"
	[ "$position" = "39" ] && orig_map="${orig_map:0:$position}'${orig_map:$(($position+1)):$((160-$position))}"
	[ "$position" = "58" ] && orig_map="${orig_map:0:$position}'${orig_map:$(($position+1)):$((160-$position))}"
	[ "$position" = "79" ] && orig_map="${orig_map:0:$position}'${orig_map:$(($position+1)):$((160-$position))}"
	[ "$position" = "118" ] && orig_map="${orig_map:0:$position}'${orig_map:$(($position+1)):$((160-$position))}"
	[ "$position" = "135" ] && orig_map="${orig_map:0:$position}'${orig_map:$(($position+1)):$((160-$position))}"
	[ "$position" = "112" ] && orig_map="${orig_map:0:$position}'${orig_map:$(($position+1)):$((160-$position))}"
	[ "$position" = "129" ] && orig_map="${orig_map:0:$position}'${orig_map:$(($position+1)):$((160-$position))}"
	[ "$position" = "106" ] && orig_map="${orig_map:0:$position}'${orig_map:$(($position+1)):$((160-$position))}"
	[ "$position" = "123" ] && orig_map="${orig_map:0:$position}'${orig_map:$(($position+1)):$((160-$position))}"
	[ "$position2" = "39" ] && orig_map="${orig_map:0:$position2}'${orig_map:$(($position2+1)):$((160-$position2))}"
	[ "$position2" = "58" ] && orig_map="${orig_map:0:$position2}'${orig_map:$(($position2+1)):$((160-$position2))}"
	[ "$position2" = "79" ] && orig_map="${orig_map:0:$position2}'${orig_map:$(($position2+1)):$((160-$position2))}"
	[ "$position2" = "118" ] && orig_map="${orig_map:0:$position2}'${orig_map:$(($position2+1)):$((160-$position2))}"
	[ "$position2" = "135" ] && orig_map="${orig_map:0:$position2}'${orig_map:$(($position2+1)):$((160-$position2))}"
	[ "$position2" = "112" ] && orig_map="${orig_map:0:$position2}'${orig_map:$(($position2+1)):$((160-$position2))}"
	[ "$position2" = "129" ] && orig_map="${orig_map:0:$position2}'${orig_map:$(($position2+1)):$((160-$position2))}"
	[ "$position2" = "106" ] && orig_map="${orig_map:0:$position2}'${orig_map:$(($position2+1)):$((160-$position2))}"
	[ "$position2" = "123" ] && orig_map="${orig_map:0:$position2}'${orig_map:$(($position2+1)):$((160-$position2))}"
	[[ "$orig_map" == *1* ]] && return
	[[ "$orig_map" == *2* ]] && return
	[[ "$orig_map" == *3* ]] && return
	[[ "$orig_map" == *4* ]] && return
	[[ "$orig_map" == *5* ]] && return
	[[ "$orig_map" == *6* ]] && return
	[[ "$orig_map" == *7* ]] && return
	[[ "$orig_map" == *8* ]] && return
	[[ "$orig_map" == *9* ]] && return
	[ "$position" = "19" ] && finish="True"
	[ "$position2" = "19" ] && finish="True"
}
