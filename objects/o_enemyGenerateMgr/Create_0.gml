generate_enemy_type_now = 0;
spawner_type_now = 0;
route_type_now = 0;
switch(room){
case r_test:
	spowner_amount = 1;
	generate_setup()
	
	timeline_index = tl_enemyGenelateStage1;
	timeline_running = true;
	for(i=1; i<=60; i++){
		set_enemy_generate_timeline(i*5, tl_enemyGenelateStage1, 0, 0, 0);
	}
	

	
	
break
case other:
sdm("error!")
break
}