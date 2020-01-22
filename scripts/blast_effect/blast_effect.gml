///@param x,y,size,color,time

var _x = argument0;
var _y = argument1;
var _size = argument2;
var _color = argument3;
var _time = argument4;
var _alpha = argument5;

random_set_seed(date_current_datetime());
randomize();

//爆発の中心を決める
var _dir = random(360)
var _x2 = lengthdir_x(16, _dir);
var _y2 = lengthdir_y(16, _dir);

blast_circle(_x, _y, _x2, _y2, _size, _color, _time, 4, _alpha, 20);
/*
with(instance_create_layer(_x, _y, "Effects", o_effect)){
	type = 1;
	size = _size;
	display_color = _color;
	lifetime = _time;
	alpha = _alpha;
}*/