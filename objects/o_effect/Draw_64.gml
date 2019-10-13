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
case 4:
	if(alarm[0] > 10){//第一段階 先端を動かす
		if(line_tip+line_tip_speed > 0){
			line_tip += line_tip_speed;
			line_tip_speed -= effect_acceleration;
		}
		else{
			line_tip = 0;
		}
	}
	else{//2段階
		if(line_terminal+line_terminal_speed < 1){
			line_terminal += line_terminal_speed;
			line_terminal_speed += effect_acceleration2;
		}
		else{
			line_terminal = 1
		}
	}
	
	var tip_x = lengthdir_x(effect_length*line_tip, direction)+x;
	var tip_y = lengthdir_y(effect_length*line_tip, direction)+y;
	var terminal_x = lengthdir_x(effect_length*line_terminal, direction)+x;
	var terminal_y = lengthdir_y(effect_length*line_terminal, direction)+y;
	
	draw_set_color(display_color);//描画
	draw_line(terminal_x, terminal_y, tip_x, tip_y);
	
break

}