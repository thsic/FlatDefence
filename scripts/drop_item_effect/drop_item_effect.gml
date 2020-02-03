///@param x,y,itemid,time
var _x = argument0;
var _y = argument1;
var item_id = argument2;
var _time = argument3;

with(instance_create_layer(_x, _y, "Effects", o_effect)){
type = 11;
time_default = _time;
x_default = _x;
y_default = _y;
time = _time;
item_number = item_id;
_hspeed = -7;
_gravity = 0.4;
	
}
