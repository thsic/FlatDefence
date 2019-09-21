///開始時処理
for(var i=0; i<=10; i++){//usefulwindowに必要
	global.usefulwindow_surface[i] = noone;
}

global.gamestate = gamestate.stagestart;
global.enemy_x = 0;
global.gold = 1000;//おかね
show_window = false;//defenderのステータス画面が開いているかどうか
shop_product = noone;
upgrade_ui = false;//upgrade画面が開いているかどうか
instance_create_layer(0, 0, "Instances", o_enemyGenerateMgr)

stage_setting();
database();//globalにいろいろデータをいれる

random_set_seed(date_current_datetime());
randomize();

for(var i=0; i<POSSESSION_ITEM_MAX; i++){//アイテム初期化 持てる数は12個まで
	global.item_possession[i] = 0;
}
global.item_possession[0] = 0;


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