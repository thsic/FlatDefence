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
	for(var i=0; i<100; i++){
		if(penetration_enemy_id[i] = other){
			enemy_id_check = false//被りがあった
		}
	}
	if(enemy_id_check){//被りがなかった
		for(var i=0; i<100; i++){
			if(penetration_enemy_id[i] = -1){
				penetration_enemy_id[i] = other;//当たった敵を記録する
				if(!penetration_plus){
					//弱貫通攻撃は敵接触回数を超えると消える
					if(i+1 >= global.effectdata[6, effectdata.value]*penetration){
						instance_destroy();
					}
				}
				break
			}
		}
		damage_to_enemy(damage, other, defender_id);
	}
}