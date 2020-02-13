///@param soundtype,x,y
//bgmが0 seが1
var sound_type = argument0;
var _x = argument1;
var _y = argument2;
var gui_width = 100;
var gui_height = 20;
if(sound_type = 0){var knob_x = _x+(gui_width*global.bgm_volume)}
if(sound_type = 1){var knob_x = _x+(gui_width*global.se_volume)}

if(mouse_check_button_pressed(mb_left)){
	if(_x < mouse_x and mouse_x < _x+gui_width){
		if(_y < mouse_y and mouse_y < _y+gui_height){
			//guiをクリックするとつまみモードに入る
			grab_knob = true;
		}
	}
}
if(!mouse_check_button(mb_left)){
	grab_knob = false;
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
	if(sound_type = 0){global.bgm_volume = volume}
	if(sound_type = 1){global.se_volume = volume}
}

draw_set_color(make_color_rgb(180, 180, 145));
draw_rectangle(_x, _y+8, _x+gui_width, _y+gui_height-8, false);
draw_set_color(COLOR_DEFAULT);
draw_sprite(s_volumeKnob, 0, knob_x, _y+gui_height/2);


