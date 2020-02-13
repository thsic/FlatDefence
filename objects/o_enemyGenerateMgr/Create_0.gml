generate_enemy_type_now = 0;
spawner_type_now = 0;
route_type_now = 0;
switch(global.stage){
case -1:
	spowner_amount = 1;
break
case 1:
	spowner_amount = 1;
break
case 2:
	spowner_amount = 1;
break
case 3:
	spowner_amount = 1;
break
default:
	sdm("error! o_enemyGenerateMgr")
	spowner_amount = 1;
break
}
generate_setup_time()
generate_setup()
	
sdm(string(global.enemy_wave_total_amount)+"体の敵がタイムラインにセットされた")