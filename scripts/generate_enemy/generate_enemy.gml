///敵を生成する
//spawner_type_nowの所にgenerate_enemy_type_nowが出てくる route_type_nowのルートをすすむ
if(generate_enemy_type_now != 0){ //o_gameMgrが生成されるバグが発生するため
	with(instance_create_layer(spawner_x[spawner_type_now], spawner_y[spawner_type_now], "Enemies", generate_enemy_type_now)){
		path_start(o_enemyGenerateMgr.route_type_now, speed, 0, false)
	}
}