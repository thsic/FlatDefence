//ステータスとか表示
//drawイベント内に置くこと
if(!show_window){
	if(mouse_check_button_pressed(mb_left)){
		for(i=0;i<=instance_number(o_defender);i++){
			finded_defender_id = instance_find(o_defender, i)
			if(instance_exists(finded_defender_id)){
				//ここらへんの16は判定の大きさ 要調整
				if(finded_defender_id.x-16 <= mouse_x and mouse_x <= finded_defender_id.x+16){
					if(finded_defender_id.y-16 <= mouse_y and mouse_y <= finded_defender_id.y+16){
						//ウィンドウ表示
						show_window = true;
						ui_window_x = finded_defender_id.x+16;
						ui_window_y = finded_defender_id.y-16;
						ui_window_width = 300;//要調整
						ui_window_height = 200;
						usefulwindow(s_window, ui_window_x, ui_window_y, ui_window_width, ui_window_height, 1,0.8);
						surface_set_target(usefulwindow_surface);
						draw_sprite(finded_defender_id.sprite_index, 0, 22, 24);//defenderの画像 32x32以外だと変になるかも middlecentreなのを忘れない
						draw_text(42, 6, finded_defender_id.defender_name);
						draw_set_color(c_gray);
						draw_text(4, 38, "Attack");
						draw_text(4, 38+16*2+4, "Speed");
						draw_text(4, 38+16*4+8, "Range");
						draw_set_color(c_dkgray);
						//draw_text(50, 38+16*2+4, "(per second)");
						draw_set_color(c_white);
						draw_text(4, 38+16*1, finded_defender_id.fire_damage);
						draw_text(4, 38+16*3+4, finded_defender_id.attack_per_second);
						draw_text(4, 38+16*5+8, finded_defender_id.range);
						draw_set_color(c_white)
						surface_reset_target();
						break//forからぬける
					}
				}
			}
		}
	}
}
else{
	//windowが開かれている状態
	usefulwindow(s_window, ui_window_x, ui_window_y, ui_window_width, ui_window_height, 1,0.8);
	if(mouse_check_button_pressed(mb_left)){//どこかがクリックされた
		if(mouse_x <= ui_window_x or ui_window_x+ui_window_width <= mouse_x or mouse_y <= ui_window_y or ui_window_y+ui_window_height <= mouse_y){
			//クリックされたのがウィンドウの外ならウィンドウを消す
			show_window = false;
			surface_free(usefulwindow_surface);//メモリ解放
			show_defender_ui()//他のがクリックされてたらそれに反応
		}
	}
}

