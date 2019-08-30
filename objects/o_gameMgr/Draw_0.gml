i = 0;
repeat(global.enemy_amount){
	if(instance_exists(global.enemy_neargoal_sorted_id[i])){
		draw_text(global.enemy_neargoal_sorted_id[i].x, global.enemy_neargoal_sorted_id[i].y, i)
		//draw_text(global.enemy_neargoal_sorted_id[i].x-16, global.enemy_neargoal_sorted_id[i].y+-8, global.enemy_neargoal_sorted[i])
	}
	i++
}