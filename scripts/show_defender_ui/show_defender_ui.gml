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
						ui_window_width = 300;//要調整
						ui_window_height = 200;
						//オブジェクトの座標によってウィンドウの表示箇所をかえる 仮 なんかうざそうならもうちょっと凝る
						if(finded_defender_id.x < room_width/2){
							ui_window_x = finded_defender_id.x+16;
						}
						else{
							ui_window_x = finded_defender_id.x-ui_window_width-16;
						}
						if(finded_defender_id.y < room_height/2){
							ui_window_y = finded_defender_id.y-16;
						}
						else{
							ui_window_y = finded_defender_id.y-ui_window_height+16;
						}
						
						usefulwindow(s_window, 0, ui_window_x, ui_window_y, ui_window_width, ui_window_height, 1,0.8);
						//surface_set_target(global.usefulwindow_surface[0]);
						if(surface_exists(defender_ui_surface)){
							surface_set_target(defender_ui_surface)
							draw_clear_alpha(c_black, 1);
							surface_reset_target();
						}
						
						defender_ui_surface = surface_create(ui_window_width, ui_window_height)//テキストとかを表示するsurface
						surface_set_target(defender_ui_surface)
						draw_clear_alpha(c_black, 0);
						draw_sprite(finded_defender_id.sprite_index, 0, 22, 24);//defenderの画像 32x32以外だと変になるかも middlecentreなのを忘れない
						draw_text(42, 6, finded_defender_id.defender_name);
						draw_set_color(c_gray);
						draw_text(4, 38, "Attack");
						draw_text(4, 38+16*2+4, "Speed");
						draw_text(4, 38+16*4+8, "Range");
						draw_set_color(c_dkgray);
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
	usefulwindow(s_window, 0, ui_window_x, ui_window_y, ui_window_width, ui_window_height, 1,0.8);
	draw_surface(defender_ui_surface, ui_window_x, ui_window_y);
	if(mouse_check_button_pressed(mb_left)){//どこかがクリックされた
		//if(mouse_x <= ui_window_x or ui_window_x+ui_window_width <= mouse_x or mouse_y <= ui_window_y or ui_window_y+ui_window_height <= mouse_y){
			//クリックされたのがウィンドウの外ならウィンドウを消す 嘘 それはなくなった
			show_window = false;
			surface_free(global.usefulwindow_surface[0]);//メモリ解放
			surface_free(defender_ui_surface)
			show_defender_ui()//他のがクリックされてたらそれに反応
		//}
	}
}

