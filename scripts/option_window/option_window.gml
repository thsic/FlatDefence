var menu_window_width = 260;
var menu_window_height = 220;
var menu_window_x = 0;
var menu_window_y = view_hport[0]-16-menu_window_height;


tiny_window(s_window, 8, menu_window_x, menu_window_y, menu_window_width, menu_window_height, 1);
draw_set_color(COLOR_WINDOW_BORDER);
draw_rectangle(menu_window_x+1, menu_window_y+1, menu_window_x+menu_window_width-2, menu_window_y+menu_window_height-2, true);
draw_set_color(COLOR_DEFAULT);

if(mouse_check_button_pressed(mb_left)){
	var menu_window_click = false
	if(menu_window_x < mouse_x and mouse_x < menu_window_x+menu_window_width){
		if(menu_window_y < mouse_y and mouse_y < menu_window_y+menu_window_height){
			var menu_window_click = true
		}
	}
	if(!menu_window_click){
		//ウィンドウ外をクリックした
		menu_open = false;
		grab_knob = false;
		option_open = false;
		surface_free(global.usefulwindow_surface[8]);
		save_option();
	}
}

var offset_x = menu_window_x+4
var offset_y = menu_window_y+4;

//文字の所押すとボリュームリセット
var bgmtext_color = COLOR_TEXT_WHITE_NEARGRAY;
if(offset_x < mouse_x and mouse_x < offset_x+80){
	if(offset_y+4 < mouse_y and mouse_y < offset_y+20){
		if(global.bgm_volume != BGM_VOLUME_DEFAULT){
			bgmtext_color = COLOR_TEXT_LTGRAY_ONWINDOW;//文字の所にカーソルが重なっていると色を変える デフォルトと同じ音量だと色を変えない
		}
		if(mouse_check_button_pressed(mb_left)){
			global.bgm_volume = BGM_VOLUME_DEFAULT;
			var nowmusic_volume = global.musicdata[global.nowmusic_number, musicdata.volume];
			var nowmusic_number = global.musicdata[global.nowmusic_number, musicdata.path];
			audio_sound_gain(nowmusic_number, nowmusic_volume*global.bgm_volume, 0);//音量変更
		}
	}
}
var setext_color = COLOR_TEXT_WHITE_NEARGRAY;
if(offset_x < mouse_x and mouse_x < offset_x+80){
	if(offset_y+24 < mouse_y and mouse_y < offset_y+40){
		if(global.se_volume != SE_VOLUME_DEFAULT){
			setext_color = COLOR_TEXT_LTGRAY_ONWINDOW;
		}
		if(mouse_check_button_pressed(mb_left)){
			global.se_volume = SE_VOLUME_DEFAULT;
		}
	}
}

draw_set_color(COLOR_TEXT_WHITE_NEARGRAY)
draw_set_halign(fa_right);
//音量を数値で表示
draw_set_color(bgmtext_color);
draw_text(offset_x+74, offset_y+4, string_format(global.bgm_volume*100, 0, 0));
draw_set_color(setext_color);
draw_text(offset_x+74, offset_y+24, string_format(global.se_volume*100, 0, 0));

draw_set_halign(fa_left);
draw_set_color(bgmtext_color);
draw_text(offset_x, offset_y+4, "BGM");
draw_set_color(setext_color);
draw_text(offset_x, offset_y+24, "SE");
draw_set_color(COLOR_TEXT_WHITE)
draw_text(offset_x, offset_y+52, "ダメージ表示");
draw_text(offset_x, offset_y+52+26*1, "射程常時表示");
draw_text(offset_x, offset_y+52+26*2, "クールダウン表示");
draw_text(offset_x, offset_y+52+26*3, "敵HP表示");
draw_text(offset_x, offset_y+52+26*4, "敵ステータス表示");
volume_option_gui(0, offset_x+80, offset_y);
volume_option_gui(1, offset_x+80, offset_y+24);

draw_set_font(FONT_MENUBUTTON);
draw_set_color(COLOR_DEFAULT);
//戻るボタン
var back_to_menu_button = useful_button(s_optionWindowButton, 0, 1, -1, offset_x, offset_y+menu_window_height-32, "Back", COLOR_TEXT_GRAY, noone, false);
//ダメージ
var draw_damage_button_on = useful_button(s_optionWindowButton, 0, 1, 2, offset_x+144, offset_y+48, "ON", COLOR_TEXT_GRAY, global.draw_damage, true);
var draw_damage_button_off = useful_button(s_optionWindowButton, 0, 1, 2, offset_x+196, offset_y+48, "OFF", COLOR_TEXT_GRAY, global.draw_damage, false);
//射程
var draw_range_button_on = useful_button(s_optionWindowButton, 0, 1, 2, offset_x+144, offset_y+48+26*1, "ON", COLOR_TEXT_GRAY, global.draw_range_always, true);
var draw_range_button_off = useful_button(s_optionWindowButton, 0, 1, 2, offset_x+196, offset_y+48+26*1, "OFF", COLOR_TEXT_GRAY, global.draw_range_always, false);
//クールダウン
var draw_cooldown_button_on = useful_button(s_optionWindowButton, 0, 1, 2, offset_x+144, offset_y+48+26*2, "ON", COLOR_TEXT_GRAY, global.draw_cooldown, true);
var draw_cooldown_button_off = useful_button(s_optionWindowButton, 0, 1, 2, offset_x+196, offset_y+48+26*2, "OFF", COLOR_TEXT_GRAY, global.draw_cooldown, false);
//敵HP
var draw_enemyhp_button_on = useful_button(s_optionWindowButton, 0, 1, 2, offset_x+144, offset_y+48+26*3, "ON", COLOR_TEXT_GRAY, global.draw_enemyhp, true);
var draw_enemyhp_button_off = useful_button(s_optionWindowButton, 0, 1, 2, offset_x+196, offset_y+48+26*3, "OFF", COLOR_TEXT_GRAY, global.draw_enemyhp, false);
//敵ステ
var enemy_param_simple_button = useful_button(s_optionWindowButton, 0, 1, 2, offset_x+144, offset_y+48+26*4, "簡易", COLOR_TEXT_GRAY, global.draw_enemy_param_simple, true);
var enemy_param_detail_button = useful_button(s_optionWindowButton, 0, 1, 2, offset_x+196, offset_y+48+26*4, "数値", COLOR_TEXT_GRAY, global.draw_enemy_param_simple, false);
draw_set_font(FONT_DEFAULT);

if(back_to_menu_button){//backボタン
	option_open = false;
	surface_free(global.usefulwindow_surface[8]);
	play_se(SE_MENU_BUTTON, 40, 0.4, false);
	save_option();
}



//ダメージ表示on/off変更
if(global.draw_damage){
	if(draw_damage_button_off){
		global.draw_damage = false;
		play_se(SE_MENU_BUTTON, 40, 0.4, false);
	}
}
else{
	if(draw_damage_button_on){
		global.draw_damage = true;
		play_se(SE_MENU_BUTTON, 40, 0.4, false);
	}
}
//射程表示
if(global.draw_range_always){
	if(draw_range_button_off){
		global.draw_range_always = false;
		play_se(SE_MENU_BUTTON, 40, 0.4, false);
	}
}
else{
	if(draw_range_button_on){
		global.draw_range_always = true;
		play_se(SE_MENU_BUTTON, 40, 0.4, false);
	}
}
//クールダウン
if(global.draw_cooldown){
	if(draw_cooldown_button_off){
		global.draw_cooldown = false;
		play_se(SE_MENU_BUTTON, 40, 0.4, false);
	}
}
else{
	if(draw_cooldown_button_on){
		global.draw_cooldown = true;
		play_se(SE_MENU_BUTTON, 40, 0.4, false);
	}
}
//敵hp
if(global.draw_enemyhp){
	if(draw_enemyhp_button_off){
		global.draw_enemyhp = false;
		play_se(SE_MENU_BUTTON, 40, 0.4, false);
	}
}
else{
	if(draw_enemyhp_button_on){
		global.draw_enemyhp = true;
		play_se(SE_MENU_BUTTON, 40, 0.4, false);
	}
}
//敵ぱらめーた
if(global.draw_enemy_param_simple){
	if(enemy_param_detail_button){
		global.draw_enemy_param_simple = false;
		play_se(SE_MENU_BUTTON, 40, 0.4, false);
	}
}
else{
	if(enemy_param_simple_button){
		global.draw_enemy_param_simple = true;
		play_se(SE_MENU_BUTTON, 40, 0.4, false);
	}
}

