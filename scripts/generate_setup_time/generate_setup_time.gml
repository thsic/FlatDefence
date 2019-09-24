//タイムライン関連の設定
global.generate_timeline_id = timeline_add();
timeline_index = global.generate_timeline_id;
timeline_running = true;

//敵の数データリセット
global.enemy_wave_total_amount = 0;
for(var i=0; i<SPAWN_ENEMY_TYPE_AMOUNT; i++){
	global.spawn_enemy[i, spawnenemy.amount] = 0;
}

//敵出現時間指定 ルームとかウェーブごとにいちいち設定しよう！
//最低でも4f開けないとバグる
switch(global.stage){
#region stage0 (teststage)
case 0:
	switch(global.wave_now){
	case 1:
		for(var i=1; i<=3; i++){
			for(var l=1; l<=5; l++){
				set_enemy_generate_timeline(i*300+l*30, global.generate_timeline_id, 0, 0, 0);
			}
		}
	break
	case 2:
		for(var i=1; i<=3; i++){
			for(var l=1; l<=5; l++){
				set_enemy_generate_timeline(i*150+l*15, global.generate_timeline_id, 0, 0, 0);
			}
		}
		for(var i=1; i<=3; i++){
			for(var l=1; l<=5; l++){
				set_enemy_generate_timeline(i*150+l*15+5*150, global.generate_timeline_id, 0, 1, 0);
			}
		}
	break
	}
	
break
#endregion -----------------

case other:
	sdm("error! generate_setup_time");
break
}