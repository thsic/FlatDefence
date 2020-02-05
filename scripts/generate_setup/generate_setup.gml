///ステージごとに出る敵、出てくる場所、ルートを決める
for(var i=0; i<SPAWN_ENEMY_TYPE_AMOUNT; i++){
	generate_enemy_type[i] = -1;
}

switch(global.stage){
case -1:
	set_spawner(0, -16, 272);
	route_type[0] = p_stage2route0;
	switch(global.wave_now){
	case 1:
		generate_enemy_type[0] = o_eNormalLv1;
	break
	case 2:
		generate_enemy_type[0] = o_eNormalLv1;
		generate_enemy_type[1] = o_eFastLv1;
	break
	}
break	
case 1:
	set_spawner(0, -16, 368);
	route_type[0] = p_stage1route0;
	switch(global.wave_now){
	case 1:
		generate_enemy_type[0] = o_eSmallLv1;
	break
	case 2:
		generate_enemy_type[0] = o_eSmallLv1;
		generate_enemy_type[1] = o_eFastLv1;
	break
	case 3:
		generate_enemy_type[0] = o_eNormalLv1;
	break
	case 4:
		generate_enemy_type[0] = o_eNormalLv1;
		generate_enemy_type[1] = o_eNormalLv2;
	break
	case 5:
		generate_enemy_type[0] = o_eSmallLv2;
		generate_enemy_type[1] = o_eNormalLv3;
	break
	case 6:
		generate_enemy_type[0] = o_eNormalLv2;
		generate_enemy_type[1] = o_eNormalLv3;
	break
	}
break
default:
	sdm("error! generate_setup")
break
}

for(var i=0; i<SPAWN_ENEMY_TYPE_AMOUNT; i++){//グローバル変数に出てくる敵を入れておく
	global.spawn_enemy[i, spawnenemy.objectid] = generate_enemy_type[i]//オブジェクトid

	//databaseでのnumberもいれておく
	for(var j=0; j<global.enemy_category_amount; j++){
		if(global.enemydata[j, enemydata.object] = global.spawn_enemy[i, spawnenemy.objectid]){
			global.spawn_enemy[i, spawnenemy.number] = j;
			break
		}
	}
}