switch(room){
case r_test:
	spowner_amount = 1;
	set_spawner(0, 0, 200);
	
	
	
	timeline_index = tl_enemyGenelate;
	timeline_running = true;
	for(var i=1; i<5; i++){
		timeline_moment_add_script(tl_enemyGenelate, 50, generate_enemy(0, o_eNormal))
	}
	
	
	
break
case other:
sdm("error!")
break
}