//uiとかを描画

draw_set_color(COLOR_TEXT_STAGEUI);
draw_text(0, 0, "Stage"+string(global.stage)+" Wave"+string(global.wave_now)+"/"+string(global.wave_total));

//lifeの残量に応じてライフの色を変える
var change_color = 5//hpがこの値以下だと色を変える
if(global.life <= change_color){
	draw_set_color(merge_color(COLOR_TEXT_RED, COLOR_TEXT_STAGEUI, global.life/change_color))
}
draw_text(0, 20, "Life");
draw_text(50, 20, string(global.life));

draw_set_color(COLOR_TEXT_LTGRAY)
draw_set_font(FONT_DEFAULT);
switch(global.gamestate){
case gamestate.rest://休憩タイム
case gamestate.restpause:
	//draw_set_color(COLOR_TEXT_GRAY)
	draw_text(0, 52, "NextWave "+string(ceil(rest_time/FPS_DEFAULT)));
	
	//残りresttimeをバーで描画
	var rest_time_per = rest_time/REST_TIME;
	var rest_time_bar_maxwidth = 272;
	draw_set_color(c_gray);
	draw_rectangle(2, 68, 2+rest_time_bar_maxwidth*rest_time_per, 68+1, false);
	
	for(var i=0; i<SPAWN_ENEMY_TYPE_AMOUNT; i++){
		if(global.spawn_enemy[i, spawnenemy.objectid] != -1){
			//敵データ表示
			var target_objectid = i;
			var target_number = global.spawn_enemy[target_objectid, spawnenemy.number];
			var x_offset = 2;
			var y_offset = 72+i*42;
			tiny_window(s_enemyParamWindow, 4, x_offset, y_offset, 272, 40, 1);
			//パラメータ
			draw_set_color(COLOR_TEXT_WHITE);
			draw_sprite(object_get_sprite(global.spawn_enemy[target_objectid, spawnenemy.objectid]), 0, x_offset+4+SPRITE_SIZE, y_offset+4+SPRITE_SIZE);
			
			if(global.draw_enemy_param_simple){//簡易表示 or 数値表示
				draw_set_color(global.enemydata[target_number, enemydata.hptextcolor]);
				draw_text(x_offset+62, y_offset+18, global.enemydata[target_number, enemydata.hprank]);
				draw_set_color(global.enemydata[target_number, enemydata.speedtextcolor]);
				draw_text(x_offset+238, y_offset+18, global.enemydata[target_number, enemydata.speedrank]);
				draw_set_color(global.enemydata[target_number, enemydata.shieldtextcolor]);
				draw_text(x_offset+156, y_offset+18, global.enemydata[target_number, enemydata.shieldrank]);
			}
			else{
				//draw_set_color(global.enemydata[target_number, enemydata.hptextcolor]);
				draw_text(x_offset+62, y_offset+18,string(global.enemydata[target_number, enemydata.hp]));
				//draw_set_color(global.enemydata[target_number, enemydata.speedtextcolor]);
				if(frac(global.enemydata[target_number, enemydata.speed]) != 0){//小数点以下があるかどうかで表示方法が変わる
					draw_text(x_offset+238, y_offset+18,string_format(global.enemydata[target_number, enemydata.speed], 1, 1));
				}
				else{
					draw_text(x_offset+238, y_offset+18,string(global.enemydata[target_number, enemydata.speed]));
				}
				//draw_set_color(global.enemydata[target_number, enemydata.shieldtextcolor]);
				draw_text(x_offset+156, y_offset+18,string(global.enemydata[target_number, enemydata.shield]));
			}
			//----------------
			draw_set_font(FONT_ENEMY_UI_PARAM);
			if(global.draw_enemy_param_simple){
				draw_set_color(COLOR_TEXT_WHITE);
			}
			else{
				draw_set_color(COLOR_TEXT_LTGRAY_ONWINDOW);
			}
			draw_set_color(COLOR_TEXT_WHITE_NEARGRAY);
			draw_text(x_offset+38, y_offset+5, global.enemydata[target_number, enemydata.name]);
			draw_text(x_offset+124, y_offset+5, "x");
			draw_set_color(COLOR_TEXT_GRAY);
			
			draw_text(x_offset+40, y_offset+21, "HP");
			draw_text(x_offset+112, y_offset+21, "Shield");
			draw_text(x_offset+196, y_offset+21, "Speed");
			draw_set_color(COLOR_TEXT_BLUE);
			draw_set_font(FONT_DEFAULT);
			draw_text(x_offset+132, y_offset+2,string(global.spawn_enemy[target_objectid, spawnenemy.amount]));
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
			tiny_window(s_enemyParamWindow, 4, x_offset, y_offset, 186, 40, 1);
			draw_set_color(COLOR_TEXT_WHITE);
			draw_sprite(object_get_sprite(global.spawn_enemy[target_objectid, spawnenemy.objectid]), 0, x_offset+4+SPRITE_SIZE, y_offset+4+SPRITE_SIZE);
			draw_text(x_offset+38, y_offset+12, global.enemydata[target_number, enemydata.name]);
			draw_text(x_offset+140, y_offset+12, "x");
			draw_set_color(COLOR_TEXT_BLUE);
			draw_text(x_offset+154, y_offset+12,string(global.spawn_enemy[target_objectid, spawnenemy.amount]));
			draw_set_color(COLOR_DEFAULT);
		}
	}
break
}






