//突破された
global.life--


var goal_x = path_get_x(o_enemyGenerateMgr.route_type_now, 1)+o_enemyGenerateMgr.spawner_x[0]
var goal_y = path_get_y(o_enemyGenerateMgr.route_type_now, 1)+o_enemyGenerateMgr.spawner_y[0]

repeat(10){
	disk_effect(goal_x, goal_y, COLOR_LIFEBLOOD, 1, 20, 0.4, 90);
}
	