///@param itemid,defenderid

var item_id = argument0;
var defender_id = argument1;
var result = false
for(var i=0; i<defender_id.itemslot_amount; i++){
	if(defender_id.itemslot[i] = -1){//装備できるか確認
		if(global.itemdata[item_id, itemdata.skill] != -1){//アイテムがスキル装備なら
			if(defender_id.skill_id = -1){//defenderがスキルを装備していないなら
				defender_id.itemslot[i] = item_id;
				defender_id.equipped_item[item_id] = true;
				defender_id.skill_id = global.itemdata[item_id, itemdata.skill];
				defender_id.skill_cooldown = global.skilldata[global.itemdata[item_id, itemdata.skill], skilldata.cooldown];//cdセット
				result = true
			}
		}
		else{//通常装備
			defender_id.itemslot[i] = item_id;
			//なんか処理があるならここでいれる
			defender_id.equipped_item[item_id] = true;
			result = true
		}
		break
	}
}
if(result){
	sdm(string(global.itemdata[item_id, itemdata.name]) + "を装備")
}
return result