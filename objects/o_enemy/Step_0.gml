//if(x > room_width-(sprite_width/2))instance_destroy();


if(global.gamestate = gamestate.main){
	if(speed_temp != -1){
		path_speed = 1;
		speed_temp = -1;
	}
	
	if(freeze_time != -1){
		var freeze_power = 1
		for(var i=0; i<freeze_lv; i++){
			freeze_power *= 0.5
		}
		path_speed = global.enemydata[enemy_number, enemydata.speed]*freeze_power//スロー
		freeze_time--;
	}
	else{
		freeze_lv = 0
		path_speed = global.enemydata[enemy_number, enemydata.speed];
	}

}
else{
	if(speed_temp = -1){
		speed_temp = path_speed;
		path_speed = 0;
	}
}

if(path_position = 1){//最後まで到達した
	damage_to_player_life();
	destroy_enemy = true;
}

if(destroy_enemy = true){//死亡時処理
	global.enemy_wave_total_amount--;
	for(var i=0; i<SPAWN_ENEMY_TYPE_AMOUNT; i++){
		if(global.spawn_enemy[i, spawnenemy.objectid] = object_index){
			global.spawn_enemy[i, spawnenemy.amount]--;
		}
	}
	instance_destroy();
}
