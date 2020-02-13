///@param spr,subimage1,subimage2,subimage3,x,y
//クリックされたときにtrueをかえします
//使わないsubimageは-1を入れる

var sprite = argument0;
var subimage_natural = argument1;
var subimage_on_mouse = argument2;
var subimage_clicked = argument3;//使ってない
var button_x = argument4;
var button_y = argument5;
var text = argument6;
var text_color = argument7;

var button_width = sprite_get_width(sprite);
var button_height = sprite_get_height(sprite);

var clicked = false;
var subimage = subimage_natural;
if(button_x < mouse_x and mouse_x < button_x+button_width){
	if(button_y < mouse_y and mouse_y < button_y+button_height){
		if(mouse_check_button_pressed(mb_left)){
			clicked = true;
		}
		else{
			if(subimage_on_mouse != -1){
				subimage = subimage_on_mouse;
			}
		}
	}
}

draw_sprite(sprite, subimage, button_x, button_y);
draw_set_halign(fa_middle);
draw_set_valign(fa_middle);
draw_text_color(button_x+button_width/2, button_y+button_height/2, text, text_color, text_color, text_color, text_color, 1);
draw_set_halign(fa_left);
draw_set_valign(fa_left);


return clicked
