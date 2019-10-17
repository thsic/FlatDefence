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
	
		
	if(first_phase_time_now > 0){//第一段階 先端を動かす
		
		if(line_tip+line_tip_speed > 0){//対数を使っている わからん
			first_phase_time_now--
			var time_percent = 1-first_phase_time_now/first_phase_time_default;
			line_tip = (log2(time_percent*2)+5)/6// "/￣" みたいなグラフ
			/*var bottom = 2
			var power_max = logn(bottom, 100);//6.64
			var time_percent = 1-first_phase_time_now/first_phase_time_default;
			line_tip = power(bottom, power_max*time_percent);
			sdm(line_tip)*/
		}
		else{
			line_tip = 0;
		}
	}
	else{//2段階
		if(line_terminal+line_terminal_speed < 1){
			second_phase_time_now--
			var bottom = 2
			var power_max = logn(bottom, 100);
			var time_percent = 1-second_phase_time_now/second_phase_time_default;
			line_terminal = power(bottom, power_max*time_percent)/100;
			
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
	
	var xx = lengthdir_x(effect_size/2, direction+90);
	var yy = lengthdir_y(effect_size/2, direction+90);
	draw_primitive_begin(pr_trianglestrip);
	draw_vertex(terminal_x+xx, terminal_y+yy);
	draw_vertex(terminal_x-xx, terminal_y-yy);
	draw_vertex(tip_x+xx, tip_y+yy);
	draw_vertex(tip_x-xx, tip_y-yy);
	draw_primitive_end();
	/*draw_circle(terminal_x, terminal_y, effect_size, false);//末端の円
	draw_circle(tip_x, tip_y, effect_size, false);//先端の円*/

	//draw_line(terminal_x, terminal_y, tip_x, tip_y);
	
break

}