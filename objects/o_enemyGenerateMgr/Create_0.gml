generate_enemy_type_now = 0;
spawner_type_now = 0;
route_type_now = 0;
switch(room){
case r_test:
	spowner_amount = 1;
	generate_setup()
	
	timeline_index = tl_enemyGenelateStage1;
	timeline_running = true;
	for(var i=1; i<=10; i++){
		for(var l=1; l<=5; l++){
			set_enemy_generate_timeline(i*300+l*30, tl_enemyGenelateStage1, 0, 0, 0);
		}
	}
	

	
	
break
case other:
sdm("error!")
break
}