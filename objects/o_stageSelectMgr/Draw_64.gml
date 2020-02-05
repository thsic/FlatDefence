draw_set_color(COLOR_BACKGROUND);
draw_rectangle(0, 0, room_width, room_height, false);

for(var i=0; i<STAGESELECT_BUTTON_AMOUNT; i++){
	if(stage_select_button[i, stageselectbutton.state] = 0){
		tiny_window(s_window, 0, stage_select_button[i, stageselectbutton.window_x], stage_select_button[i, stageselectbutton.window_y], STAGESELECT_BUTTON_WIDTH, STAGESELECT_BUTTON_HEIGHT, 0.7);
		var x_offset = stage_select_button[i, stageselectbutton.window_x];
		var y_offset = stage_select_button[i, stageselectbutton.window_y];
		//draw_set_font()
		draw_text(x_offset+10, y_offset+16, "STAGE"+string(i+1)+"   Score:"+string(global.stagescore[i+1]));
		
	}
}

//ステージ情報表示する
var sprite_x = 450;
var sprite_y = 100;
var width = 352;
var height = 270;
width *= 1.2;
height *= 1.2;
if(selecting_button != -1){
	tiny_window(s_window, 1, stage_select_button[selecting_button, stageselectbutton.window_x], stage_select_button[selecting_button, stageselectbutton.window_y], STAGESELECT_BUTTON_WIDTH+60, STAGESELECT_BUTTON_HEIGHT+20, 1);
	var x_offset = stage_select_button[selecting_button, stageselectbutton.window_x];
	var y_offset = stage_select_button[selecting_button, stageselectbutton.window_y];
	var selecting_stage = selecting_button+1;
	draw_text(x_offset+10, y_offset+16, "STAGE"+string(selecting_stage)+"   Score:"+string(global.stagescore[selecting_stage]));

	draw_set_color(c_gray);
	draw_set_alpha(0.5);
	draw_rectangle(sprite_x, sprite_y, sprite_x+width, sprite_y+height, false);
	draw_set_alpha(1);
	draw_set_halign(fa_middle);
	draw_set_color(COLOR_TEXT_LTGRAY);
	//var text_y = sprite_y+height+30;
	//draw_text(sprite_x+width/2, text_y, "STEGE"+string(selecting_button));
	global.stage = selecting_stage;
	stage_setting();//ここでデータ代入
	draw_text(sprite_x+width/4, sprite_y-30, "Wave"+string(global.wave_total));
	draw_text(sprite_x+width/4*3, sprite_y-30, "Life"+string(global.life));


}
//スコア表示
draw_set_halign(fa_middle);
draw_set_font(FONT_STAGESELECT_TOTALSCORE);
draw_set_color(COLOR_TEXT_LTGRAY);
draw_text(sprite_x+width/2, sprite_y+height+40, "TOTALSCORE    "+string_format(global.totalscore, 1, 0));

draw_set_halign(fa_left);
draw_set_font(FONT_DEFAULT)

if(stage_goto != -1){
	change_room_1(stage_goto, 30, COLOR_BACKGROUND);
}

change_room_2(30, COLOR_BACKGROUND);