///@param color,color2,var,value
//var=valueならcolor2 それ以外はcolor1になる
var color1 = argument0;
var color2 = argument1;
var variable = argument2;
var value = argument3;

if(variable = value){
	draw_set_color(color2);
}
else{
	draw_set_color(color1)
}
