///@param id
//objectidをenemyidに変換する

var original_id = argument0;

if(!is_real(original_id)){
	sdm("error! enemy_id_conversion")
}

for(var i=0; i<global.enemy_category_amount; i++){
	if(original_id = global.enemydata[i, enemydata.object]){
		return i
		break
	}
}

