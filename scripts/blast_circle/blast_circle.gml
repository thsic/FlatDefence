///@param x,y,x2,y2,size,col,totaltime,blasttime

var x1 = argument0;
var y1 = argument1;
var x2 = argument2;
var y2 = argument3;
var size = argument4;
var color = argument5;
var t_time = argument6;
var b_time = argument7;
var alpha = argument8

with(instance_create_layer(x1, y1, "Effects", o_effect)){
	type = 5
	blast_x = x2;
	blast_y = y2;
	effect_size = size;
	effect_color = color;
	total_time_default = t_time;
	blaststart_time_default = b_time;
	effect_alpha = alpha;
	total_time = total_time_default;
	blaststart_time = blaststart_time_default;
	alarm[0] = total_time_default;
	
}

