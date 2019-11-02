///@param x,y,y2,time,text,color,font,halign

var x1 = argument0;
var y1 = argument1;
var y2 = argument2;//最初の座標
var _time = argument3;
var display_text = argument4;
var color = argument5;
var font = argument6;
var halign = argument7;

with(instance_create_layer(x1, y2, "UI", o_effect)){
	type = 6;
	text = display_text;
	direction = 270;
	display_color = color;
	fall_time = _time
	fall_length = y2-y1;
	time = 0
	text_font = font
	text_halign = halign
}

