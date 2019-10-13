///@param x,y,len,dir,time,col,acc,acc2,spd,size

var effect_x = argument0;
var effect_y = argument1;
var length = argument2;
var dir = argument3;
var life = argument4;
var color = argument5;
var acc = argument6;
var acc2 = argument7;
var second_phase_time = argument8;
var size = argument9;

with(instance_create_layer(effect_x, effect_y, "Effects", o_effect)){
	type = 4;
	direction = dir;
	lifetime = life;
	effect_length = length;
	effect_acceleration = acc;
	effect_acceleration2 = acc2;
	display_color = color;
	effect_size = size;
	
	alarm[0] = lifetime;
	line_terminal = 0;//末端 0~1
	line_tip = 0;//先端 0~1
	line_tip_speed = 1 //加速度
	line_terminal_speed = 0
}


