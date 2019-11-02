///@param x,y,score

var _x = argument0;
var _y = argument1;
var _draw_score = argument2;

with(instance_create_layer(_x, _y, "UI", o_effect)){
	type = 7;
	score_total = _draw_score;
	time = 0;
}
