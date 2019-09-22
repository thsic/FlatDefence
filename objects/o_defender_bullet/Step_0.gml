if(global.gamestate = gamestate.main){
	speed = bullet_speed
	if(speed_temp != -1){
		speed = speed_temp;
		speed_temp = -1;
	}
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
else if(global.gamestate = gamestate.pause){//ポーズされたら止まる
	if(speed_temp = -1){
		speed_temp = speed;//speed_tempに一時的に保存
		speed = 0;
	}
}

if(destroy_countdown > 0){
	speed = destroy_countdown/destroy_countdown_default*bullet_speed
	destroy_countdown--;
}
else if(destroy_countdown = 0){
	instance_destroy()
}
