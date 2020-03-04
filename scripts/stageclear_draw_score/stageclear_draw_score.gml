///@param x,y,score,color

var _x = argument0;
var _y = argument1;
var _draw_score = argument2;
var color = argument3
var _halign = argument4;
var _new_record = argument5;
var _new_record_color = argument6;

with(instance_create_layer(_x, _y, "UI", o_effect)){
	type = 7;
	text_color = color;
	score_total = _draw_score;
	text_halign = _halign;
	new_record = _new_record;
	new_record_color = _new_record_color;
	time = 0;
}
