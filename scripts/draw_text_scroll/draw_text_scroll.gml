///@param x,y,text,width
var _x = argument0;
var _y = argument1;
var _text = argument2;
var _width = argument3;
var _scrollspeed = 1;
var _positionreset_cooldown = 30;
var text_total_width = string_width(_text);

surface_free(global.text_scroll_surface);
if(!surface_exists(global.text_scroll_surface)){
	global.text_scroll_surface = surface_create(_width, string_height(_text));
}
surface_set_target(global.text_scroll_surface);
draw_clear_alpha(c_black, 0);
if(_width - global.text_scroll_position < text_total_width){
	global.text_scroll_position -= _scrollspeed;
}
else{
	global.text_scroll_position = 0;
}
draw_text(global.text_scroll_position, 0, _text);
surface_reset_target()
draw_surface(global.text_scroll_surface, _x, _y);

