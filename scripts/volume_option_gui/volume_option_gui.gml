///@param soundtype,x,y
//bgmが0 seが1
var sound_type = argument0;
var _x = argument1;
var _y = argument2;
var gui_width = 160;
var gui_height = 20;
if(sound_type = 0){var knob_x = _x+(gui_width*global.bgm_volume)}
if(sound_type = 1){var knob_x = _x+(gui_width*global.se_volume)}

if(mouse_check_button_pressed(mb_left)){
	if(_x < mouse_x and mouse_x < _x+gui_width){
		if(_y < mouse_y and mouse_y < _y+gui_height){
			//guiをクリックするとつまみモードに入る
			if(sound_type = 0){
				grab_knob_bgm = true;
			}
			else{
				grab_knob_se = true;
			}
		}
	}
}
if(!mouse_check_button(mb_left)){
	grab_knob_bgm = false;
	grab_knob_se = false;
}

if(sound_type = 0){
	var grab_knob = grab_knob_bgm;
}
else{
	var grab_knob = grab_knob_se;
}

//つまみ掴んでる
if(grab_knob){
	knob_x = mouse_x;
	if(knob_x < _x){
		knob_x = _x;
	}
	else if(_x+gui_width < knob_x){
		knob_x = _x+gui_width;
	}
	
	//ボリューム変更
	var volume = (knob_x-_x)/gui_width
	if(sound_type = 0){
		global.bgm_volume = volume
		var nowmusic_volume = global.musicdata[global.nowmusic_number, musicdata.volume];
		audio_sound_gain(global.nowmusic_number, nowmusic_volume*global.bgm_volume, 0);//音量変更
	}
	if(sound_type = 1){
		if(se_test_cooldown = 0){
			play_se(SE_MENU_BUTTON, 40, 0.35, false);
			se_test_cooldown = 20;
		}
		else{
			se_test_cooldown--;
		}
		global.se_volume = volume
		
	}
	
	
}

draw_set_color(make_color_rgb(180, 180, 145));
draw_rectangle(_x, _y+8, _x+gui_width, _y+gui_height-8, false);
draw_set_color(COLOR_DEFAULT);
draw_sprite(s_volumeKnob, 0, knob_x, _y+gui_height/2);


