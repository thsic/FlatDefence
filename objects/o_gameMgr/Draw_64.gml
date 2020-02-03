/// @description UI表示
draw_set_font(fo_yasaNormal)

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
case gamestate.gameover:
	draw_time_machine();
	draw_shop();
	show_defender_ui();
break
}
switch(global.gamestate){
case gamestate.main:
case gamestate.pause:
	show_enemy_ui();
break
case gamestate.gameover:
	gameover_ui();
break
case gamestate.stageclear:
	stageclear_ui();
break
//ウェーブ強制スタートボタン
case gamestate.rest:
case gamestate.restpause:
	var button_x = WAVESTART_BUTTON_X;
	var button_y = WAVESTART_BUTTON_Y;
	var button_subimage = 0;
	var button_width = sprite_get_width(s_wavestartButton);
	var button_height = sprite_get_height(s_wavestartButton);
	if(button_x<mouse_x and mouse_x<button_x+button_width){
		if(button_y<mouse_y and mouse_y<button_y+button_height){
			button_subimage = 1;
			if(mouse_check_button_pressed(mb_left)){
				if(global.gamestate = gamestate.restpause){
						timemachine_button_state[0] = 2;
						timemachine_button_state[1] = 0;
						timemachine_button_state[2] = 0;
				}
				//ボタンクリックしたら強制的にウェーブスタート
				global.gamestate = gamestate.wavestart;
	
			}
		}
	}
	if(keyboard_check_pressed(vk_shift)){//シフト押しても強制スタート
		global.gamestate = gamestate.wavestart;
	}
	
	draw_sprite_ext(s_wavestartButton, button_subimage, 150, 6, 1, 1, 0, c_white, 1);
	draw_set_halign(fa_middle);
	draw_set_color(COLOR_TEXT_WHITE);
	draw_text(button_x+button_width/2, button_y+2, "WaveStart");
	draw_set_halign(fa_left);
	draw_set_color(COLOR_DEFAULT);
break
}

switch(global.gamestate){
case gamestate.wavestart:
	surface_free(global.usefulwindow_surface[4]);
break
case gamestate.reststart:
	surface_free(global.usefulwindow_surface[4]);
break
}
