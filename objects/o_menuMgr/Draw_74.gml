//ゲームオーバー時とクリア時は表示されない
if(global.gamestate != gamestate.gameover and global.gamestate != gamestate.stageclear){
	if(!menu_open){
		menu_open_button();
	}
	else{
		if(!option_open){
			menu_window()
		}
		else{
			option_window()
		}
	}
}
