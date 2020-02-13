

var open_button_width = sprite_get_width(s_menuButton);//48
var menu_open_button_x = 0;
var menu_open_button_y = view_hport[0]-48-16;

draw_sprite(s_menuButton, 0, menu_open_button_x, menu_open_button_y);

if(menu_open_button_x < mouse_x and mouse_x < menu_open_button_x+open_button_width){
	if(menu_open_button_y < mouse_y and mouse_y < menu_open_button_y+open_button_width){
		if(mouse_check_button_pressed(mb_left)){
			menu_open = true
		}
	}
}

