var menu_window_width = 120;
var menu_window_height = 64+24+6*2;
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
		surface_free(global.usefulwindow_surface[8])
	}
}


var offset_x = menu_window_x+10
var offset_y = menu_window_y+6;
draw_set_font(FONT_MENUBUTTON);
var restart_button = useful_button(s_menuWindowButton, 0, 1, -1, offset_x, offset_y, "Restart", COLOR_TEXT_GRAY, noone, false);
var stageselect_button = useful_button(s_menuWindowButton, 0, 1, -1, offset_x, offset_y+32, "StageSelect", COLOR_TEXT_GRAY, noone, false);
var option_button = useful_button(s_menuWindowButton, 0, 1, -1, offset_x, offset_y+64, "Option", COLOR_TEXT_GRAY, noone, false);
draw_set_font(FONT_DEFAULT);

if(o_gameMgr.change_screen = -1){
	if(restart_button){
		//リスタート処理
		o_gameMgr.change_screen = room;

	}
	if(stageselect_button){
		//ステージセレクトへ
		o_gameMgr.change_screen = r_stageSelect;
	}
	if(option_button){
		//オプションを開く
		option_open = true;
		surface_free(global.usefulwindow_surface[8])
	}
}
