///@param itemid,defenderid

var item_id = argument0;
var defender_id = argument1;
var result = false
for(var i=0; i<defender_id.itemslot_amount; i++){
	if(defender_id.itemslot[i] = -1){//装備できるか確認
		defender_id.itemslot[i] = item_id;
		//なんか処理があるならここでいれる
		defender_id.equipped_item[item_id] = true;
		result = true
		break
	}
}
sdm(result)
return result