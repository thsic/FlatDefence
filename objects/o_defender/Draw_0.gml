draw_self();

if(target_id != false){
	if(instance_exists(target_id) and state = state.fire){
		draw_line(x, y, target_id.x, target_id.y);
	}
}
draw_circle(x, y, range, true);
draw_bar("cooldown", cooldown, room_speed / attack_per_second, c_aqua, c_gray);
