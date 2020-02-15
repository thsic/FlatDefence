var menu_window_width = 240;
var menu_window_height = 200;
var menu_window_x = 0;
var menu_window_y = view_hport[0]-16-menu_window_height;


tiny_window(s_window, 8, menu_window_x, menu_window_y, menu_window_width, menu_window_height, 1);


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
		surface_free(global.usefulwindow_surface[8])
	}
}


var offset_x = menu_window_x+4
var offset_y = menu_window_y+4;
draw_set_color(COLOR_TEXT_GRAY)
draw_text(offset_x, offset_y, "BGM");
draw_text(offset_x, offset_y+20, "SE");
draw_text(offset_x, offset_y+44, "ダメージ表示");
draw_text(offset_x, offset_y+44+26*1, "射程常時表示");
draw_text(offset_x, offset_y+44+26*2, "クールダウン表示");
draw_text(offset_x, offset_y+44+26*3, "敵HP表示");
draw_text(offset_x, offset_y+44+26*4, "敵ステータス表示");
volume_option_gui(0, offset_x+60, offset_y-4)
volume_option_gui(1, offset_x+60, offset_y+16)

draw_set_font(fo_yasa10);
draw_set_color(COLOR_DEFAULT)
//戻るボタン
var back_to_menu_button = useful_button(s_optionWindowButton, 0, 1, -1, offset_x, offset_y+menu_window_height-32, "Back", COLOR_TEXT_GRAY, noone, false);
//ダメージ
var draw_damage_button_on = useful_button(s_optionWindowButton, 0, 1, 2, offset_x+130, offset_y+40, "ON", COLOR_TEXT_GRAY, global.draw_damage, true);
var draw_damage_button_off = useful_button(s_optionWindowButton, 0, 1, 2, offset_x+182, offset_y+40, "OFF", COLOR_TEXT_GRAY, global.draw_damage, false);
//射程
var draw_range_button_on = useful_button(s_optionWindowButton, 0, 1, 2, offset_x+130, offset_y+40+26*1, "ON", COLOR_TEXT_GRAY, global.draw_range_always, true);
var draw_range_button_off = useful_button(s_optionWindowButton, 0, 1, 2, offset_x+182, offset_y+40+26*1, "OFF", COLOR_TEXT_GRAY, global.draw_range_always, false);
//クールダウン
var draw_cooldown_button_on = useful_button(s_optionWindowButton, 0, 1, 2, offset_x+130, offset_y+40+26*2, "ON", COLOR_TEXT_GRAY, global.draw_cooldown, true);
var draw_cooldown_button_off = useful_button(s_optionWindowButton, 0, 1, 2, offset_x+182, offset_y+40+26*2, "OFF", COLOR_TEXT_GRAY, global.draw_cooldown, false);
//敵HP
var draw_enemyhp_button_on = useful_button(s_optionWindowButton, 0, 1, 2, offset_x+130, offset_y+40+26*3, "ON", COLOR_TEXT_GRAY, global.draw_enemyhp, true);
var draw_enemyhp_button_off = useful_button(s_optionWindowButton, 0, 1, 2, offset_x+182, offset_y+40+26*3, "OFF", COLOR_TEXT_GRAY, global.draw_enemyhp, false);
//敵ステ
var enemy_param_detail_button = useful_button(s_optionWindowButton, 0, 1, 2, offset_x+130, offset_y+40+26*3, "簡易", COLOR_TEXT_GRAY, global.draw_enemy_param_simple, true);
var enemy_param_simple_button = useful_button(s_optionWindowButton, 0, 1, 2, offset_x+130, offset_y+40+26*3, "数値", COLOR_TEXT_GRAY, global.draw_enemy_param_simple, true);
draw_set_font(FONT_DEFAULT);

if(back_to_menu_button){
	option_open = false;
	surface_free(global.usefulwindow_surface[8])
}
//ダメージ表示on/off変更
if(global.draw_damage){
	if(draw_damage_button_off){
		global.draw_damage = false;
	}
}
else{
	if(draw_damage_button_on){
		global.draw_damage = true;
	}
}
//射程表示
if(global.draw_range_always){
	if(draw_range_button_off){
		global.draw_range_always = false;
	}
}
else{
	if(draw_range_button_on){
		global.draw_range_always = true;
	}
}
//クールダウン
if(global.draw_cooldown){
	if(draw_cooldown_button_off){
		global.draw_cooldown = false;
	}
}
else{
	if(draw_cooldown_button_on){
		global.draw_cooldown = true;
	}
}
//敵hp
if(global.draw_enemyhp){
	if(draw_enemyhp_button_off){
		global.draw_enemyhp = false;
	}
}
else{
	if(draw_enemyhp_button_on){
		global.draw_enemyhp = true;
	}
}
//敵ぱらめーた
if(global.draw_enemy_param_simple){
	if(enemy_param_detail_button){
		global.draw_enemy_param_simple = false;
	}
}
else{
	if(enemy_param_simple_button){
		global.draw_enemy_param_simple = true;
	}
}

