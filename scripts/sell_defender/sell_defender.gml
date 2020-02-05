///@param id

var sell_id = argument0;

var get_gold = 0;

for(var i=0; i<sell_id.itemslot_amount; i++){
	if(sell_id.itemslot[i] != -1){
		 get_gold += global.itemdata[sell_id.itemslot[i], itemdata.cost];
	}
	else{
		break
	}
}
get_gold += global.defender_data[sell_id.defender_number, data.cost];

global.score_gold_minus += get_gold;//売却ゴールドはクリア時のスコアに加算されない
global.gold += get_gold;

//弾消す
for(var i=0; i<instance_number(o_defender_bullet); i++){
	if(instance_find(o_defender_bullet, i).defender_id = finded_defender_id){
		instance_destroy(instance_find(o_defender_bullet, i));
	}
}

//defendermarkerを設置可能に
var marker_id = instance_position(finded_defender_id.x, finded_defender_id.y, o_defenderMarker)
if(marker_id != 0){
	marker_id.on_defender = false;
}

//defender消す
instance_destroy(finded_defender_id);


