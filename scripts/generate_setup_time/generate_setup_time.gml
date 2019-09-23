//タイムライン関連の設定
global.generate_timeline_id = timeline_add();
timeline_index = global.generate_timeline_id;
timeline_running = true;

//敵出現時間指定 ルームとかウェーブごとにいちいち設定しよう！
switch(room){
#region r_test
case r_test:
sdm(global.wave_now)
	switch(global.wave_now){
	case 1:
		for(var i=1; i<=3; i++){
			for(var l=1; l<=5; l++){
				set_enemy_generate_timeline(i*300+l*30, global.generate_timeline_id, 0, 0, 0);
				global.enemy_wave_total_amount++;
			}
		}
	break
	case 2:
		for(var i=1; i<=3; i++){
			for(var l=1; l<=5; l++){
				set_enemy_generate_timeline(i*300+l*30, global.generate_timeline_id, 0, 1, 0);
				global.enemy_wave_total_amount++;
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