///ステージごとに出る敵、出てくる場所、ルートを決める

switch(room){
case r_test:
	set_spawner(0, 0, 288);
	generate_enemy_type[0] = o_eNormal;
	route_type[0] = p_stage1route0;
break	
	
}