//ステージクリア画面

if(stageclear_frame = -1){
	//開始時
	stageclear_frame = 0;
	button_alpha = 0;
	room_speed = FPS_DEFAULT;
	score_new_record = score_calculate();
	sdm("total enemy hp "+string(global.all_enemy_total_hp))
}

stageclear_frame++;


//画面を暗くする
var display_clear_black_flame = 20
if(stageclear_frame > display_clear_black_flame){
	var clear_alpha = 0.8;
}
else{
	var clear_alpha = stageclear_frame/display_clear_black_flame*0.8;
}
draw_set_alpha(clear_alpha);
draw_set_color(c_black)
draw_rectangle(0, 0, view_wport[0], view_hport[0], false)

var text_y = room_height/9*2+32
switch(stageclear_frame){
case 45:
	fall_text(view_wport[0]/2, room_height/7-32, room_height/7, 30, "STAGECLEAR", COLOR_TEXT_LTGRAY, FONT_STAGECLEAR_TEXT, fa_middle, false);
break
case 80:
	fall_text(view_wport[0]/2-116, text_y-32, text_y, 15, "ClearBonus", COLOR_TEXT_LTGRAY, FONT_DEFAULT, fa_left, false);
	fall_text(view_wport[0]/2+32, text_y-32, text_y, 15, "=", COLOR_TEXT_LTGRAY, FONT_DEFAULT, fa_left, false);
	fall_text(view_wport[0]/2+116, text_y-32, text_y, 15, string(stageclear_score), COLOR_TEXT_LTGRAY, FONT_DEFAULT, fa_right, false);
break
case 90:
	fall_text(view_wport[0]/2-116, text_y-32+24*1, text_y+24*1, 15, "Life "+string(global.life)+" * 1000", COLOR_TEXT_LTGRAY, FONT_DEFAULT, fa_left, false);
	fall_text(view_wport[0]/2+32, text_y-32+24*1, text_y+24*1, 15, "=", COLOR_TEXT_LTGRAY, FONT_DEFAULT, fa_left, false);
	fall_text(view_wport[0]/2+116, text_y-32+24*1, text_y+24*1, 15, string(life_score), COLOR_TEXT_LTGRAY, FONT_DEFAULT, fa_right, false);
break
case 100:
	var clear_gold = global.gold - global.score_gold_minus;
	if(clear_gold < 0){clear_gold = 0};
	fall_text(view_wport[0]/2-116, text_y-32+24*2, text_y+24*2, 15, "Gold "+string(clear_gold)+" * 10", COLOR_TEXT_LTGRAY, FONT_DEFAULT, fa_left, false);
	fall_text(view_wport[0]/2+32, text_y-32+24*2, text_y+24*2, 15, "=", COLOR_TEXT_LTGRAY, FONT_DEFAULT, fa_left, false);
	fall_text(view_wport[0]/2+116, text_y-32+24*2, text_y+24*2, 15, string(gold_score), COLOR_TEXT_LTGRAY, FONT_DEFAULT, fa_right, false);
break
case 130:
	fall_text(view_wport[0]/2-132, text_y-32+80, text_y+16+80, 30, "TOTALSCORE ", COLOR_TEXT_LTGRAY, FONT_STAGECLEAR_TOTALSCORE, fa_left, false);
break
case 155:
	stageclear_draw_score(view_wport[0]/2+132, text_y+16+80, total_score, COLOR_TEXT_LTGRAY, fa_right, score_new_record, COLOR_TEXT_NEWRECORD);
break
case 190:
	draw_most_damaging_defender(view_wport[0]/2-156, text_y+150)
break
}



//ボタンの描画
var button_opacity = false
if(stageclear_frame > 210){
	if(button_alpha < 1){
		button_alpha += 0.015;
	}
	else{
		button_opacity = true
	}
}

draw_set_font(FONT_DEFAULT);
draw_set_halign(fa_middle);
draw_set_alpha(button_alpha);

var button_width = 200
var mouse_on_retry_button = false;
var mouse_on_stageselect_button = false;
if(button_opacity){//ボタンが不透明になったらクリックできる
	if(view_wport[0]/2-button_width/2 < mouse_x and mouse_x < view_wport[0]/2+button_width/2){
		if(view_hport[0]/6*5-8 < mouse_y and mouse_y < view_hport[0]/6*5+24){
			//retry
			mouse_on_retry_button = true
		}
		else if(view_hport[0]/6*5-32 < mouse_y and mouse_y < view_hport[0]/6*5-32+24){
			//stageselect
			mouse_on_stageselect_button = true
		}
	}
}

if(mouse_on_retry_button){//マウスがボタンの上にあるときはボタンの色をグレーに
	draw_set_color(COLOR_TEXT_GRAY);
	draw_text(view_wport[0]/2, view_hport[0]/6*5, "Retry");
	if(mouse_check_button_pressed(mb_left)){//ボタン押されたらルーム変更
		change_screen = room;
	}
}
else{
	draw_set_color(COLOR_TEXT_WHITE);
	draw_text(view_wport[0]/2, view_hport[0]/6*5, "Retry");
}

if(mouse_on_stageselect_button){
	draw_set_color(COLOR_TEXT_GRAY);
	draw_text(view_wport[0]/2, view_hport[0]/6*5-32, "StageSelect");
	if(mouse_check_button_pressed(mb_left)){
		change_screen = r_stageSelect;
	}
}
else{
	draw_set_color(COLOR_TEXT_WHITE);
	draw_text(view_wport[0]/2, view_hport[0]/6*5-32, "StageSelect");
}

draw_set_font(FONT_DEFAULT);
draw_set_halign(fa_left);
draw_set_alpha(1);
draw_set_color(COLOR_DEFAULT)