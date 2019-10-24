///@param x,y,itemamount,range,freq,probability
var effect_x = argument0;
var effect_y = argument1;
var item_amount = argument2;
var effect_range = 16;
var effect_freq = 10;
var effect_prob = 2;



if(item_equip_effect_time = 0){

	var particle_amount = 0
	for(var i=0; i<item_amount; i++){
		if(irandom(100) < effect_prob){
			particle_amount++ //アイテムの所持数分乱数で判定
		}
	}
	repeat(particle_amount){//判定が成功した回数だけパーティクル描画
		//エフェクト発生
		var particle_id = part_type_create();
		part_type_shape(particle_id, pt_shape_spark);
		part_type_color1(particle_id, COLOR_ITEM_EFFECT);
		part_type_size(particle_id, 0.06, 0.12, 0, 0);
		part_type_alpha3(particle_id, 0, 0.5, 0);
		part_type_speed(particle_id, 0.1, 0.2, 0, 0,);
		part_type_direction(particle_id, 0, 360, 0, 0);
		var particle_system_id = part_system_create();
		var particle_x = effect_x+irandom_range(-effect_range, effect_range);
		var particle_y = effect_y+irandom_range(-effect_range, effect_range);
		part_particles_create(particle_system_id, particle_x, particle_y, particle_id, 1);
		
		item_equip_effect_time = effect_freq;
	}
}
else{
	item_equip_effect_time--;
}