image_speed = 0;
on_defender = false;
subimage = 0;
enhancement = false
if(enhancement_attack or enhancement_range or enhancement_attackspeed){
	enhancement = true;
}
if(id != instance_position(x, y, o_defenderMarker)){//マーカーが重なってるとバグるので消える
	instance_destroy()
}