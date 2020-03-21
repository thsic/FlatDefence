i = 0; //デバッグ用に敵優先順位表示
draw_set_color(c_white);
draw_set_alpha(1);
draw_set_halign(fa_left);
repeat(global.enemy_amount){
	if(instance_exists(global.enemy_neargoal_sorted_id[i])){
		draw_text(global.enemy_neargoal_sorted_id[i].x+16, global.enemy_neargoal_sorted_id[i].y, i)
		draw_text(global.enemy_neargoal_sorted_id[i].x+16, global.enemy_neargoal_sorted_id[i].y+-8, global.enemy_neargoal_sorted[i])
	}
	i++
}

//draw_point(mouse_x, mouse_y)
