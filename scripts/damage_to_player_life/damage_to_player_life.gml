//突破された

/*var goal_x = path_get_x(o_enemyGenerateMgr.route_type_now, 1)+o_enemyGenerateMgr.spawner_x[0]
var goal_y = path_get_y(o_enemyGenerateMgr.route_type_now, 1)+o_enemyGenerateMgr.spawner_y[0]*/

var goal_x = path_get_x(path_id, 1)+spawn_position_x;
var goal_y = path_get_y(path_id, 1)+spawn_position_y;


if(enemy_number = 21 or enemy_number = 22 or enemy_number = 23){//ボス
	global.life -= BOSS_LIFEDAMAGE;
	play_se(SE_DAMAGE_TO_LIFE, 70, 0.7, true);
	audio_sound_pitch(SE_DAMAGE_TO_LIFE, 0.5);
	repeat(30){
		disk_effect(goal_x, goal_y, COLOR_LIFEBLOOD_BOSS, 1, 35, 0.5, 90);
	}
}
else{
	global.life--
	play_se(SE_DAMAGE_TO_LIFE, 70, 0.6, true);
	audio_sound_pitch(SE_DAMAGE_TO_LIFE, 0.7);
	repeat(10){
		disk_effect(goal_x, goal_y, COLOR_LIFEBLOOD, 1, 20, 0.4, 90);
	}
}
if(global.life < 0){
	global.life = 0;
}





	