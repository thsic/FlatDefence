///@param x,y,xprev,yprev,dir,dirprev,color,alpha,time,width

var _x = argument0;
var _y = argument1;
var _xprev = argument2;
var _yprev = argument3;
var _direction = argument4;
var _dirprev = argument5;
var _color = argument6;
var _alpha = argument7;
var _lifetime = argument8;
var _linewidth = argument9




with(instance_create_layer(_x, _y, "Effects", o_effect)){
	type = 2;
	direction = _direction;
	effect_xprev = _xprev;
	effect_yprev = _yprev;
	effect_dirprev = _dirprev;
	linewidth = _linewidth;
	lifetime = _lifetime;
	display_color = _color;
	display_alpha = _alpha;
	alpha = _alpha;
}
