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
case 2:
if(do_createevent){
	draw_set_color(display_color);
	draw_set_alpha(display_alpha);
	draw_primitive_begin(pr_trianglestrip);
	draw_vertex(x1, y1);
	draw_vertex(x2, y2);
	draw_vertex(x3, y3);
	draw_vertex(x4, y4);
	draw_primitive_end()
	draw_set_color(COLOR_DEFAULT);
	draw_set_alpha(1)
	
}
break
case 4:
	if(effect_delay <= 0){
		if(first_phase_time_now > 0){//第一段階 先端を動かす
			if(line_tip+line_tip_speed > 0){//対数を使っている わからん
				first_phase_time_now--
				var time_percent = 1-first_phase_time_now/first_phase_time_default;
				line_tip = (log2(time_percent*2)+5)/6// "/￣" みたいなグラフ
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
	}
	else{
		effect_delay--;
	}
	
	speed = effect_speed;
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

break
case 5:
	//最初に広がる円
	var time_percent = 1-total_time/total_time_default;
	circle_size = (log2(time_percent*2)+5)/6*effect_size // "/￣" みたいなグラフ
	total_time--;
	if(!surface_exists(surface_id)){
		surface_id = surface_create(effect_size*2, effect_size*2);//存在しないなら生成
	}
	var blast_size = 0;
	
	if(blaststart_time <= 0){
		//中央の爆発設定
		var blast_time = total_time_default-total_time-blaststart_time_default;
		var blast_time_default = total_time_default-blaststart_time_default;
		var blast_time_percent = blast_time/blast_time_default;
		blast_size = (log2(blast_time_percent*2)+5)/6*effect_size;
		blast_size = blast_time_percent*effect_size
	}
	else{
		blaststart_time--;
	}
	
	
	//描画
	surface_set_target(surface_id);
	draw_clear_alpha(c_black, 0)
	draw_set_color(effect_color);
	draw_set_alpha(effect_alpha);
	
	if(blast_size > 0){
		var circle_smooth = 20//円の滑らかさ
		var circle_addangle = 360/circle_smooth
		draw_primitive_begin(pr_trianglestrip);
		for(var i=0; i<circle_smooth+1; i++){
			//奇数の点設定 外側の円
			var angle = circle_addangle*i
			var temp_x = lengthdir_x(circle_size, angle)+effect_size;
			var temp_y = lengthdir_y(circle_size, angle)+effect_size;
			draw_vertex(temp_x, temp_y);
			var angle2 = angle
			var angle2 = point_direction(blast_x, blast_y, temp_x-effect_size, temp_y-effect_size);
			
			//偶数 内側の円
			var temp_x2 = lengthdir_x(blast_size, angle2)+effect_size+blast_x;
			var temp_y2 = lengthdir_y(blast_size, angle2)+effect_size+blast_y;
			//draw_line_color(temp_x, temp_y, temp_x2, temp_y2, c_blue, c_blue) テスト用
			//内側の円が外側の円からはみ出ようとした時にはみ出ないように
			if(angle2 > 90 and angle2 < 270){
				if(temp_x > temp_x2){
					temp_x2 = temp_x;
				}
			}
			else{
				if(temp_x < temp_x2){
					temp_x2 = temp_x;
				}
			}
			if(angle2 < 180){
				if(temp_y > temp_y2){
					temp_y2 = temp_y
				}
			}
			else{
				if(temp_y < temp_y2){
					temp_y2 = temp_y
				}
			}
			//描画
			draw_vertex(temp_x2, temp_y2);
			
		}
		draw_primitive_end();
		/*
		draw_set_alpha(0);
		draw_set_color(c_black);
		draw_circle(effect_size, effect_size, blast_size, false);
		draw_set_alpha(1);*/
	}
	else{
		draw_circle(effect_size, effect_size, circle_size, false);
	}
	surface_reset_target();
	draw_set_color(COLOR_DEFAULT);
	draw_set_alpha(1);
	draw_surface(surface_id, x-effect_size, y-effect_size);
	
break
}