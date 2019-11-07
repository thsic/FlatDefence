
for(var i=0; i<STAGESELECT_BUTTON_AMOUNT; i++){
	if(stage_select_button[i, stageselectbutton.state] = 0){
		tiny_window(s_window, 0, stage_select_button[i, stageselectbutton.window_x], stage_select_button[i, stageselectbutton.window_y], STAGESELECT_BUTTON_WIDTH, STAGESELECT_BUTTON_HEIGHT, 1);
		var x_offset = stage_select_button[i, stageselectbutton.window_x];
		var y_offset = stage_select_button[i, stageselectbutton.window_y];
		//draw_set_font()
		draw_text(x_offset+10, y_offset+16, "STAGE"+string(i));
		
	}
}
if(selecting_button != -1){
	tiny_window(s_window, 1, stage_select_button[selecting_button, stageselectbutton.window_x], stage_select_button[selecting_button, stageselectbutton.window_y], STAGESELECT_BUTTON_WIDTH+60, STAGESELECT_BUTTON_HEIGHT+20, 1);
	var x_offset = stage_select_button[selecting_button, stageselectbutton.window_x];
	var y_offset = stage_select_button[selecting_button, stageselectbutton.window_y];
	draw_text(x_offset+10, y_offset+16, "STAGE"+string(selecting_button));

	//ステージ情報表示する
	var sprite_x = 450;
	var sprite_y = 100;
	var width = 352;
	var height = 270;
	width *= 1.2;
	height *= 1.2;
	draw_rectangle(sprite_x, sprite_y, sprite_x+width, sprite_y+height, true);
	draw_set_halign(fa_middle);
	draw_set_color(COLOR_TEXT_WHITE);
	//var text_y = sprite_y+height+30;
	//draw_text(sprite_x+width/2, text_y, "STEGE"+string(selecting_button));
	global.stage = selecting_button;
	stage_setting();//ここでデータ代入
	draw_text(sprite_x+width/4, sprite_y-30, "Wave"+string(global.wave_total));
	draw_text(sprite_x+width/4*3, sprite_y-30, "Life"+string(global.life));
	
	draw_set_halign(fa_left);
}

