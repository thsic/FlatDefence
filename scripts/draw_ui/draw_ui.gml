//uiとかを描画

draw_set_color(COLOR_TEXT_WHITE);
draw_text(0, 0, "Stage"+string(global.stage)+" Wave"+string(global.wave_now));
draw_text(50, 20, string(global.life));
//draw_set_color(COLOR_TEXT_PURPLE);
draw_text(0, 20, "Life");

draw_set_color(COLOR_TEXT_WHITE)
switch(global.gamestate){
case gamestate.rest://休憩タイム
case gamestate.restpause:
	//draw_set_color(COLOR_TEXT_GRAY)
	draw_text(0, 52, "NextWave "+string(floor(rest_time/FPS_DEFAULT)));
	for(var i=0; i<SPAWN_ENEMY_TYPE_AMOUNT; i++){
		if(global.spawn_enemy[i, spawnenemy.objectid] != -1){
			//敵データ表示
			var target_objectid = i;
			var target_number = global.spawn_enemy[target_objectid, spawnenemy.number];
			var x_offset = 2;
			var y_offset = 72+i*42;
			tiny_window(s_window, 4, x_offset, y_offset, 260, 40, 1);
			draw_set_color(COLOR_TEXT_WHITE);
			draw_sprite(object_get_sprite(global.spawn_enemy[target_objectid, spawnenemy.objectid]), 0, x_offset+4+SPRITE_SIZE, y_offset+4+SPRITE_SIZE);
			draw_text(x_offset+38, y_offset+2, global.enemydata[target_number, enemydata.name]);
			draw_text(x_offset+60, y_offset+18,string(global.enemydata[target_number, enemydata.hp]));
			draw_text(x_offset+240, y_offset+18,string(global.enemydata[target_number, enemydata.speed]));
			draw_text(x_offset+164, y_offset+18,string(global.enemydata[target_number, enemydata.shield]));
			draw_text(x_offset+110, y_offset+2, "x");
			draw_set_color(COLOR_TEXT_GRAY);
			draw_text(x_offset+38, y_offset+18, "HP");
			draw_text(x_offset+106, y_offset+18, "Shield");
			draw_text(x_offset+190, y_offset+18, "Speed");
			draw_set_color(COLOR_TEXT_BLUE);
			draw_text(x_offset+140, y_offset+2,string(global.spawn_enemy[target_objectid, spawnenemy.amount]));
			draw_set_color(COLOR_DEFAULT);
		}
	}
break

case gamestate.main:
case gamestate.waveclear:
case gamestate.wavestart:
case gamestate.pause:

	for(var i=0; i<SPAWN_ENEMY_TYPE_AMOUNT; i++){
		if(global.spawn_enemy[i, spawnenemy.objectid] != -1){
			var target_objectid = i;
			var target_number = global.spawn_enemy[target_objectid, spawnenemy.number];
			var x_offset = 2;
			var y_offset = 72+i*42;
			tiny_window(s_window, 4, x_offset, y_offset, 176, 40, 1);
			draw_set_color(COLOR_TEXT_WHITE);
			draw_sprite(object_get_sprite(global.spawn_enemy[target_objectid, spawnenemy.objectid]), 0, x_offset+4+SPRITE_SIZE, y_offset+4+SPRITE_SIZE);
			draw_text(x_offset+38, y_offset+12, global.enemydata[target_number, enemydata.name]);
			draw_text(x_offset+110, y_offset+12, "x");
			draw_set_color(COLOR_TEXT_BLUE);
			draw_text(x_offset+140, y_offset+12,string(global.spawn_enemy[target_objectid, spawnenemy.amount]));
			draw_set_color(COLOR_DEFAULT);
		}
	}
break
}






