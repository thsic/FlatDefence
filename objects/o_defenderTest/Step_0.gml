target_id = -1;
target_x = -1;
target_y = -1;
for(i = 0; i <= global.enemy_amount; i++){
	if(instance_exists(global.enemy_neargoal_sorted_id[i])){
		if(point_distance(x, y, global.enemy_neargoal_sorted_id[i].x, global.enemy_neargoal_sorted_id[i].y) <= range){
			target_id = global.enemy_neargoal_sorted_id[i];
			target_x = target_id.x;
			target_y = target_id.y;
			break
		}
	}
}
