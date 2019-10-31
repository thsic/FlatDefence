///@param path_amount
//spawner_type_nowの所にgenerate_enemy_type_nowが出てくる route_type_nowのルートをすすむ
var path_amount = argument0;

for(var i=0; i<path_amount; i++){
	with(instance_create_layer(o_enemyGenerateMgr.spawner_x[i], o_enemyGenerateMgr.spawner_y[i], "Effects", o_routeArrow)){
		path_start(o_enemyGenerateMgr.route_type[i], 6, 0, false)
	}
}
	