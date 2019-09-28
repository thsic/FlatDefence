///@param damage,target_id,defenderid
//敵にダメージを与える
var damage = argument0;
var target_id = argument1;
var defender_id = argument2;


var fire_level = 0;
var ice_level = 0;
var blast_level = 0;
var demons_fire_level = 0;
var cooldown_reduction_40 = 0;
var cursed = 0;
//最初にエフェクトを確認しておく
for(var i=0; i<EFFECT_SLOT_MAX; i++){
	if(defender_id.effect_now[i, effectnow.number] != -1){
		//何かしらのエフェクトがある
		switch(defender_id.effect_now[i, effectnow.number]){
		case 0:	
			blast_level++;//攻撃時爆風発生
		break
		case 1:
			fire_level++;//貫通
		break
		case 2:
			ice_level++;//スロー
		break
		case 3:
			demons_fire_level++;//悪魔の炎
		break
		case 4:
			cooldown_reduction_40++;//撃破時クールダウン40%解消
		break
		case 5:
			cursed++;//スキル時以外攻撃不可
		break
		}
	}
	else{
		break
	}
}

if(cursed != 0){
	if(defender_id.skill_state != skillstate.active){
		damage = 0;//呪われているのでスキル中以外ダメージ0
	}
}
if(blast_level = 0){
	if(fire_level = 0){
		//通常
		if(target_id.shield > 0){//シールド削り
			target_id.shield -= 1
		}
		if(damage/10 > damage - target_id.shield){
			var damage_result = ceil(damage/10);//攻撃力の1/10は最低保障ダメージ
		}
		else{
			var damage_result = ceil(damage - target_id.shield);
		}
	}
	else{
		//炎属性
		var damage_result = damage;
	}
	if(demons_fire_level > 0){//悪魔の炎を持っているなら最終ダメージを上げる
		
		damage_result += demons_fire_level*global.effectdata[3, effectdata.value];
	}
	//最終的なダメージ
	target_id.hp -= damage_result;
	
	if(target_id.hp <= 0){
		target_id.destroy_enemy = true;
		global.gold += global.enemydata[enemy_id_conversion(target_id.object_index), enemydata.dropgold]//ゴールドを増やす
		if(cooldown_reduction_40 != 0){//撃破時クールダウン短縮があるなら
			cooldown_reduction(defender_id, global.effectdata[4, effectdata.value], cooldown_reduction_40);
		}
	}
}
else{
	//範囲攻撃
	blast_effect(target_id.x, target_id.y, 2*blast_level, c_maroon, 20);
	for(var i=0; i<global.enemy_amount; i++){
		var enemy_id = global.enemy_id[i]
		if(instance_exists(enemy_id)){
			if(point_distance(target_id.x, target_id.y, enemy_id.x, enemy_id.y) < EFFECT_BLAST_SIZE*blast_level){
				
				damage_result = damage;
				if(demons_fire_level > 0){//悪魔の炎を持っているなら最終ダメージを上げる
					damage_result += demons_fire_level*global.effectdata[3, effectdata.value];
				}
				//範囲内の敵にダメージを与える
				enemy_id.hp -= damage_result;
				
				//ターゲットにだけ通常攻撃時効果がつく
				if(target_id = enemy_id){
					//ターゲット死亡判定
					if(target_id.hp <= 0){
						target_id.destroy_enemy = true;
						global.gold += global.enemydata[enemy_id_conversion(target_id.object_index), enemydata.dropgold]//ゴールドを増やす
						if(cooldown_reduction_40 != 0){//撃破時クールダウン短縮があるなら
							cooldown_reduction(defender_id, global.effectdata[4, effectdata.value], cooldown_reduction_40);
						}
					}
				}
				
				//死亡判定
				if(enemy_id.hp <= 0){
					enemy_id.destroy_enemy = true;
					global.gold += global.enemydata[enemy_id_conversion(enemy_id.object_index), enemydata.dropgold];
				}
			}
		}
	}
}


