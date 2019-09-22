#region 敵データ格納

if(instance_exists(o_enemy)){
	global.enemy_amount = instance_number(o_enemy);//敵の総数取得
}
else{
	global.enemy_amount = 0;
}
i = 0;
//リセット
//global.enemy_x = 0;
//global.enemy_y = 0;
global.enemy_position = 0;
global.enemy_id = 0;
global.enemy_hp = 0

repeat(global.enemy_amount){
	if(instance_exists(o_enemy) != noone){//存在チェック
		//データを入れる
		//global.enemy_x[i] = instance_find(o_enemy, i).x;
		//global.enemy_y[i] = instance_find(o_enemy, i).y;
		global.enemy_hp[i] = instance_find(o_enemy, i).hp;
		global.enemy_id[i] = instance_find(o_enemy, i).id;
		global.enemy_position[i] = instance_find(o_enemy, i).path_position
		i++;
	}
}
#endregion

#region 敵データソート
if(global.enemy_amount != 0){
	sort_enemydata(sorttype.neargoal)
}


#endregion

#region shop処理
defender_shop()


#endregion

#region デバッグ用
if(DEBUGMODE or debug_mode){
	if(mouse_check_button(mb_middle)){
		global.gold++;
	}
	if(keyboard_check_pressed(ord("R"))){
		game_restart();
	}
	if(keyboard_check_pressed(vk_escape)){
		game_end()
	}
}
#endregion

#region キーボード操作
	if(keyboard_check(vk_control)){
		room_speed = FPS_DEFAULT*2;
	}
	else {
		room_speed = FPS_DEFAULT;
	}
	if(keyboard_check_pressed(vk_space)){
		if(global.gamestate = gamestate.main){
			global.gamestate = gamestate.pause;
			sdm("ポーズ")
		}
		else{
			global.gamestate = gamestate.main
			sdm("ポーズ解除")
		}
	}
	

#endregion

#region ゲームステート
switch(global.gamestate){
case gamestate.stagestart:
	global.gamestate = gamestate.main
break
case gamestate.main:
	
break
}

#endregion