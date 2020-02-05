///開始時処理
for(var i=0; i<=10; i++){//usefulwindowに必要
	global.usefulwindow_surface[i] = noone;
}

global.debugmode = DEBUGMODE
global.gamestate = gamestate.stagestart;
global.enemy_x = 0;


show_window = false;//defenderのステータス画面が開いているかどうか
shop_product = noone;
upgrade_ui = false;//upgrade画面が開いているかどうか
window_follow_enemy_id = -1;//敵ステータスウィンドウが追尾してるid
purchased_upgrade_orb = false;//お店でこうにゅうしたオーブかどうか
timemachine_grab = 0//タイムマシンが掴まれているかどうか
gameover_frame = -1//ゲームオーバーになってから経過した時間
stageclear_frame = -1;
change_room_frame_1 = -1;
change_room_frame_2 = -1;
change_screen = -1;//これから行くルームが入る

database();//globalにいろいろデータをいれる


random_set_seed(date_current_datetime());
randomize();

for(var i=0; i<POSSESSION_ITEM_MAX; i++){//アイテム初期化 持てる数は12個まで
	global.item_possession[i] = -1;
}


/*global.item_possession[0] = 1;
global.item_possession[1] = 0;*/



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