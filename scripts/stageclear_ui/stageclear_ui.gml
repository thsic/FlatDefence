//ステージクリア画面

if(stageclear_frame = -1){
	//開始時
	stageclear_frame = 0;
	room_speed = FPS_DEFAULT;
}

stageclear_frame++;


//画面を暗くする
var display_clear_black_flame = 15
if(stageclear_frame > display_clear_black_flame){
	var clear_alpha = 0.8;
}
else{
	var clear_alpha = stageclear_frame/display_clear_black_flame*0.8;
}
draw_set_alpha(clear_alpha);
draw_set_color(c_black)
draw_rectangle(0, 0, view_wport[0], view_hport[0], false)

var text_y = room_height/5*2
switch(stageclear_frame){
case 45:
	fall_text(view_wport[0]/2, room_height/6-32, room_height/6, 30, "STAGECLEAR", c_aqua, FONT_SUPERBIG, fa_middle, false);
break
case 80:
	fall_text(view_wport[0]/2, text_y-32, text_y, 15, "clearbonus = 10000", c_gray, FONT_DEFAULT, fa_middle, false);
break
case 90:
	fall_text(view_wport[0]/2, text_y-32+24*1, text_y+24*1, 15, "Life10 * 500 = 5000", c_gray, FONT_DEFAULT, fa_middle, false);
break
case 100:
	fall_text(view_wport[0]/2, text_y-32+24*2, text_y+24*2, 15, "gold520 * 10 = 5200", c_gray, FONT_DEFAULT, fa_middle, false);
break
case 130:
	fall_text(view_wport[0]/2, text_y-32+100, text_y+16+100, 30, "TOTALSCORE ", c_ltgray, FONT_SUPERBIG, fa_right, false);
break
case 155:
	stageclear_draw_score(view_wport[0]/2, text_y+16+100, 20200);
break

}


