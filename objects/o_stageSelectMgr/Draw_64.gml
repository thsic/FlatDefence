draw_set_color(COLOR_BACKGROUND);
draw_rectangle(0, 0, room_width, room_height, false);
var gameclearscreen_button = false
var button_amount = STAGESELECT_BUTTON_AMOUNT;
if(global.stagescore[8] != 0 and global.totalscore > STAGE8_RELEASE_SCORE){//global.stagescore[8] != 0 and global.totalscore > STAGE8_RELEASE_SCORE
	//スコアが300000以上でステージ8にスコアが存在したらクリア画面ボタンを描画する
	gameclearscreen_button = true;
	button_amount += 1;
}


for(var i=0; i<button_amount; i++){
	if(stage_select_button[i, stageselectbutton.state] = 0){
		var x_offset = stage_select_button[i, stageselectbutton.window_x];
		var y_offset = stage_select_button[i, stageselectbutton.window_y];
		if(i != 8){
			if(release_stage < i){//未開放
				tiny_window(s_enemyParamWindow, 2, stage_select_button[i, stageselectbutton.window_x], stage_select_button[i, stageselectbutton.window_y], STAGESELECT_BUTTON_WIDTH, STAGESELECT_BUTTON_HEIGHT, 1);
				draw_set_alpha(0.8);
				draw_text(x_offset+10, y_offset+16, "STAGE"+string(i+1)+"   TotalScore "+string(stage_release_score[i])+" 以上");
				draw_set_alpha(1);
			}
			else{//解放済み
				tiny_window(s_window, 0, stage_select_button[i, stageselectbutton.window_x], stage_select_button[i, stageselectbutton.window_y], STAGESELECT_BUTTON_WIDTH, STAGESELECT_BUTTON_HEIGHT, 0.7);
				draw_text(x_offset+10, y_offset+16, "STAGE"+string(i+1)+"   Score:"+string(global.stagescore[i+1]));
			}
		}
		else{
			if(gameclearscreen_button){
				tiny_window(s_window, 0, stage_select_button[i, stageselectbutton.window_x], stage_select_button[i, stageselectbutton.window_y], STAGESELECT_BUTTON_WIDTH, STAGESELECT_BUTTON_HEIGHT, 0.7);
				draw_text(x_offset+10, y_offset+16, "クリア画面へ");
			}
		}
		//draw_set_font()
		//draw_text(x_offset+10, y_offset+16, "STAGE"+string(i+1)+"   Score:"+string(global.stagescore[i+1]));
	}
}

//ステージ情報表示する
var sprite_x = 450;
var sprite_y = 56;
var width = 704;
var height = 540+4;//+4で32の倍数になるのではみ出さない表示になる 実際のステージのサイズは540
width *= 0.6;
height *= 0.6;

if(selecting_button != -1 and selecting_button != 8){
	tiny_window(s_window, 1, stage_select_button[selecting_button, stageselectbutton.window_x], stage_select_button[selecting_button, stageselectbutton.window_y], STAGESELECT_BUTTON_WIDTH+60, STAGESELECT_BUTTON_HEIGHT+20, 1);
	var x_offset = stage_select_button[selecting_button, stageselectbutton.window_x];
	var y_offset = stage_select_button[selecting_button, stageselectbutton.window_y];
	var selecting_stage = selecting_button+1;
	draw_text(x_offset+10, y_offset+20, "STAGE"+string(selecting_stage)+"   Score:"+string(global.stagescore[selecting_stage]));

	draw_set_color(COLOR_STAGESELECT_STAGEVIEW_BACKGROUND);
	draw_set_alpha(1);
	draw_rectangle(sprite_x, sprite_y, sprite_x+width, sprite_y+height, false);
	draw_set_color(COLOR_STAGESELECT_STAGEVIEW_FRAME);
	draw_set_alpha(0.5);
	draw_rectangle(sprite_x, sprite_y, sprite_x+width, sprite_y+height, true);
	draw_stagemap(selecting_stage, sprite_x, sprite_y, 0.6);
	draw_set_alpha(1);
	draw_set_halign(fa_left);
	draw_set_color(COLOR_TEXT_LTGRAY);
	//var text_y = sprite_y+height+30;
	//draw_text(sprite_x+width/2, text_y, "STEGE"+string(selecting_button));
	global.stage = selecting_stage;
	stage_setting();//ここでデータ代入
	/*draw_text(sprite_x+width/4, sprite_y-30, "Wave"+string(global.wave_total));
	draw_text(sprite_x+width/4*3, sprite_y-30, "Life"+string(global.life));*/
	draw_text(sprite_x+34, sprite_y+height+14, " STAGE"+string(selecting_stage));
	draw_text(sprite_x+34, sprite_y+height+36, "Wave ");
	draw_set_alpha(0.9);
	draw_text(sprite_x+34, sprite_y+height+54, "Life ");
	draw_set_color(COLOR_TEXT_LTGRAY_ONWINDOW);
	draw_set_alpha(1);
	draw_text(sprite_x+90, sprite_y+height+36, string(global.wave_total));
	draw_set_alpha(0.9);
	draw_text(sprite_x+90, sprite_y+height+54, string(global.life));
	//draw_text(sprite_x+4, sprite_y+height+70, "WaveClearBonus "+string(global.wave_clear_gold)+"Gold");
	
	switch(selecting_stage){
	case 1:
		var stage_description = STAGE1_DESCRIPTION;
	break
	case 2:
		var stage_description = STAGE2_DESCRIPTION;
	break
	case 3:
		var stage_description = STAGE3_DESCRIPTION;
	break
	case 4:
		var stage_description = STAGE4_DESCRIPTION;
	break
	case 5:
		var stage_description = STAGE5_DESCRIPTION;
	break
	case 6:
		var stage_description = STAGE6_DESCRIPTION;
	break
	case 7:
		var stage_description = STAGE7_DESCRIPTION;
	break
	case 8:
		var stage_description = STAGE8_DESCRIPTION;
	break
	}
	draw_set_color(COLOR_TEXT_DEEPBLUE);
	draw_set_halign(fa_middle);
	draw_text(sprite_x+width-136, sprite_y+height+20, stage_description);
}
else if(selecting_button = 8){
	tiny_window(s_window, 1, stage_select_button[selecting_button, stageselectbutton.window_x], stage_select_button[selecting_button, stageselectbutton.window_y], STAGESELECT_BUTTON_WIDTH+60, STAGESELECT_BUTTON_HEIGHT+20, 1);
	var x_offset = stage_select_button[selecting_button, stageselectbutton.window_x];
	var y_offset = stage_select_button[selecting_button, stageselectbutton.window_y];
	var selecting_stage = selecting_button+1;
	draw_text(x_offset+10, y_offset+20, "クリア画面へ");
}

//スコア表示
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
draw_set_font(FONT_STAGESELECT_TOTALSCORE_TEXT);
draw_set_color(COLOR_TEXT_BROWN);
draw_text(sprite_x-16, sprite_y+height+132, "TOTALSCORE   ");
draw_set_font(FONT_STAGESELECT_TOTALSCORE);
draw_text(sprite_x+284, sprite_y+height+134, string_format(global.totalscore, 1, 0));

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(FONT_DEFAULT)

if(stage_goto != -1){
	change_room_1(stage_goto, 30, COLOR_BACKGROUND);
}

change_room_2(30, COLOR_BACKGROUND);