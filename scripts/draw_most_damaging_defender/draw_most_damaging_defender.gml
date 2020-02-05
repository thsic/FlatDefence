///@param x,y
var _x = argument0;
var _y = argument1;
var _time = 90
var _font = FONT_DEFAULT

var defender_amount = instance_number(o_defender);
var most_damaging_defender_id = -1;//一番すごいやつのid
var most_damaging_defender_totaldamage = 0//一番すごいやつが出したダメージ

//だれが一番すごいか比べる
for(var i=0; i<defender_amount; i++){
	var finded_defender = instance_find(o_defender, i)
	if(finded_defender.total_damage > most_damaging_defender_totaldamage){
		most_damaging_defender_id = finded_defender;
		most_damaging_defender_totaldamage = finded_defender.total_damage;
	}
}


//一番すごいやつが決まったのでそれを描画
if(most_damaging_defender_id != -1){
	with(instance_create_layer(_x, _y, "UI", o_effect)){
		type = 10;
		no1_defender_id = most_damaging_defender_id;
		time_default = _time
		time = _time
		text_font = _font
	}

}

