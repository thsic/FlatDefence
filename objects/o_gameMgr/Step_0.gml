#region ゲームステート
switch(global.gamestate){
case gamestate.stagestart://ステージ開始時処理
	switch(room){
	case r_test:
		global.stage = -1;
	break
	case r_tutorial:
		global.stage = 1;
	break
	}
	
	global.enemy_amount = 0;
	global.wave_now = 0;
	global.timemachine[timemachine.window_x] = window_get_width()-SHOP_WINDOW_WIDTH-TIMEMACHINE_WIDTH-4;
	global.timemachine[timemachine.window_y] = window_get_height()-TIMEMACHINE_HEIGHT-4;
	timemachine_button_state[0] = 2;
	timemachine_button_state[1] = 0;
	timemachine_button_state[2] = 0;
	stage_setting();
	
	global.gamestate = gamestate.reststart;
break

case gamestate.reststart://休憩タイム開始
	rest_time = REST_TIME;
	global.wave_now++;
	instance_create_layer(0, 0, "Instances", o_enemyGenerateMgr);
	
	global.gamestate = gamestate.rest;
break

case gamestate.rest://ウェーブの間の休憩
	if(rest_time > 0){
		rest_time--;
	}
	else{
		global.gamestate = gamestate.wavestart;	
	}
break

case gamestate.wavestart://ウェーブ開始処理


	sdm("wave"+string(global.wave_now)+"開始")
	
	global.gamestate = gamestate.main;
break

case gamestate.main://ゲーム中処理
	#region ゲームメイン処理
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
	#endregion
	if(global.life <= 0){//ゲームオーバー
		global.gamestate = gamestate.gameover;
	}
	if(global.enemy_wave_total_amount <= 0){//敵が全員居なくなった
		global.gamestate = gamestate.waveclear;
	}
break

case gamestate.waveclear://ウェーブクリア処理
	sdm("wave"+string(global.wave_now)+"をクリア")
	instance_destroy(o_enemyGenerateMgr);
	timeline_delete(global.generate_timeline_id);//タイムラインを一旦全部けしてリセットする
	with(o_defender){
		cooldown = 0;//全てのdefenderのクールダウンを解消
		state = state.idle
	}
	if(global.life <= 0){//ゲームオーバー
		global.gamestate = gamestate.gameover;
	}
	global.gamestate = gamestate.reststart;
break

case gamestate.stageclear://ステージクリア処理

break

case gamestate.gameover://ゲームオーバー処理
	show_message("GameOver!");
	game_restart();
break

case gamestate.pause:

break

case gamestate.restpause:

break
}
#region shop処理 キーボード操作
switch(global.gamestate){
case gamestate.wavestart:
case gamestate.reststart:
case gamestate.rest:
case gamestate.restpause:
case gamestate.pause:
case gamestate.main:
case gamestate.waveclear:
case gamestate.stageclear:
	defender_shop();
	time_machine_process();
break
}
#endregion
#endregion

#region デバッグ用
	if(global.debugmode or debug_mode){
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
