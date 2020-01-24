if(mouse_check_button(mb_left)){
	if(window_follow_enemy_id != -1){
		window_follow_enemy_id = -1;//どこかクリックされると解除
		surface_free(global.usefulwindow_surface[3])
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
		tiny_window(s_window, 3, x_offset, y_offset, 120, 68, 0.8);
		draw_set_color(COLOR_TEXT_WHITE);
		draw_sprite_ext(window_follow_enemy_id.sprite_index, 0, x_offset+14, y_offset+14, 0.5, 0.5, 0, COLOR_DEFAULT, 1)
		draw_text(x_offset+32, y_offset+2, window_follow_enemy_id.name);
		if(window_follow_enemy_id.hp >= 0){
			draw_text(x_offset+80, y_offset+28, window_follow_enemy_id.hp);
		}
		else{
			draw_text(x_offset+80, y_offset+28, 0);
		}
		if(window_follow_enemy_id.shield >= 0){
			draw_text(x_offset+80, y_offset+40, window_follow_enemy_id.shield);
		}
		else{
			draw_text(x_offset+80, y_offset+28, 0);
		}
		draw_set_color(COLOR_TEXT_GRAY);
		draw_text(x_offset+6, y_offset+28, "HP");
		draw_text(x_offset+6, y_offset+40, "Shield");
		
		draw_set_color(COLOR_DEFAULT);
	}
	else{
		window_follow_enemy_id = -1;//存在しないのでデフォルトに戻す
	}
}