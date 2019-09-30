var penetration = 0;
var penetration_plus = 0;
for(var i=0; i<EFFECT_SLOT_MAX; i++){
	if(defender_id.effect_now[i, effectnow.number] != -1){
		//何かしらのエフェクトがある
		switch(defender_id.effect_now[i, effectnow.number]){
		case 6:
			penetration++;
		break
		case 7:
			penetration_plus++;
		break
		}
	}
	else{
		break
	}
}

if(!penetration and !penetration_plus){
	if(other = bullet_target){
		damage_to_enemy(damage, bullet_target, defender_id);
		instance_destroy();
	}
}
else{
	var enemy_id_check = true//以前当たった敵と被りがないか
	for(var i=0; i<IMPERIALLANCE_PENETRATION_MAX; i++){
		if(penetration_enemy_id[i] = other){
			enemy_id_check = false//被りがあった
		}
	}
	if(enemy_id_check){//被りがなかった
		if(penetration_plus){
			//貫通攻撃は一定の敵接触回数を超えると消える
			var penetration_count_max = IMPERIALLANCE_PENETRATION_MAX;
		}
		else{
			var penetration_count_max = global.effectdata[6, effectdata.value]*penetration;
		}
		
		for(var i=0; i<IMPERIALLANCE_PENETRATION_MAX; i++){
			if(penetration_enemy_id[i] = -1){
				penetration_enemy_id[i] = other;//当たった敵を記録する

				if(i+1 >= penetration_count_max){
					instance_destroy();
				}
				
				break
			}
		}
		damage_to_enemy(damage, other, defender_id);
	}
}