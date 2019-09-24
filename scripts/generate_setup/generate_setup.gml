///ステージごとに出る敵、出てくる場所、ルートを決める
for(var i=0; i<SPAWN_ENEMY_TYPE_AMOUNT; i++){
	generate_enemy_type[i] = -1;
}

switch(global.stage){
case 0:
	set_spawner(0, -16, 288);
	route_type[0] = p_stage1route0;
	switch(global.wave_now){
	case 1:
		generate_enemy_type[0] = o_eNormal;
	break
	case 2:
		generate_enemy_type[0] = o_eNormal;
		generate_enemy_type[1] = o_eFast;
	break
	}
break	
	
case other:
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