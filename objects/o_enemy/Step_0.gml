//if(x > room_width-(sprite_width/2))instance_destroy();


if(global.gamestate = gamestate.main){
	if(speed_temp != -1){
		path_speed = 1;
		speed_temp = -1;
	}
}
else{
	if(speed_temp = -1){
		speed_temp = path_speed;
		path_speed = 0;
	}
}
if(path_position = 1){//最後まで到達した
	destroy_enemy = true
}

if(destroy_enemy = true){//死亡時処理
	global.enemy_wave_total_amount--;
	instance_destroy();
}
