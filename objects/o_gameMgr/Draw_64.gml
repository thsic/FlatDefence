/// @description UI表示

switch(global.gamestate){
case gamestate.wavestart:
	surface_free(global.usefulwindow_surface[4]);
break
case gamestate.reststart:
	surface_free(global.usefulwindow_surface[4]);
break
}

draw_ui();
switch(global.gamestate){
case gamestate.wavestart:
case gamestate.reststart:
case gamestate.rest:
case gamestate.restpause:
case gamestate.pause:
case gamestate.main:
case gamestate.waveclear:
case gamestate.stageclear:
	draw_time_machine();
	draw_shop();
	show_defender_ui();
break
}
switch(global.gamestate){
case gamestate.main:
	show_enemy_ui();
break
//ウェーブ強制スタートボタン
case gamestate.rest:
case gamestate.restpause:
	var button_x = 150;
	var button_y = 6;
	var button_subimage = 0;
	var button_width = sprite_get_width(s_wavestartButton);
	var button_height = sprite_get_height(s_wavestartButton);
	if(button_x<mouse_x and mouse_x<button_x+button_width){
		if(button_y<mouse_y and mouse_y<button_y+button_height){
			button_subimage = 1;
			if(mouse_check_button_pressed(mb_left)){
				//ボタンクリックしたら強制的にウェーブスタート
				global.gamestate = gamestate.wavestart;
			}
		}
	}
	if(keyboard_check_pressed(vk_shift)){//シフト押しても強制スタート
		global.gamestate = gamestate.wavestart;
	}
	
	draw_sprite(s_wavestartButton, button_subimage, 150, 6);
	draw_set_halign(fa_middle);
	draw_set_color(COLOR_TEXT_WHITE);
	draw_text(button_x+button_width/2, button_y, "WaveStart");
	draw_set_halign(fa_left);
	draw_set_color(COLOR_DEFAULT);
break
}

