generate_enemy_type_now = 0;
spawner_type_now = 0;
route_type_now = 0;
spawner_x = 0;
spawner_y = 0;
for(var i=0; i<5; i++){
	generate_enemy_spawner0[i] = 0;
	generate_enemy_spawner1[i] = 0;
}
switch(global.stage){
case -1:
	spowner_amount = 1;
break
case 1:
case 2:
case 3:
case 4:
	spowner_amount = 1;
break
case 5:
case 6:
case 7:
case 8:
	spowner_amount = 2;
break
default:
	sdm("error! o_enemyGenerateMgr")
	spowner_amount = 1;
break
}
generate_setup_time()
generate_setup()
	
sdm(string(global.enemy_wave_total_amount)+"体の敵がタイムラインにセットされた")