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
						//defender_ui_text(ui_window_x, ui_window_y, ui_window_width, ui_window_height);
						
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
	defender_ui_text(ui_window_x, ui_window_y, ui_window_width, ui_window_height);
	if(mouse_check_button_pressed(mb_left)){//どこかがクリックされた
		//if(mouse_x <= ui_window_x or ui_window_x+ui_window_width <= mouse_x or mouse_y <= ui_window_y or ui_window_y+ui_window_height <= mouse_y){
		show_window = false;
		if(surface_exists(global.usefulwindow_surface[0])){//存在チェック
			surface_set_target(global.usefulwindow_surface[0])
			draw_clear_alpha(c_black, 0);//これがないとなんかwindowを表示する度濃くなる
			surface_reset_target();
		}
		surface_free(global.usefulwindow_surface[0]);//メモリ解放
		show_defender_ui()//他のがクリックされてたらそれに反応
		//}
	}
}

