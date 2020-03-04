if(mouse_check_button_pressed(mb_left)){
	if(window_follow_enemy_id != -1){
		window_follow_enemy_id = -1;//どこかクリックされると解除
		surface_free(global.usefulwindow_surface[3]);
	}
	for(var i=0;i<global.enemy_amount; i++){
		if(instance_exists(global.enemy_id[i])){
			if(global.enemy_id[i].x-SPRITE_SIZE < mouse_x and mouse_x < global.enemy_id[i].x+SPRITE_SIZE){
				if(global.enemy_id[i].y-SPRITE_SIZE < mouse_y and mouse_y < global.enemy_id[i].y+SPRITE_SIZE){
					window_follow_enemy_id = global.enemy_id[i]
				
				}
			}
		}
	}
}
if(window_follow_enemy_id != -1){
	if(instance_exists(window_follow_enemy_id)){//存在チェック
		var x_offset = window_follow_enemy_id.x+SPRITE_SIZE;
		var y_offset = window_follow_enemy_id.y-SPRITE_SIZE;
		var enemy_description = global.enemydata[window_follow_enemy_id.enemy_number, enemydata.description];
		if(string_width(enemy_description)+12 > 130){//説明文の長さでwidth変える
			var window_width = string_width(enemy_description)+12
		}
		else{
			var window_width = 130;
		}
		tiny_window(s_window, 3, x_offset, y_offset, window_width, 98, 0.8);
		draw_set_color(COLOR_TEXT_WHITE);
		draw_sprite_ext(window_follow_enemy_id.sprite_index, 0, x_offset+14, y_offset+14, 0.5, 0.5, 0, COLOR_DEFAULT, 1)
		draw_text(x_offset+32, y_offset+6, window_follow_enemy_id.name);
		if(window_follow_enemy_id.hp >= 0){
			draw_text(x_offset+80, y_offset+28, string_format(window_follow_enemy_id.hp, 0, 0));
			draw_parambar(window_follow_enemy_id.hp, window_follow_enemy_id.hp_max, x_offset+6, y_offset+44, 100, COLOR_PARAMBAR_ENEMY, 1);
		}
		else{
			draw_text(x_offset+80, y_offset+28, 0);
		}
		draw_set_color(COLOR_TEXT_WHITE);
		if(window_follow_enemy_id.shield >= 0){
			draw_text(x_offset+80, y_offset+50, window_follow_enemy_id.shield);
			draw_parambar(window_follow_enemy_id.shield, global.enemydata[window_follow_enemy_id.enemy_number, enemydata.shield], x_offset+6, y_offset+66, 100, COLOR_PARAMBAR_ENEMY, 1);
		}
		else{
			draw_text(x_offset+80, y_offset+28, 0);
		}
		draw_set_color(COLOR_TEXT_GRAY);
		draw_text(x_offset+6, y_offset+28, "HP");
		draw_text(x_offset+6, y_offset+50, "Shield");
		draw_set_color(COLOR_TEXT_ORANGE);
		draw_text(x_offset+6, y_offset+72, enemy_description);
		draw_set_color(COLOR_DEFAULT);
	}
	else{
		window_follow_enemy_id = -1;//存在しないのでデフォルトに戻す
		surface_free(global.usefulwindow_surface[3])
	}
}