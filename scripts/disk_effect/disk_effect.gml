///@param x,y,color,alpha,time,size,dir

var _x = argument0;
var _y = argument1;
var _color = argument2;
var _alpha = argument3;
var _lifetime = argument4;
var _size = argument5;
var _direction = argument6;

random_set_seed(date_current_datetime())
randomize();


with(instance_create_layer(_x, _y, "Effects", o_effect)){
	type = 3;
	direction = _direction+random_range(-70, +70);
	lifetime = _lifetime+random_range(-10, 10);
	display_color = _color;
	display_alpha = _alpha;
	alpha = _alpha;
	effect_size = _size+random_range(-0.3, +0.3);
	effect_speed = 4.5+random_range(-2, +2);
}
