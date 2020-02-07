//ステータスとか表示
//drawイベント内に置くこと

if(upgrade_ui){//なんか意味ない
	var alpha = 0.88;
}
else{
	var alpha = 0.95;
}

if(upgrade_ui){
	ui_window_x = (view_wport[0]-SHOP_WINDOW_WIDTH-500)/2;
	ui_window_y = 40;
	ui_window_width = 550;
	ui_window_height = view_hport[0]-60;
	
	upgrade_window_process();//アップグレードウィンドウ表示
}

if(!show_window){
	if(mouse_check_button_pressed(mb_left)){
		for(i=0;i<=instance_number(o_defender);i++){
			finded_defender_id = instance_find(o_defender, i)
			if(instance_exists(finded_defender_id)){
				if(global.gamestate != gamestate.gameover and global.gamestate != gamestate.stageclear){//ゲームオーバーやクリア画面でない
					//ここらへんの16は判定の大きさ 要調整
					if(finded_defender_id.x-16 <= mouse_x and mouse_x <= finded_defender_id.x+16){
						if(finded_defender_id.y-16 <= mouse_y and mouse_y <= finded_defender_id.y+16){
							show_window = true;
							ui_window_width = 300;//要調整
							ui_window_height = 200;
							show_defender_ui_window();
							break//forからぬける
						}
					}
				}
			}
		}
	}
}
else{
	//windowが開かれている状態
	
	if(upgrade_ui){
		upgrade_ui_text(ui_window_x, ui_window_y, ui_window_width, ui_window_height);
	}
	else{
		sellbutton = 0;
		var sell = false;
		if(ui_window_x+ui_window_width-6-sprite_get_width(s_sellButton) < mouse_x and mouse_x < ui_window_x+ui_window_width-6){
			if(ui_window_y+6 < mouse_y and mouse_y < ui_window_y+6+sprite_get_height(s_sellButton)){
				sellbutton = 1;
				if(mouse_check_button(mb_left)){
					//defender売る
					sell = true
				}
			}
		}
		defender_ui_text(ui_window_x, ui_window_y, ui_window_width, ui_window_height);
		if(sell){
			sell_defender(finded_defender_id);
		}
	}
	if(mouse_check_button_pressed(mb_left) and !upgrade_ui){//どこかがクリックされた
		//if(mouse_x <= ui_window_x or ui_window_x+ui_window_width <= mouse_x or mouse_y <= ui_window_y or ui_window_y+ui_window_height <= mouse_y){
		show_window = false;
		if(surface_exists(global.usefulwindow_surface[0])){//存在チェック
			surface_set_target(global.usefulwindow_surface[0])
			draw_clear_alpha(c_black, 0);//これがないとなんかwindowを表示する度濃くなる
			surface_reset_target();
		}
		surface_free(global.usefulwindow_surface[0]);//メモリ解放
		surface_free(global.usefulwindow_surface[6]);//メモリ解放
		surface_free(global.usefulwindow_surface[7]);//メモリ解放
		show_defender_ui()//他のがクリックされてたらそれに反応
		//}
	}
	else if(global.gamestate = gamestate.gameover or global.gamestate = gamestate.stageclear){
		//ステージクリア画面とゲームオーバー画面では削除される
		show_window = false;
		if(surface_exists(global.usefulwindow_surface[0])){//存在チェック
			surface_set_target(global.usefulwindow_surface[0])
			draw_clear_alpha(c_black, 0);//これがないとなんかwindowを表示する度濃くなる
			surface_reset_target();
		}
		surface_free(global.usefulwindow_surface[0]);//メモリ解放
		surface_free(global.usefulwindow_surface[6]);//メモリ解放
		surface_free(global.usefulwindow_surface[7]);//メモリ解放
		show_defender_ui()//他のがクリックされてたらそれに反応
	}
}

