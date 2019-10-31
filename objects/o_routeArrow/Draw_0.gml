//draw_sprite_ext(s_routeArrow, 0, xx, yy, 1, 1, direction, c_white, 0.5);

var dir = round(direction/90)*90
//残像
if(afterimage_cooldown = 0){
	var particle_id =  part_type_create()
	part_type_sprite(particle_id, sprite_index, false, false, false);
	part_type_alpha2(particle_id, 0.3, 0);
	part_type_life(particle_id, 30, 30);
	//part_type_direction(particle_id, direction, direction, 0, 0);
	part_type_orientation(particle_id, dir, dir, 0, 0, 0);
	var particle_system_id = part_system_create()
	part_particles_create(particle_system_id, x, y, particle_id, 1);
	afterimage_cooldown = 6;
}
else{
	afterimage_cooldown--
}
