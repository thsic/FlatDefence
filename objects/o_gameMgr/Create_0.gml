random_set_seed(date_current_datetime());
randomize();
usefulwindow_surface = noone;//usefulwindowに必要
global.enemy_x = 0;
show_window = false;//defenderのステータス画面が開いているかどうか



/*//ソートのテスト 使わない
i = 0;
repeat(10){
	amount[i] = irandom(10);
	global.enemy_id[i] = i;
	i++;
}
show_debug_message(amount)
show_debug_message(global.enemy_id)
quicksort(amount, global.enemy_id,0, 9, true);

show_debug_message("aaaaa")
show_debug_message(amount)
show_debug_message(enemy_id)