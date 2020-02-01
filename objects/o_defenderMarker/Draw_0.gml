

//このマーカーに付けられた強化倍率 ほとんどのマーカーはなにもない 
if(enhancement){
	draw_set_font(FONT_ENHANCEMENT_MARKER_TEXT);
	draw_set_alpha(0.5);
	draw_set_halign(fa_middle)
	draw_set_color(COLOR_TEXT_LTGRAY);
	if(enhancement_attack > 0){
		if(subimage != 0){
			draw_enhancement_token(x, y, 0, enhancement_attack, COLOR_TEXT_RED, 6, 4);
		}
		else{
			draw_enhancement_token(x, y, 0, enhancement_attack, COLOR_TEXT_LTGRAY, 6, 4);
		}
	}
	if(enhancement_range > 0){
		if(subimage != 0){
			var token_color = make_color_rgb(65, 50, 90);
			draw_enhancement_token(x, y, 1, enhancement_range, make_color_rgb(65, 50, 90), 6, 4);
		}
		else{
			draw_enhancement_token(x, y, 1, enhancement_range, COLOR_TEXT_LTGRAY, 6, 4);
		}
	}
	if(enhancement_attackspeed > 0){
		if(subimage != 0){
			var token_color = make_color_rgb(0, 100, 100);
			draw_enhancement_token(x, y, 2, enhancement_attackspeed, make_color_rgb(0, 100, 100), 6, 4);
		}
		else{
			draw_enhancement_token(x, y, 2, enhancement_attackspeed, COLOR_TEXT_LTGRAY, 6, 4);
		}
	}
	draw_set_font(FONT_DEFAULT);
	draw_set_halign(fa_left)
	draw_set_alpha(1);
}


if(on_defender){
	draw_set_alpha(0.5)
}
draw_sprite(sprite_index, subimage, x, y);
if(subimage >= 1){subimage = 0}
draw_set_alpha(1);
