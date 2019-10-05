switch(global.gamestate){
case gamestate.main:
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
	
	
	speed = bullet_speed
	if(speed_temp != -1){
		speed = speed_temp;
		speed_temp = -1;
	}
	
	if(!penetration and !penetration_plus){
		//数fごとに角度を変える
		--direction_change_cooldown;
		if(direction_change_cooldown >= 0){
			if(instance_exists(bullet_target)){//存在チェック
				direction = point_direction(x, y, bullet_target.x, bullet_target.y);
				direction_change_cooldown = direction_change_cooldown_default;
			}
			else{
				destroy_countdown = destroy_countdown_default;//ターゲットが存在しないので消滅
			}
		}
	}
	else{
		//貫通攻撃は射程外になると消える
		if(point_distance(x, y, defender_id.x, defender_id.y)+speed > defender_id.range){
			instance_destroy();
		}
	}
break
case gamestate.pause://ポーズされたら止まる
	if(speed_temp = -1){
		speed_temp = speed;//speed_tempに一時的に保存
		speed = 0;
	}
break
case gamestate.rest:
	instance_destroy()//ステージが終わったので消す
break
}

if(destroy_countdown > 0){//消える
	if(point_distance(x, y, defender_id.x, defender_id.y)+speed > defender_id.range){//射程外になると消える
		instance_destroy();
	}
	speed = destroy_countdown/destroy_countdown_default*bullet_speed
	destroy_countdown--;
}
else if(destroy_countdown = 0){
	instance_destroy()
}
