switch(type){
case 0:
	draw_set_halign(fa_middle);
	draw_set_font(text_font);
	draw_set_color(display_color);
	if(fade_alpha){
		draw_set_alpha(alarm[0]/lifetime*display_alpha);
	}
	else{
		draw_set_alpha(display_alpha);
	}
	draw_text(x, y, text);
	draw_set_font(FONT_DEFAULT);
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
		if(effect_size*2 > 1500){//surfaceがでかすぎるなら負荷軽減のためにサイズを小さくする
			surface_half_size = true
			effect_size /= 2
		}
		else{
			surface_half_size = false
		}
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
	draw_clear_alpha(c_black, 0);
	draw_set_color(effect_color);
	draw_set_alpha(effect_alpha);
	
	//if(blast_size > 0){
		var circle_smooth = polygon_number;//円の滑らかさ
		var circle_addangle = 360/circle_smooth;
		draw_primitive_begin(pr_trianglestrip);
		for(var i=0; i<circle_smooth+1; i++){
			//奇数の点設定 外側の円
			var angle = circle_addangle*i+circle_random_angle;
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
	/*}
	else{
		draw_circle(effect_size, effect_size, circle_size, false);
	}*/
	surface_reset_target();
	draw_set_color(COLOR_DEFAULT);
	draw_set_alpha(1);
	if(surface_half_size){
		draw_surface_ext(surface_id, x-effect_size*2, y-effect_size*2, 2, 2, 0, c_white, 1);
	}
	else{
		draw_surface_ext(surface_id, x-effect_size, y-effect_size, 1, 1, 0, c_white, 1);
	}
break
case 6:
	if(!draw_begin){
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
	}
break
case 7:
	var draw_score_total_time = 30
	time++;
	if(time <= draw_score_total_time){
		draw_score = floor(time/draw_score_total_time*score_total);
	}
	else{
		draw_score = score_total;
	}
	draw_set_color(text_color);
	draw_set_halign(text_halign);
	draw_set_font(FONT_STAGECLEAR_TOTALSCORE);
	draw_text(x, y, draw_score);
	draw_set_color(COLOR_DEFAULT);
	draw_set_halign(fa_left);
	draw_set_font(FONT_DEFAULT);
break
case 8:
	var star_amount = 7//星の数
	particle_type_id = part_type_create();
	part_type_shape(particle_type_id, pt_shape_star);
	part_type_size(particle_type_id, 0.15, 0.15, 0, 0);
	part_type_color1(particle_type_id, COLOR_UPGRADE_STAR_EFFECT);
	part_type_alpha3(particle_type_id, 1, 0.5, 0);
	part_type_life(particle_type_id, 80, 90);
	part_type_speed(particle_type_id, 1.8, 2.4, 0, 0);
	part_type_gravity(particle_type_id, 0.05, 270);
	particle_system_id = part_system_create()
	repeat(2){
		for(var i=0; i<star_amount; i++){
			var correction_value = irandom(32/star_amount)+i*(32/star_amount);
			correction_value -= 16;
			var star_direction = 90+correction_value;
			part_type_direction(particle_type_id, star_direction, star_direction, 0, 0);
			var _x = x-correction_value;
			var _y = irandom_range(-8, 8)+y;
			part_particles_create(particle_system_id, _x, _y, particle_type_id, 1);
		}
	}
	instance_destroy();
break
case 9://アップグレード時の四角を少し遅れて表示するだけのエフェクト
	if(effect_delay < 0){
		var particle_id = part_type_create();
		part_type_sprite(particle_id, s_partSquare, false , 0, 0);
		part_type_alpha3(particle_id, 0.9, 0.7, 0);
		part_type_life(particle_id, 16, 16);
		part_type_size(particle_id, 1, 1, 0, 0);
		part_type_speed(particle_id, 0.2, 0.2, 0.01, 0);
		part_type_color1(particle_id, effect_color);
		part_type_direction(particle_id, direction, direction, 0, 0)
		part_type_orientation(particle_id, direction, direction, 0, 0, 0);
		var particle_system_id = part_system_create();
		part_particles_create(particle_system_id, x, y, particle_id, 1);
		
		instance_destroy()
	}
	else{
		effect_delay--;
	}
	
break
case 10://クリア画面の一番ダメージをだしたやつ描画
	
	var opacity = false
	if(time > 0){
		time--;
	}
	else{
		opacity = true
	}
	var no1_defender_sprite = global.defender_data[no1_defender_id.defender_number, data.scalesprite];
	var alpha = 1-(time/time_default)
	draw_set_alpha(alpha/3);
	draw_set_color(c_dkgray);
	draw_rectangle(x, y, x+(view_wport[0]/2-x)*2, y+88, false)
	draw_set_alpha(alpha);
	draw_sprite_ext(no1_defender_sprite, 0, x+32, y+32*1.6, 1, 1, 0, c_white, alpha);
	draw_set_halign(fa_middle);
	draw_set_color(COLOR_TEXT_WHITE);
	draw_text(view_wport[0]/2, y+4, MOST_DAMAGING_DEFENDER_TEXT);
	
	draw_set_halign(fa_left);
	draw_set_color(COLOR_TEXT_LTGRAY);
	draw_text(x+64, y+24, global.defender_data[no1_defender_id.defender_number, data.name]);
	draw_text(x+182, y+24, "Damage");
	draw_set_color(COLOR_TEXT_WHITE);
	draw_text(x+246, y+24, no1_defender_id.total_damage);
	
	for(var i=0; i<no1_defender_id.itemslot_amount; i++){
		var item_id = no1_defender_id.itemslot[i]
		if(item_id != -1){
			draw_set_alpha(alpha)
			draw_sprite(global.itemdata[item_id, itemdata.sprite], 0, x+64+16+i*36, y+44+16);
		}
		else{
			draw_set_alpha(alpha/3)
			draw_sprite(s_itemSlot, 0, x+64+16+i*36, y+44+16);
		}
	}
	draw_set_alpha(1);
	draw_set_color(COLOR_DEFAULT);

break
case 11://アイテムドロップ
if(time < 0){
	instance_destroy()
	
	var line_amount = 8
	var line_addangle = 360/line_amount
	var angle_default = 90
	var color = COLOR_ITEM_EQUIP_EFFECT
	
	for(var i=0; i<line_amount; i++){
		var angle = line_addangle*-i+angle_default
		var line_x = lengthdir_x(36, angle)+x;
		var line_y = lengthdir_y(36, angle)+y;
		line_effect(line_x, line_y, 12, angle, 6, 8, color, 2, 12, 0);
	}
	get_item(item_number);
}
else{
	time--;
}

_hspeed += _gravity;
var sprite_id = global.itemdata[item_number, itemdata.sprite];

if(sign(_hspeed) and y_default < y){
	y = y_default;
	_hspeed = -_hspeed/2;
}
draw_sprite(sprite_id, 0, x, y);
y += _hspeed;
break

}