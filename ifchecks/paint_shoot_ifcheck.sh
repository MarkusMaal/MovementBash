function map_ifcheck {
	[ "$position" = "False" ] && finish="True"
	[ "$position2" = "" ] && finish="True"
	[ "$position2" = "" ] && finish="True"
	[ "$position2" = "" ] && finish="True"
	[ "$position2" = "" ] && finish="True"
	[ "$position2" = "" ] && finish="True"
	shoot=1
	[ "$shootpos" = "0" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "20" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "40" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "60" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "80" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "81" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "61" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "41" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "21" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "1" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "2" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "22" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "42" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "62" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "82" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "83" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "63" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "43" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "23" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "3" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "4" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "24" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "44" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "64" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "84" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "84" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "85" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "65" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "45" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "25" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "5" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "6" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "26" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "46" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "66" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "86" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "87" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "67" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "47" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "27" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "7" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "7" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "8" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "28" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "48" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "68" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "88" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "88" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "89" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "69" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "49" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "29" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "9" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "9" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "10" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "30" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "50" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "70" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "90" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "90" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "91" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "71" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "51" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "31" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "11" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "11" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "12" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "32" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "52" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "72" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "92" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "92" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "93" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "73" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "53" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "33" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "13" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "13" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "13" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "14" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "34" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "54" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "74" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "94" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "95" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "94" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "75" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "55" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "35" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "35" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "15" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "16" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "36" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "56" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "76" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "96" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "97" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "77" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "57" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "37" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "17" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "18" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "38" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "58" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "78" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "98" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "99" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "79" ] && orig_map="${orig_map:0:$shootpos}'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "59" ] && orig_map="${orig_map:0:$shootpos}\#${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "39" ] && orig_map="${orig_map:0:$shootpos}\#${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "19" ] && orig_map="${orig_map:0:$shootpos}\#${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "79" ] && orig_map="${orig_map:0:$shootpos}\#${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "99" ] && orig_map="${orig_map:0:$shootpos}\#${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "40" ] && orig_map="${orig_map:0:$shootpos}\#${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "60" ] && orig_map="${orig_map:0:$shootpos}\#${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "80" ] && orig_map="${orig_map:0:$shootpos}\#${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "20" ] && orig_map="${orig_map:0:$shootpos}\#${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "0" ] && orig_map="${orig_map:0:$shootpos}\#${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "0" ] && orig_map="${orig_map:0:$shootpos}\'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "20" ] && orig_map="${orig_map:0:$shootpos}\'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "40" ] && orig_map="${orig_map:0:$shootpos}\'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "60" ] && orig_map="${orig_map:0:$shootpos}\'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "80" ] && orig_map="${orig_map:0:$shootpos}\'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "79" ] && orig_map="${orig_map:0:$shootpos}\'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "99" ] && orig_map="${orig_map:0:$shootpos}\'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "59" ] && orig_map="${orig_map:0:$shootpos}\'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "39" ] && orig_map="${orig_map:0:$shootpos}\'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
	[ "$shootpos" = "19" ] && orig_map="${orig_map:0:$shootpos}\'${orig_map:$(($shootpos+1)):$((100-$shootpos))}"
}
