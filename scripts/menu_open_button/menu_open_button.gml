

var open_button_width = sprite_get_width(s_menuButton);//48
var menu_open_button_x = 0;
var menu_open_button_y = view_hport[0]-48-16;


var subimage = 0;
if(menu_open_button_x < mouse_x and mouse_x < menu_open_button_x+open_button_width){
	if(menu_open_button_y < mouse_y and mouse_y < menu_open_button_y+open_button_width){
		subimage = 1;
		if(mouse_check_button_pressed(mb_left)){
			menu_open = true
			play_se(SE_MENU_OPEN_BUTTON, 55, 0.2, false);
			audio_sound_pitch(SE_MENU_OPEN_BUTTON, 0.7);
		}
	}
}

draw_sprite(s_menuButton, subimage, menu_open_button_x, menu_open_button_y);