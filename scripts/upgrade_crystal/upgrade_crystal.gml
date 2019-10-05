///@param defender_id

var object_id = argument0;
var defender_number = object_id.defender_number;

switch(defender_number){
case 0://basic
	var effect_id = 24;
break
case 1://sniper
	var effect_id = 25;
break
case 2://bomber
	var effect_id = 26;
break
case 3://freezer
	var effect_id = 27;
break
case 4://blaster
	var effect_id = 28;
break
case 5://thief
	var effect_id = 29;
break
default:
	var effect_id = 0;
	sdm("error! upgrade_crystal")
break
}
for(var i=0; i<EFFECT_SLOT_MAX; i++){
	if(object_id.effect_now[i, effectnow.number] = -1){//空きスロットを見つける
		object_id.effect_now[i, effectnow.number] = effect_id
		object_id.effect_now[i, effectnow.time] = -1;//効果時間無限
		//addeffect入れる
		if(global.effectdata[effect_id, effectdata.addeffect] != -1){
			
			for(var j=0; j<EFFECT_SLOT_MAX; j++){
				if(object_id.effect_now[j, effectnow.number] = -1){
					object_id.effect_now[j, effectnow.number] = global.effectdata[effect_id, effectdata.addeffect];
					object_id.effect_now[j, effectnow.time] = -1;
					break
				}
			}
		}
		break
	}
}
