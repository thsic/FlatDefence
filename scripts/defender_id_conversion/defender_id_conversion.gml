///@param id
//objectidをdefenderidに変換する

var original_id = argument0;

if(!is_real(original_id)){
	sdm("error! defender_id_conversion")
}

for(var i=0; i<global.defender_category_amount; i++){
	if(original_id = global.defender_data[i, data.object]){
		return i
		break
	}
}

