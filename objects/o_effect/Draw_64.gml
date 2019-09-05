switch(type){
case 0:
	draw_set_halign(fa_middle);
	draw_set_color(display_color);
	if(fade_alpha){
		draw_set_alpha(alarm[0]/lifetime*display_alpha);
	}
	else{
		draw_set_alpha(display_alpha);
	}
	draw_text(x, y, text);
	draw_set_halign(fa_left);
	draw_set_color(c_white);
	draw_set_alpha(1);
break
}