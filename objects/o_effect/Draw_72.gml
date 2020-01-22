if(draw_begin){
	switch(type){
	case 6:
		if(time < fall_time){
			time++;
			var time_percent = time/fall_time
			var temp = (time_percent-1)*(time_percent-1)+1;
			var text_y = y+fall_length*(1-temp);
			var alpha = 1-temp+1
		}
		else{
			var text_y = y;
			var alpha = 1
		}
		draw_set_font(text_font);
		draw_set_halign(text_halign);
		draw_set_color(display_color);
		draw_set_alpha(alpha);
		draw_text(x, text_y, text);
		draw_set_color(COLOR_DEFAULT);
		draw_set_halign(fa_left);
		draw_set_font(FONT_DEFAULT)
		draw_set_alpha(1);
	break
	}
}