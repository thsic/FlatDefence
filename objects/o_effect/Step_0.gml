/// @description 生成時処理
if(!do_createevent){
	switch(type){
	case 0:
		alarm[0] = lifetime;
	break
	case 1:
		alarm[0] = lifetime;
	//赤い円を生成
		particle_id = part_type_create()
		part_type_shape(particle_id, pt_shape_ring);
		part_type_size(particle_id, size, size, 0, 0);
		part_type_color1(particle_id, display_color);
		part_type_life(particle_id, lifetime, lifetime);
		part_type_alpha3(particle_id, 0.2, 0.5, 0);
		particle_type_id = part_system_create();
		part_particles_create(particle_id, x, y, particle_type_id, 1);
	}
	do_createevent = true;
}