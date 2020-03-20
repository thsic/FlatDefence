///@param path_amount
//spawner_type_nowの所にgenerate_enemy_type_nowが出てくる route_type_nowのルートをすすむ
var path_amount = argument0;

for(var i=0; i<path_amount; i++){
	var create_arrow = false;
	switch(i){
	case 0:
		for(var j=0; j<5; j++){
			if(o_enemyGenerateMgr.generate_enemy_spawner0[j] != 0){
				create_arrow = true;//ルートに敵が設定されていたら矢印描画
			}
		}
	break
	case 1:
		for(var j=0; j<5; j++){
			if(o_enemyGenerateMgr.generate_enemy_spawner1[j] != 0){
				create_arrow = true;//ルートに敵が設定されていたら矢印描画
			}
		}
	break
	default:
		create_arrow = true;
	break
	}
	
	if(create_arrow){
		with(instance_create_layer(o_enemyGenerateMgr.spawner_x[i], o_enemyGenerateMgr.spawner_y[i], "Effects", o_routeArrow)){
			path_start(o_enemyGenerateMgr.route_type[i], 6, 0, false);
		}
	}
}
	