///@param param,1linemaxparam,barX,barY,maxlength,color,alpha
var parameter = argument0;
var one_line_max_param = argument1;
var bar_x = argument2;
var bar_y = argument3;
var bar_maxlength = argument4;
var color = argument5;
var alpha = argument6;

var bar_percent = 0;
var bar_percent = parameter/one_line_max_param;

draw_set_alpha(alpha);
var value = color_get_value(color);
var saturation = color_get_saturation(color);
var hue = color_get_hue(color);


var bar_length = 0;
for(var i=0; i<floor(bar_percent)+1; i++){
	if(bar_percent-i > 1){
		bar_length = 1*bar_maxlength;
	}
	else{
		bar_length = (bar_percent-i)*bar_maxlength;
	}
	if(hue-i*35 < 0){
		hue = 360+(hue-i*35);
	}
	else{
		hue = hue-i*35;
	}
	draw_set_color(make_color_hsv(hue, saturation+i*10, value+i*15));
	draw_line(bar_x, bar_y, bar_x+bar_length, bar_y);
}
draw_set_alpha(1);
draw_set_color(COLOR_DEFAULT);
