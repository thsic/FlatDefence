draw_self();

if(target_id != false){
	if(instance_exists(target_id) and state = state.fire){
		//draw_line(x, y, target_id.x, target_id.y);
	}
}
draw_set_alpha(0.3);
if(state = state.idle){
	draw_set_color(c_aqua);
}
else{
	draw_set_color(c_gray);
}

draw_circle(x, y, range, true);
draw_set_alpha(1);
draw_set_color(c_white);
draw_bar("cooldown", cooldown, FPS_DEFAULT / attack_per_second, c_yellow, c_gray);
if(skill_id != -1){
	switch(skill_state){
	case skillstate.cooldown:
		draw_bar("skill", skill_cooldown, global.skilldata[skill_id, skilldata.cooldown], c_blue, c_gray);
	break
	case skillstate.up:
		draw_bar("skill", skill_cooldown, global.skilldata[skill_id, skilldata.cooldown], c_aqua, c_gray);
	break
	case skillstate.active:
		draw_bar("skill_active", skill_active_time, global.skilldata[skill_id, skilldata.skilltime], c_fuchsia, c_gray);
	break
	}
}
