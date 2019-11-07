if(gameover_frame = -1){
	//ゲームオーバーになった瞬間の設定
	gameover_frame = 0;
	room_speed = FPS_DEFAULT;
	

}
else{
	gameover_frame++;
}

//画面を暗くする
var display_clear_black_flame = 60
if(gameover_frame > display_clear_black_flame){
	var clear_alpha = 0.8;
}
else{
	var clear_alpha = gameover_frame/display_clear_black_flame*0.8;
}

draw_set_alpha(clear_alpha);
draw_set_color(c_black)
draw_rectangle(0, 0, view_wport[0], view_hport[0], false)

//ゲームオーバーの文字
if(gameover_frame = 45){
	fall_text(view_wport[0]/2, room_height/5*2-32, room_height/5*2, 30, "GAMEOVER", c_red, FONT_SUPERBIG, fa_middle)
}
/*if(gameover_flame > 90){
	var gameover_text_y_default = room_height/5*2;
	if(gameover_flame < 90+60){
		var gameover_text_y = gameover_text_y_default-30+(gameover_flame-90)/2
		var gameover_text_alpha = (gameover_flame-90)/60;
	}
	else{
		var gameover_text_y = gameover_text_y_default
		var gameover_text_alpha = 1;
	}
	draw_set_font(fo_yasaSuperBig);
	draw_set_color(c_red);
	draw_set_halign(fa_middle);
	draw_set_alpha(gameover_text_alpha);
	draw_text(view_wport[0]/2, gameover_text_y, "GAMEOVER")
}*/



draw_set_font(FONT_DEFAULT);
draw_set_halign(fa_left);
draw_set_alpha(1);
draw_set_color(COLOR_DEFAULT)


