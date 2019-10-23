///@param x,y,itemid
var effect_x = argument0;
var effect_y = argument1;
var itemid = argument2;
var color = c_yellow

blast_circle(effect_x, effect_y, 0, 0, 48, color, 20, 8, 1);

var line_amount = 8
var line_addangle = 360/line_amount
var angle_default = 90

for(var i=0; i<line_amount; i++){
	var angle = line_addangle*-i+angle_default
	var line_x = lengthdir_x(48, angle)+effect_x;
	var line_y = lengthdir_y(48, angle)+effect_y;
	line_effect(line_x, line_y, 16, angle, 6, 8, color, 2, 12);
}

