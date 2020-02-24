//if(x > room_width-(sprite_width/2))instance_destroy();


if(global.gamestate = gamestate.main){
	if(speed_temp != -1){
		path_speed = 1;
		speed_temp = -1;
	}
	
	if(freeze_time != -1){
		var freeze_power = 1
		for(var i=0; i<freeze_lv; i++){
			freeze_power *= FREEZE_SLOW_PERCENT;
		}
		
		path_speed = global.enemydata[enemy_number, enemydata.speed]*freeze_power//スロー
		freeze_time--;
	}
	else{
		freeze_lv = 0
		path_speed = global.enemydata[enemy_number, enemydata.speed];
	}

}
else{//ポーズ中とか
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
	var break_color = global.enemydata[enemy_number, enemydata.color];
	enemy_break_effect(x, y, 6, break_color, 20, 7, 3.5, -1);
	play_se(SE_ENEMY_DESTROY, 40, 0.15);
	instance_destroy();
}
