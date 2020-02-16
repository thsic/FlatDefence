///@param spr,subimage1,subimage2,subimage3,x,y,text,color,monitorVar,monitorDent
//クリックされたときにtrueをかえします
//使わないsubimageは-1を入れる

var sprite = argument0;
var subimage_natural = argument1;
var subimage_on_mouse = argument2;
var subimage_clicked = argument3;
var button_x = argument4;
var button_y = argument5;
var text = argument6;
var text_color = argument7;
var monitor_valiable = argument8;
var monitor_valiable_dent = argument9//監視する変数がtrueの時にボタンが凹むかどうか

var button_width = sprite_get_width(sprite);
var button_height = sprite_get_height(sprite);


var clicked = false;
var subimage = subimage_natural;
//マウスが重なってたらsubimage変更
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

if(monitor_valiable != noone){
	var text_alpha = 0.5;//凹んだ状態じゃないとalphaが0.5
	if(monitor_valiable_dent = true and monitor_valiable = true){
		subimage = subimage_clicked;
		text_alpha = 1;
	}
	else if(monitor_valiable_dent = false and monitor_valiable = false){
		subimage = subimage_clicked;
		text_alpha = 1;
	}
}
else{
	var text_alpha = 1;//凹んだ状態が存在しないならもとからalphaが1
}

draw_sprite(sprite, subimage, button_x, button_y);
draw_set_halign(fa_middle);
draw_set_valign(fa_middle);
draw_text_color(button_x+button_width/2, button_y+button_height/2, text, text_color, text_color, text_color, text_color, text_alpha);
draw_set_halign(fa_left);
draw_set_valign(fa_top);


return clicked
