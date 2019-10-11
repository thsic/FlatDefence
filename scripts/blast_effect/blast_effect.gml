///@param x,y,size,color,time

var _x = argument0;
var _y = argument1;
var _size = argument2;
var _color = argument3;
var _time = argument4;
var _alpha = argument5;

with(instance_create_layer(_x, _y, "Effects", o_effect)){
	type = 1;
	size = _size;
	display_color = _color;
	lifetime = _time;
	alpha = _alpha;
}