///@param itemid,defenderid

var item_id = argument0;
var defender_id = argument1;
var result = false
for(var i=0; i<defender_id.itemslot_amount; i++){
	if(global.itemdata[item_id, itemdata.upgraded] = -1){//アップグレードオーブ使用
		if(defender_id.itemslot[0] != -1){
			upgrade_item(defender_id);//少なくとも1つはアイテムを装備していないといけない
			result = true;//resultがtrueなのでお金を一旦消費するけど アップグレード画面にいってからでも返金可能
		}
		break
	}
	else if(defender_id.itemslot[i] = -1){//装備できるか確認
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
			if(global.itemdata[item_id, itemdata.effect] != -1){//エフェクトがあるか確認
				for(var j=0; j<EFFECT_SLOT_MAX; j++){
					if(defender_id.effect_now[j, effectnow.number] = -1){//空きスロットを見つける
						defender_id.effect_now[j, effectnow.number] = global.itemdata[item_id, itemdata.effect]
						defender_id.effect_now[j, effectnow.time] = -1;//効果時間無限
						//addeffect入れる
						if(global.effectdata[global.itemdata[item_id, itemdata.effect], effectdata.addeffect] != -1){
							 
							for(var k=0; k<EFFECT_SLOT_MAX; k++){
								if(defender_id.effect_now[k, effectnow.number] = -1){
									defender_id.effect_now[k, effectnow.number] = global.effectdata[global.itemdata[item_id, itemdata.effect], effectdata.addeffect];
									defender_id.effect_now[k, effectnow.time] = -1;
									break
								}
							}
						}
						break
					}
				}
			}
			
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