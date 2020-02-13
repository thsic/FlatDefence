draw_set_alpha(1);
//マウスカーソルを合わせるとちょっと薄く
if(o_gameMgr.grab_defender_id = -1 and o_gameMgr.grab_item_id = -1){
	if(x-16 < mouse_x and mouse_x < x+16){
		if(y-16 < mouse_y and mouse_y < y+16){
			draw_set_alpha(0.8);
		}
	}
}
draw_sprite(sprite_index, 0, x, y);
draw_set_alpha(1);

if(target_id != false){
	if(instance_exists(target_id) and state = state.fire){
		//draw_line(x, y, target_id.x, target_id.y);
	}
}

if(state = state.idle){//撃てる状態だとちょっと濃くなる
	draw_set_alpha(0.15);

}
else{
	draw_set_alpha(0.1);
	//draw_set_color(COLOR_CIRCLE_RANGE_COOLDOWN);
}

//円の色決める
var circle_color_default = global.defender_data[defender_number, data.color]
var circle_hue = color_get_hue(circle_color_default);
var circle_saturation = color_get_saturation(circle_color_default)+60;
var circle_value = color_get_value(circle_color_default)-60;
var circle_color = make_color_hsv(circle_hue, circle_saturation, circle_value);
draw_set_color(circle_color);

draw_circle(x, y, range, true);
draw_set_alpha(1);
draw_set_color(c_white);
draw_bar("cooldown", cooldown, FPS_DEFAULT / attack_per_second, COLOR_BAR_COOLDOWN, COLOR_BAR_COOLDOWN_UNDER);
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
