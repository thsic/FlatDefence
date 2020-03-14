///ステージごとに出る敵、出てくる場所、ルートを決める
for(var i=0; i<SPAWN_ENEMY_TYPE_AMOUNT; i++){
	generate_enemy_type[i] = -1;
}

switch(global.stage){
case -1:
	set_spawner(0, -16, 272);
	route_type[0] = p_stage3route0;
	switch(global.wave_now){
	case 1:
		generate_enemy_type[0] = o_eBerserkerLv2;
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
case 2:
	set_spawner(0, -16, 464);
	route_type[0] = p_stage2route0;
	switch(global.wave_now){
	case 1:
		generate_enemy_type[0] = o_eSmallLv1;
	break
	case 2:
		generate_enemy_type[0] = o_eSmallLv1;
		generate_enemy_type[1] = o_eNormalLv1;
	break
	case 3:
		generate_enemy_type[0] = o_eSmallLv2;
		generate_enemy_type[1] = o_eNormalLv1;
		generate_enemy_type[2] = o_eFastLv1;
	break
	case 4:
		generate_enemy_type[0] = o_eNormalLv2;
		generate_enemy_type[2] = o_eFastLv2;
		generate_enemy_type[1] = o_eShieldLv1;
	break
	case 5:
		generate_enemy_type[0] = o_eShieldLv2;
	break
	case 6:
		generate_enemy_type[0] = o_eSmallLv3;
		generate_enemy_type[1] = o_eNormalLv2;
		generate_enemy_type[2] = o_eFastLv3;
	break
	case 7:
		generate_enemy_type[0] = o_eNormalLv2;
		generate_enemy_type[1] = o_eFastLv3;
		generate_enemy_type[2] = o_eShieldLv2;
	break
	}
break
case 3:
	set_spawner(0, -16, 304);
	route_type[0] = p_stage3route0;
	switch(global.wave_now){
	case 1:
		generate_enemy_type[0] = o_eNormalLv2;
		generate_enemy_type[1] = o_eSmallLv1;
		generate_enemy_type[2] = o_eShieldLv1;
	break
	case 2:
		generate_enemy_type[0] = o_eSmallLv2;
		generate_enemy_type[1] = o_eFastLv2;
		generate_enemy_type[2] = o_eToughLv1;
	break
	case 3:
		generate_enemy_type[0] = o_eShieldLv2;
		generate_enemy_type[1] = o_eToughLv2;
	break
	case 4:
		generate_enemy_type[0] = o_eNormalLv2;
		generate_enemy_type[1] = o_eSmallLv2;
		generate_enemy_type[2] = o_eFastLv3;
	break
	case 5:
		generate_enemy_type[0] = o_eSmallLv3;
		generate_enemy_type[1] = o_eFastLv3;
		generate_enemy_type[2] = o_eToughLv2;
	break
	case 6:
		generate_enemy_type[0] = o_eSmallLv2;
		generate_enemy_type[1] = o_eNormalLv3;
		generate_enemy_type[2] = o_eShieldLv3;
		generate_enemy_type[3] = o_eToughLv3;
	break
	}
break
case 4:
	set_spawner(0, -16, 432);
	route_type[0] = p_stage4route0;
	switch(global.wave_now){
	case 1:
		generate_enemy_type[0] = o_eNormalLv2;
		generate_enemy_type[1] = o_eShieldLv1;
		generate_enemy_type[2] = o_eShieldLv2;
	break
	case 2:
		generate_enemy_type[0] = o_eToughLv1;
		generate_enemy_type[1] = o_eToughLv2;
		generate_enemy_type[2] = o_eToughLv3;
	break
	case 3:
		generate_enemy_type[0] = o_eNormalLv3;
		generate_enemy_type[1] = o_eToughLv2;
		generate_enemy_type[2] = o_eShieldLv2;
	break
	case 4:
		generate_enemy_type[0] = o_eSmallLv2;
		generate_enemy_type[1] = o_eNormalLv2;
		generate_enemy_type[2] = o_eShieldLv2;
		generate_enemy_type[3] = o_eToughLv3;
	break
	}
break
case 5:
	set_spawner(0, 464, -16);
	set_spawner(1, -16, 368);
	route_type[0] = p_stage5route0;
	route_type[1] = p_stage5route1;
	
	switch(global.wave_now){
	case 1:
		generate_enemy_type[0] = o_eSmallLv1;
		generate_enemy_type[1] = o_eNormalLv1;
		generate_enemy_type[2] = o_eBerserkerLv1;
	break
	case 2:
		generate_enemy_type[0] = o_eSmallLv1;
		generate_enemy_type[1] = o_eNormalLv2;
		generate_enemy_type[2] = o_eFastLv1;
	break
	case 3:
		generate_enemy_type[0] = o_eSmallLv1;
		generate_enemy_type[1] = o_eSmallLv2;
		generate_enemy_type[2] = o_eShieldLv1;
	break
	case 4:
		generate_enemy_type[0] = o_eSmallLv2;
		generate_enemy_type[1] = o_eShieldLv2;
	break
	case 5:
		generate_enemy_type[0] = o_eSmallLv2;
		generate_enemy_type[1] = o_eBerserkerLv2;
		generate_enemy_type[2] = o_eShieldLv3;
	break
	case 6:
		generate_enemy_type[0] = o_eSmallLv2;
		generate_enemy_type[1] = o_eFastLv1;
		generate_enemy_type[2] = o_eBerserkerLv2;
		generate_enemy_type[3] = o_eShieldLv3;
	break
	}

break
case 6:
	set_spawner(0, -16, 368);
	set_spawner(1, 592, -16);
	route_type[0] = p_stage6route0;
	route_type[1] = p_stage6route1;
	
	switch(global.wave_now){
	case 1:
		generate_enemy_type[0] = o_eSmallLv1;
		generate_enemy_type[1] = o_eRegenLv1;
	break
	}
break
case 7:
	set_spawner(0, -16, 464);
	set_spawner(1, 528, -16);
	route_type[0] = p_stage7route0;
	route_type[1] = p_stage7route1;
	
	switch(global.wave_now){
	case 1:
		generate_enemy_type[0] = o_eSmallLv1;
		generate_enemy_type[1] = o_eRegenLv1;
	break
	}
break
case 8:

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