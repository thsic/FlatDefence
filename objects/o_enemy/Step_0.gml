//if(x > room_width-(sprite_width/2))instance_destroy();

var _path_speed = 0;
if(global.gamestate = gamestate.main){
	if(speed_temp != -1){
		_path_speed = 1;
		speed_temp = -1;
	}
	var freeze_slow_percent = FREEZE_SLOW_PERCENT
	if(freeze_time != -1){
		var freeze_power = 1
		switch(enemy_number){
		case 9:
		case 10:
		case 11:
		case 12:
		case 13:
		case 14:
		case 18:
		case 19:
		case 20:
			freeze_slow_percent = (1-FREEZE_SLOW_PERCENT)*0.5+FREEZE_SLOW_PERCENT;//半減
		break
		case 21://boss
		case 22:
		case 23:
			freeze_slow_percent = (1-FREEZE_SLOW_PERCENT)*0.33+FREEZE_SLOW_PERCENT;
		break
		}
		
		sdm(freeze_slow_percent)
		for(var i=0; i<freeze_lv; i++){
			freeze_power *= freeze_slow_percent;
		}
		
		
		
		_path_speed = global.enemydata[enemy_number, enemydata.speed]*freeze_power//スロー
		freeze_time--;
	}
	else{
		freeze_lv = 0
		_path_speed = global.enemydata[enemy_number, enemydata.speed];
	}

}
else{//ポーズ中とか
	if(speed_temp = -1){
		speed_temp = path_speed;
		_path_speed = 0;
	}
}
//バーサーカー限定
if(enemy_number = 15 or enemy_number = 16 or enemy_number = 17){
	if(hp/hp_max < 0.5){//hpが半分以下なら
		switch(enemy_number){
		case 15:
			_path_speed *= BERSERKER_LV1_RAGE_SPEED
		break
		case 16:
			_path_speed *= BERSERKER_LV2_RAGE_SPEED
		break
		case 17:
			_path_speed *= BERSERKER_LV3_RAGE_SPEED
		break
		default:
			sdm("Error! o_enemy");
		break
		}
	}
}

//リジェネ
if(global.gamestate = gamestate.main){
	if(enemy_number = 18 or enemy_number = 19 or enemy_number = 20){
		if(hp < hp_max){//hpが減っているなら回復
			switch(enemy_number){
			case 18:
				hp += REGEN_LV1_HEAL;
				global.all_enemy_total_hp += REGEN_LV1_HEAL;
			break
			case 19:
				hp += REGEN_LV2_HEAL;
				global.all_enemy_total_hp += REGEN_LV2_HEAL;
			break
			case 20:
				hp += REGEN_LV3_HEAL;
				global.all_enemy_total_hp += REGEN_LV3_HEAL;
			break
			default:
				sdm("Error! o_enemy");
			break
			}
			if(hp > hp_max){//hpが最大値より増えたら最大値まで下げる
				global.all_enemy_total_hp -= hp-hp_max;
				hp = hp_max
			}
		}
	}
}
path_speed = _path_speed;

var reaching_goal = false
if(path_position = 1){//最後まで到達した
	damage_to_player_life();
	destroy_enemy = true;
	reaching_goal = true
}

if(destroy_enemy = true){//死亡時処理
	global.enemy_wave_total_amount--;
	if(global.enemy_last_dead_position_x = 0){
		global.enemy_last_dead_position_x = x;
		global.enemy_last_dead_position_y = y-32//誰も倒せてない場合の例外処理
	}
	for(var i=0; i<SPAWN_ENEMY_TYPE_AMOUNT; i++){
		if(global.spawn_enemy[i, spawnenemy.objectid] = object_index){
			global.spawn_enemy[i, spawnenemy.amount]--;
		}
	}
	var break_color = global.enemydata[enemy_number, enemydata.color];
	if(!reaching_goal){
		enemy_break_effect(x, y, 6, break_color, 20, 7, 3.5, -1);
		play_se(SE_ENEMY_DESTROY, 40, 0.18, true);
	}
	instance_destroy();
}

if(path_id = -1){
	path_id = path_index;
}
