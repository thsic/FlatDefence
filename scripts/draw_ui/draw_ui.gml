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
	draw_text(2, 52, "NextWave "+string(ceil(rest_time/FPS_DEFAULT)));
	
	//残りresttimeをバーで描画
	var rest_time_per = rest_time/REST_TIME;
	var rest_time_bar_maxwidth = 253;
	draw_set_color(c_gray);
	draw_rectangle(2, 68, 2+rest_time_bar_maxwidth*rest_time_per, 68+1, false);
	
	for(var i=0; i<SPAWN_ENEMY_TYPE_AMOUNT; i++){
		if(global.spawn_enemy[i, spawnenemy.objectid] != -1){
			//敵データ表示
			var target_objectid = i;
			var target_number = global.spawn_enemy[target_objectid, spawnenemy.number];
			var x_offset = 2;
			var y_offset = 72+i*42;
			tiny_window(s_enemyParamWindow, 4, x_offset, y_offset, 254, 40, 1);
			//パラメータ
			//四角描画
			draw_set_color(global.enemydata[target_number, enemydata.color]);
			var rectangle_size = 16
			if(target_number = 3 or target_number = 4 or target_number = 5){
				rectangle_size = 10;//smallのみ四角を小さく
			}
			else if(target_number = 21 or target_number = 22 or target_number = 23){
				rectangle_size = 20;
			}
			
			draw_rectangle(x_offset+18-rectangle_size/2, y_offset+20-rectangle_size/2, x_offset+18+rectangle_size/2, y_offset+20+rectangle_size/2, false);
			draw_set_color(COLOR_TEXT_WHITE);
			//draw_sprite(object_get_sprite(global.spawn_enemy[target_objectid, spawnenemy.objectid]), 0, x_offset+4+SPRITE_SIZE, y_offset+4+SPRITE_SIZE);
			
			if(global.draw_enemy_param_simple){//簡易表示 or 数値表示
				draw_set_color(global.enemydata[target_number, enemydata.hptextcolor]);
				draw_text(x_offset+62, y_offset+18, global.enemydata[target_number, enemydata.hprank]);
				draw_set_color(global.enemydata[target_number, enemydata.speedtextcolor]);
				draw_text(x_offset+230, y_offset+18, global.enemydata[target_number, enemydata.speedrank]);
				draw_set_color(global.enemydata[target_number, enemydata.shieldtextcolor]);
				draw_text(x_offset+150, y_offset+18, global.enemydata[target_number, enemydata.shieldrank]);
			}
			else{
				//draw_set_color(global.enemydata[target_number, enemydata.hptextcolor]);
				draw_text(x_offset+60, y_offset+18,string(global.enemydata[target_number, enemydata.hp]));
				//draw_set_color(global.enemydata[target_number, enemydata.speedtextcolor]);
				draw_text(x_offset+230, y_offset+18,global.enemydata[target_number, enemydata.speed]*10);//speedは*10して表示する
				//draw_set_color(global.enemydata[target_number, enemydata.shieldtextcolor]);
				draw_text(x_offset+146, y_offset+18,string(global.enemydata[target_number, enemydata.shield]));
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
			var amount_text_x = x_offset+124;
			if(string_width(global.enemydata[target_number, enemydata.name]) > 124-38){//名前が長いなら敵数表示をずらす
				amount_text_x = x_offset+string_width(global.enemydata[target_number, enemydata.name])+44;
			}
			draw_text(x_offset+38, y_offset+5, global.enemydata[target_number, enemydata.name]);
			draw_text(x_offset+amount_text_x, y_offset+5, "x");
			draw_set_color(COLOR_TEXT_GRAY);
			draw_text(x_offset+40, y_offset+21, "HP");
			draw_text(x_offset+104, y_offset+21, "Shield");
			draw_text(x_offset+186, y_offset+21, "Speed");
			draw_set_color(COLOR_TEXT_WHITE);
			//draw_set_color(COLOR_TEXT_WHITE_NEARGRAY);
			draw_set_font(FONT_DEFAULT);
			draw_text(x_offset+amount_text_x+10, y_offset+2,string(global.spawn_enemy[target_objectid, spawnenemy.amount]));
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
			tiny_window(s_enemyParamWindow, 4, x_offset, y_offset, 196, 40, 1);
			//四角描画
			draw_set_color(global.enemydata[target_number, enemydata.color]);
			var rectangle_size = 16
			if(target_number = 3 or target_number = 4 or target_number = 5){
				rectangle_size = 10;//smallのみ四角を小さく
			}
			else if(target_number = 21 or target_number = 22 or target_number = 23){
				rectangle_size = 20;
			}
			draw_rectangle(x_offset+18-rectangle_size/2, y_offset+20-rectangle_size/2, x_offset+18+rectangle_size/2, y_offset+20+rectangle_size/2, false);
			draw_set_color(COLOR_TEXT_WHITE);
			draw_text(x_offset+38, y_offset+12, global.enemydata[target_number, enemydata.name]);
			draw_text(x_offset+150, y_offset+12, "x");
			
			if(global.spawn_enemy[target_objectid, spawnenemy.amount] != 0){//敵数が0だと色を変える
				draw_set_color(COLOR_TEXT_BLUE);
			}
			else{
				draw_set_color(COLOR_TEXT_WHITE);
			}
			draw_text(x_offset+164, y_offset+12,string(global.spawn_enemy[target_objectid, spawnenemy.amount]));
			draw_set_color(COLOR_DEFAULT);
		}
	}
break
}


