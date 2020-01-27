///@param id,itemamount
var defender_id = argument0;
var item_amount = argument1;

var effect_x = defender_id.x;
var effect_y = defender_id.y;
var effect_range = 16;
var effect_freq = 10;
var effect_prob = 2

var upgrade_item_amount = 0;
for(var i=0; i<defender_id.itemslot_amount; i++){//アップグレード済みのアイテムを数える
	if(defender_id.itemslot[i] != -1){
		if(global.itemdata[defender_id.itemslot[i], itemdata.upgraded] = true){
			upgrade_item_amount++;
		}
	}
}
//アップグレード済みアイテムとそれ以外がどれぐらいの比率なのか
var upgrade_item_persent = upgrade_item_amount/item_amount;


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
		part_type_shape(particle_id, pt_shape_disk);
		part_type_size(particle_id, 0.06, 0.12, 0, 0);
		part_type_speed(particle_id, 0.1, 0.2, 0, 0,);
		part_type_direction(particle_id, 0, 360, 0, 0);
		
		//アップグレード済みアイテムの多さで色が変わったりする ランダム
		if(upgrade_item_persent < random(1)){
			part_type_color1(particle_id, COLOR_ITEM_EFFECT);
			part_type_alpha3(particle_id, 0, 0.35, 0);
		}
		else{
			part_type_color1(particle_id, COLOR_UPGRADE_EFFECT);
			part_type_alpha3(particle_id, 0.1, 0.6, 0);
		}
		
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