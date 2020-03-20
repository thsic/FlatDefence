///@param moment,timeline_ind,spawner_number,enemy_number,route_number
//タイムラインにいろいろとセットする 最低でも4f以上間隔が空いていないといけない
var moment = argument0;
var timeline_ind = argument1;
var spawner_number = argument2;
var enemy_number = argument3;
var route_number = argument4;

moment += 5 //バグ防止のため5f遅らせる
//敵の数をデータにいれる処理
global.enemy_wave_total_amount++;
global.spawn_enemy[enemy_number, spawnenemy.amount]++;

if(global.stage >= 5){
	switch(spawner_number){
	case 0:
		generate_enemy_spawner0[enemy_number] += 1;
	break
	case 1:
		generate_enemy_spawner1[enemy_number] += 1;
	break
	default:
		sdm("error! set_enemy_generate_timeline");
	break
	}
}

switch(enemy_number){
case 0:
	timeline_moment_add_script(timeline_ind, moment-3, timeline_set_enemytype_0);
break
case 1:
	timeline_moment_add_script(timeline_ind, moment-3, timeline_set_enemytype_1);
break
case 2:
	timeline_moment_add_script(timeline_ind, moment-3, timeline_set_enemytype_2);
break
case 3:
	timeline_moment_add_script(timeline_ind, moment-3, timeline_set_enemytype_3);
break
case 4:
	timeline_moment_add_script(timeline_ind, moment-3, timeline_set_enemytype_4);
break
case other:
	sdm("error! set_enemy_generate_timeline")
break
}
switch(spawner_number){
case 0:
	timeline_moment_add_script(timeline_ind, moment-2, timeline_set_spawnertype_0);
break
case 1:
	timeline_moment_add_script(timeline_ind, moment-2, timeline_set_spawnertype_1);
break
case 2:
	timeline_moment_add_script(timeline_ind, moment-2, timeline_set_spawnertype_2);
break
case other:
	sdm("error! set_enemy_generate_timeline")
break
}
switch(route_number){
case 0:
	timeline_moment_add_script(timeline_ind, moment-1, timeline_set_routetype_0);
break
case 1:
	timeline_moment_add_script(timeline_ind, moment-1, timeline_set_routetype_1);
break
case 2:
	timeline_moment_add_script(timeline_ind, moment-1, timeline_set_routetype_2);
break
case other:
	sdm("error! set_enemy_generate_timeline")
break
	
}
timeline_moment_add_script(timeline_ind, moment, generate_enemy);