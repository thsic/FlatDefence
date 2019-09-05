///@param amount,x,y,spd,life,col,alpha,graduallytransparent

var amount = argument0;
var number_x = argument1;
var number_y = argument2;
var rise_speed = argument3;
var life = argument4;
var color = argument5;
var alpha = argument6;
var gradually_transparent = argument7;//徐々に透明にする

with(instance_create_layer(number_x, number_y, "UI", o_effect)){
	type = 0;
	text = amount;
	direction = 90;
	speed = rise_speed;
	lifetime = life;
	display_color = color;
	display_alpha = alpha;
	fade_alpha = gradually_transparent
}
