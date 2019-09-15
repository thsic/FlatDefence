switch(room){
case r_test:
	spowner_amount = 1;
	generate_setup()
	
	timeline_index = tl_enemyGenelateStage1;
	timeline_running = true;
	set_enemy_generate_timeline(50, tl_enemyGenelateStage1, 0, 0, 0);
	set_enemy_generate_timeline(100, tl_enemyGenelateStage1, 0, 0, 0);
	
	
break
case other:
sdm("error!")
break
}