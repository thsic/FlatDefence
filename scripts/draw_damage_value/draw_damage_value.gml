///@param x,y,damage
var _x = argument0;
var _y = argument1;
var _damage = argument2;
_x += irandom_range(-3, 3);


if(_damage < 50){
	rise_number(_damage, _x, _y-16, 1.5, 20, COLOR_TEXT_DKGRAY, 0.6, true, FONT_DAMAGE_VERYSMALL);
}
else if(_damage < 100){
	rise_number(_damage, _x, _y-16, 1.2, 40, COLOR_TEXT_DKGRAY, 0.7, true, FONT_DAMAGE_SMALL);
}
else if(_damage < 250){
	rise_number(_damage, _x, _y-16, 0.8, 60, COLOR_TEXT_DKGRAY, 0.9, true, FONT_DAMAGE_NORMAL);
}
else{
	rise_number(_damage, _x, _y-16, 0.6, 90, COLOR_TEXT_DKGRAY, 0.95, true, FONT_DAMAGE_BIG);
}
