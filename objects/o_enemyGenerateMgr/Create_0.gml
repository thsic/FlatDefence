generate_enemy_type_now = 0;
spawner_type_now = 0;
route_type_now = 0;
switch(global.stage){
case -1:
	spowner_amount = 1;
	generate_setup_time()
	generate_setup()
	
break

case 1:
	spowner_amount = 1;
	generate_setup_time()
	generate_setup()
break
default:
	sdm("error!")
break
}
sdm(string(global.enemy_wave_total_amount)+"体の敵がタイムラインにセットされた")
