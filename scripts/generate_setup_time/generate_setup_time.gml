//タイムライン関連の設定
global.generate_timeline_id = timeline_add();
timeline_index = global.generate_timeline_id;
timeline_running = true;

//敵の数データリセット
global.enemy_wave_total_amount = 0;
for(var i=0; i<SPAWN_ENEMY_TYPE_AMOUNT; i++){
	global.spawn_enemy[i, spawnenemy.amount] = 0;
	global.spawn_enemy[i, spawnenemy.objectid] = -1;
}

//敵出現時間指定 ルームとかウェーブごとにいちいち設定しよう！
//最低でも4f開けないとバグる
switch(global.stage){
#region stage-1 (teststage)
case -1:
	switch(global.wave_now){
	case 1:
		for(var i=1; i<=3; i++){
			for(var l=1; l<=12; l++){
				set_enemy_generate_timeline(i*300+l*15, global.generate_timeline_id, 0, 0, 0);
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
#region stage1
case 1:
	switch(global.wave_now){
	case 1://敵10体
		for(var i=0; i<10; i++){
			set_enemy_generate_timeline(i*60, global.generate_timeline_id, 0, 0, 0);
		}
	break
	case 2://fast*3 Small*7 Fast*3
		for(var i=0; i<3; i++){
			set_enemy_generate_timeline(i*30, global.generate_timeline_id, 0, 1, 0);
		}
		for(var i=0; i<7; i++){
			set_enemy_generate_timeline(i*60+90, global.generate_timeline_id, 0, 0, 0);
		}
		for(var i=0; i<3; i++){
			set_enemy_generate_timeline(i*45+510, global.generate_timeline_id, 0, 1, 0);
		}
	break
	case 3://Normal*3 Normal*3 Normal*3
		for(var i=0; i<3; i++){
			set_enemy_generate_timeline(i*60, global.generate_timeline_id, 0, 0, 0);
		}
		for(var i=0; i<3; i++){
			set_enemy_generate_timeline(i*60+180, global.generate_timeline_id, 0, 0, 0);
		}
		for(var i=0; i<3; i++){
			set_enemy_generate_timeline(i*60+420, global.generate_timeline_id, 0, 0, 0);
		}
	break
	case 4://NormalLv2*1 NormalLv1*2 NormalLv2*1 NormalLv1*3
		set_enemy_generate_timeline(30, global.generate_timeline_id, 0, 1, 0);
		for(var i=0; i<2; i++){
			set_enemy_generate_timeline(i*45+30, global.generate_timeline_id, 0, 0, 0);
		}
		set_enemy_generate_timeline(120+120, global.generate_timeline_id, 0, 1, 0);
		for(var i=0; i<3; i++){
			set_enemy_generate_timeline(i*45+240, global.generate_timeline_id, 0, 0, 0);
		}
	break
	case 5:
	
	break
	case 6:
	
	break
	}
break
#endregion
default:
	sdm("error! generate_setup_time");
break
}