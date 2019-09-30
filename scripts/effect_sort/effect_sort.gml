///@param id
//エフェクトソート
var defender_id = argument0;
var effect_count = 0
for(var i=0; i<EFFECT_SLOT_MAX; i++){
	if(defender_id.effect_now[i, effectnow.number] != -1){
		effect_count++//エフェクトの数
		
	}
}

var effect_sort_necessary = false;
for(var i=0; i<effect_count; i++){
	if(defender_id.effect_now[i, effectnow.number] = -1){
		effect_sort_necessary = true//ソートが必要
	}
}


var effect_sort_count = 0;
var effect_sort_temp = 0;
if(effect_sort_necessary){//ソート実行
	for(var i=0; i<EFFECT_SLOT_MAX; i++){//まず-1を全部にいれる
		effect_sort_temp[i, effectnow.number] = -1;
	}
	for(var i=0; i<EFFECT_SLOT_MAX; i++){
		if(defender_id.effect_now[i, effectnow.number] != -1){//一旦エフェクトだけをeffect_sort_tempにいれてから
			effect_sort_temp[effect_sort_count, effectnow.number] = defender_id.effect_now[i, effectnow.number];
			effect_sort_temp[effect_sort_count, effectnow.time] = defender_id.effect_now[i, effectnow.time];
			effect_sort_count++;
		}
	}
	//effect_sort_tempをそのままeffect_nowにする
	defender_id.effect_now = effect_sort_temp
}