///@param x,y,color,alpha,time

var _x = argument0;
var _y = argument1;
var _color = argument2;
var _alpha = argument3;
var _lifetime = argument4;



with(instance_create_layer(_x, _y, "Effects", o_effect)){
	type = 2;
	direction = random(360);
	lifetime = _lifetime;
	display_color = _color;
	display_alpha = _alpha;
	alpha = _alpha
}
