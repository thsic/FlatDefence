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
var penetration = 0;
var penetration_plus = 0;
var freeze_all = 0;
var shield_break = 0;
var blast_damageup = 0;
var gold_get_plus = 0;
var gold_get = 0;

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
			ice_level++;//スロー +1されてるのはLV1は範囲スローで使ってるから
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
		case 6:
			penetration++;//貫通攻撃
		break
		case 7:
			penetration_plus++;//貫通攻撃アップグレード
		break
		case 12:
			freeze_all++;//あらゆる攻撃でスローに
		break
		case 14:
			shield_break++;//シールド破壊値+3
		break
		case 17://範囲攻撃中心だけダメージup
			blast_damageup++;
		break
		case 20:
			gold_get_plus++;
		case 22:
			gold_get++;
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

if(fire_level = 0){
	//通常
	if(target_id.shield > 0){//シールド削り
		if(shield_break > 0){//シールドブレイクがあるなら追加で削る
			for(var i=0; i<shield_break; i++){
				target_id.shield -= global.effectdata[14, effectdata.value];
			}
			if(target_id.shield <= SHIELD_BREAK_STRENGTH){
				target_id.shield = SHIELD_BREAK_STRENGTH;//あとで1削られるので1だけ残す
			}
		}
		target_id.shield -= SHIELD_BREAK_STRENGTH;
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
if(ice_level > 0){//スローをかける
	if(penetration or penetration_plus){
		//貫通攻撃の場合
		if(target_id = bullet_target){//攻撃対象に当たらないとスローにならない
			slow_to_enemy(target_id, ice_level+1, damage);
		}
		else if(freeze_all){//強化ロッドなら全部スローになる
			slow_to_enemy(target_id, ice_level+1, damage);
		}
	}
	else{
		//普通
		slow_to_enemy(target_id, ice_level+1, damage);
	}
	
}
if(demons_fire_level > 0){//悪魔の炎を持っているなら最終ダメージを上げる
	damage_result += demons_fire_level*global.effectdata[3, effectdata.value];
}
//最終的なダメージ
target_id.hp -= damage_result;
	
if(target_id.hp <= 0){//敵が死んだ
	target_id.destroy_enemy = true;
	global.gold += global.enemydata[enemy_id_conversion(target_id.object_index), enemydata.dropgold]//ゴールドを落とす
	
	if(gold_get){//ゴールドゲットあるならそれも
		global.gold += global.effectdata[22, effectdata.value]
	}
	if(gold_get_plus){
		var get_gold = global.enemydata[enemy_id_conversion(target_id.object_index), enemydata.dropgold]+global.effectdata[22, effectdata.value]
		global.gold += ceil(get_gold*global.effectdata[20, effectdata.value]);
	}
	
	if(cooldown_reduction_40 != 0){//撃破時クールダウン短縮があるなら
		if(penetration or penetration_plus){
			//貫通攻撃がついている場合は狙った対象が死んだ場合のみcd短縮が発動
			if(target_id = bullet_target){
				cooldown_reduction(defender_id, global.effectdata[4, effectdata.value], cooldown_reduction_40);
			}
		}
		else{
			//普通
			cooldown_reduction(defender_id, global.effectdata[4, effectdata.value], cooldown_reduction_40);
		}
	}
}

if(blast_level > 0){
	//範囲攻撃
	var blast_power = 2
	for(var i=0; i<blast_level; i++){
		blast_power *= 1.5;
	}
	blast_power -= 1;
	blast_effect(target_id.x, target_id.y, blast_power, c_maroon, 20);
	for(var i=0; i<global.enemy_amount; i++){
		var enemy_id = global.enemy_id[i]
		if(instance_exists(enemy_id)){
			if(point_distance(target_id.x, target_id.y, enemy_id.x, enemy_id.y) < EFFECT_BLAST_SIZE*blast_power){
				
				damage_result = damage/2;//爆風ダメージは半減する
				if(freeze_all){//強化ロッドなら爆風でもスロー
					slow_to_enemy(enemy_id, ice_level+1, damage);
				}
				if(blast_damageup){//クリスタルのダメージupあるなら
					if(point_distance(target_id.x, target_id.y, enemy_id.x, enemy_id.y) < EFFECT_BLAST_SIZE*blast_power/2){
						//爆風範囲の中心にいるとダメージup
						damage_result *= global.effectdata[17, effectdata.value];
					}
				}
				if(demons_fire_level > 0){//悪魔の炎を持っているなら最終ダメージを上げる
					damage_result += demons_fire_level*global.effectdata[3, effectdata.value];
				}
				
				//範囲内の敵にダメージを与える
				if(target_id != enemy_id){//ただしターゲットには既にダメージを与えているのであたえない
					enemy_id.hp -= damage_result;
				}
				
				/*//ターゲットにだけ通常攻撃時効果がつく
				if(target_id = enemy_id){
					//ターゲット死亡判定
					if(target_id.hp <= 0){
						target_id.destroy_enemy = true;
						global.gold += global.enemydata[enemy_id_conversion(target_id.object_index), enemydata.dropgold]//ゴールドを増やす
						if(cooldown_reduction_40 != 0){//撃破時クールダウン短縮があるなら
							cooldown_reduction(defender_id, global.effectdata[4, effectdata.value], cooldown_reduction_40);
						}
					}
				}*/
				
				//死亡判定
				if(enemy_id.hp <= 0){
					enemy_id.destroy_enemy = true;
					global.gold += global.enemydata[enemy_id_conversion(enemy_id.object_index), enemydata.dropgold];
				}
			}
		}
	}
}


