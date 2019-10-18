///@param x,y,len,dir,1sttime,2ndtime,col,size,delay

var effect_x = argument0;
var effect_y = argument1;
var length = argument2;
var dir = argument3;
var first_phase_time = argument4;
var second_phase_time = argument5;
var color = argument6;
var size = argument7;
var delay = argument8;

with(instance_create_layer(effect_x, effect_y, "Effects", o_effect)){
	type = 4;
	direction = dir;
	first_phase_time_default = first_phase_time;
	second_phase_time_default = second_phase_time;
	effect_length = length;
	display_color = color;
	effect_size = size;
	effect_delay = delay;
	
	alarm[0] = first_phase_time_default+second_phase_time_default+effect_delay;
	first_phase_time_now = first_phase_time_default;
	second_phase_time_now = second_phase_time_default;
	line_terminal = 0;//末端 0~1
	line_tip = 0;//先端 0~1
	line_tip_speed = 1 //加速度
	line_terminal_speed = 0
}


