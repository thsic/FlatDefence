if(gameover_frame = -1){
	//ゲームオーバーになった瞬間の設定
	gameover_frame = 0;
	menutext_alpha = 0;
	room_speed = FPS_DEFAULT;
}
else{
	gameover_frame++;
}

//画面を暗くする
var display_clear_black_flame = 60
if(gameover_frame > display_clear_black_flame){
	var clear_alpha = 0.9;
}
else{
	var clear_alpha = gameover_frame/display_clear_black_flame*0.9;
}

draw_set_alpha(clear_alpha);
draw_set_color(c_black);
draw_rectangle(0, 0, view_wport[0], view_hport[0], false);

//ゲームオーバーの文字
if(gameover_frame = 45){
	fall_text(view_wport[0]/2, view_hport[0]/6*2-32, view_hport[0]/6*2, 30, "GAMEOVER", c_red, FONT_SUPERBIG, fa_middle, false)
}

//メニュー描画
var menutext_opacity = false
if(gameover_frame > 90){
	if(menutext_alpha < 1){
		menutext_alpha += 0.02
	}
	else{
		menutext_opacity = true
	}
}

var mouse_on_retry_button = false
var mouse_on_stageselect_button = false
if(menutext_opacity){
	if(view_wport[0]/2-150 < mouse_x and mouse_x < view_wport[0]/2+150){
		if(view_hport[0]/6*4-28 < mouse_y and mouse_y < view_hport[0]/6*4+24){
			//retry
			mouse_on_retry_button = true
		}
		else if(view_hport[0]/6*4+32-8 < mouse_y and mouse_y < view_hport[0]/6*4+32+24){
			//stageselect
			mouse_on_stageselect_button = true
		}
	}
}

draw_set_font(FONT_DEFAULT);
draw_set_halign(fa_middle);
draw_set_alpha(menutext_alpha);

if(mouse_on_retry_button){//マウスがボタンの上にあるときはボタンの色をグレーに
	draw_set_color(COLOR_TEXT_GRAY);
	draw_text(view_wport[0]/2, view_hport[0]/6*4, "Retry");
	if(mouse_check_button_pressed(mb_left)){//ボタン押されたらルーム変更
		change_screen = room;
	}
}
else{
	draw_set_color(COLOR_TEXT_WHITE);
	draw_text(view_wport[0]/2, view_hport[0]/6*4, "Retry");
}

if(mouse_on_stageselect_button){
	draw_set_color(COLOR_TEXT_GRAY);
	draw_text(view_wport[0]/2, view_hport[0]/6*4+32, "StageSelect");
	if(mouse_check_button_pressed(mb_left)){
		change_screen = r_stageSelect;
	}
}
else{
	draw_set_color(COLOR_TEXT_WHITE);
	draw_text(view_wport[0]/2, view_hport[0]/6*4+32, "StageSelect");
}

//ルーム変更処理はo_gameMgrのdraw_endにある


draw_set_font(FONT_DEFAULT);
draw_set_halign(fa_left);
draw_set_alpha(1);
draw_set_color(COLOR_DEFAULT)


