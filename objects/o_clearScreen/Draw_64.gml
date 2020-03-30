draw_clear(COLOR_BACKGROUND);

draw_set_font(fo_ostrichSans48);
draw_set_color(COLOR_TEXT_TITLE);
draw_set_halign(fa_middle);
draw_text(room_width/2, 64, GAMENAME);

draw_set_font(FONT_DEFAULT);
draw_set_color(COLOR_TEXT_LTGRAY);
draw_text(room_width/2, 132, "Thanks for playing!");

draw_set_halign(fa_left);
draw_set_valign(fa_bottom);

draw_set_alpha(0.9);
draw_set_font(fo_yasa20);
draw_text(room_width/2-130, 390, "TotalScore:");
draw_set_alpha(0.8);
draw_set_font(fo_noto24);
draw_text(room_width/2+30, 396, global.totalscore);

var offset_x_left = room_width/2-228-16;
var offset_x_right = room_width/2+16;

//sdm(string_width("Stage1 Score:"))
for(var i=0; i<4; i++){
	draw_set_font(fo_yasa16);
	draw_set_alpha(0.9);
	draw_text(offset_x_left, 200+i*36, "Stage"+string(i+1)+" Score:");
	draw_text(offset_x_right, 200+i*36, "Stage"+string(i+5)+" Score:");
	draw_set_font(fo_noto18);
	draw_set_alpha(0.76);
	draw_text(offset_x_left+152, 203+i*36, string(global.stagescore[i+1]));
	draw_text(offset_x_right+152, 203+i*36, string(global.stagescore[i+5]));
}

draw_set_halign(fa_middle);
draw_set_valign(fa_top);
draw_set_font(FONT_DEFAULT);

var button_width = 200
var mouse_on_end_button = false;
var mouse_on_stageselect_button = false;
var draw_gameclear_button = false;
if(!draw_gameclear_button){
	if(change_room_frame_2 = 0){//ボタンが不透明になったらクリックできる
		if(view_wport[0]/2-button_width/2 < mouse_x and mouse_x < view_wport[0]/2+button_width/2){
			if(view_hport[0]/6*5-8+32 < mouse_y and mouse_y < view_hport[0]/6*5+24+32){
				//end game
				mouse_on_end_button = true;
			}
			else if(view_hport[0]/6*5 < mouse_y and mouse_y < view_hport[0]/6*5+24){
				//stageselect
				mouse_on_stageselect_button = true;
			}
		}
	}
	if(change_screen = -1){
		if(mouse_on_end_button){//マウスがボタンの上にあるときはボタンの色をグレーに
			draw_set_color(COLOR_TEXT_GRAY);
			draw_text(view_wport[0]/2, view_hport[0]/6*5+32, "End Game");
			if(mouse_check_button_pressed(mb_left)){//ボタン押されたらルーム変更
				game_end();
			}
		}
		else{
			draw_set_color(COLOR_TEXT_LTGRAY);
			draw_text(view_wport[0]/2, view_hport[0]/6*5+32, "End Game");
		}

		if(mouse_on_stageselect_button){
			draw_set_color(COLOR_TEXT_GRAY);
			draw_text(view_wport[0]/2, view_hport[0]/6*5, "StageSelect");
			if(mouse_check_button_pressed(mb_left)){
				change_screen = r_stageSelect;
				
				//音量戻す
				var nowmusic_volume = global.musicdata[global.nowmusic_number, musicdata.volume];
				global.bgm_volume = bgm_volume_default;
				audio_sound_gain(global.nowmusic_number, global.bgm_volume*nowmusic_volume, 500);
			}
		}
		else{
			draw_set_color(COLOR_TEXT_LTGRAY);
			draw_text(view_wport[0]/2, view_hport[0]/6*5, "StageSelect");
		}
	}
}

if(change_screen != -1){
	change_room_1(change_screen, 30, COLOR_BACKGROUND);
}
change_room_2(30, COLOR_BACKGROUND);
//sdm(audio_sound_get_gain(global.nowmusic_number))
