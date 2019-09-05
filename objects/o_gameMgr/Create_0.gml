///開始時処理
for(var i=0; i<=10; i++){//usefulwindowに必要
	global.usefulwindow_surface[i] = noone;
}

global.enemy_x = 0;
global.gold = 10000;//おかね
show_window = false;//defenderのステータス画面が開いているかどうか
shop_product = noone;

database();

random_set_seed(date_current_datetime());
randomize();

defender_ui_surface = noone;

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