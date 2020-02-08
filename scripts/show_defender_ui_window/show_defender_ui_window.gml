///@param


//ウィンドウ表示
//オブジェクトの座標によってウィンドウの表示箇所をかえる 仮 なんかうざそうならもうちょっと凝る

if(finded_defender_id.x+ui_window_width < view_wport[0]-SHOP_WINDOW_WIDTH-96){
	ui_window_x = finded_defender_id.x+SPRITE_SIZE;
}
else{
	ui_window_x = finded_defender_id.x-ui_window_width-SPRITE_SIZE;
}
if(finded_defender_id.y+ui_window_height < view_hport[0]){
	ui_window_y = finded_defender_id.y-SPRITE_SIZE;
}
else{
	ui_window_y = finded_defender_id.y-ui_window_height+SPRITE_SIZE;
}


						
usefulwindow(s_window, 0, ui_window_x, ui_window_y, ui_window_width, ui_window_height, 1,0.8);
